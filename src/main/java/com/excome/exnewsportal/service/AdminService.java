package com.excome.exnewsportal.service;

import com.excome.exnewsportal.domain.Post;
import com.excome.exnewsportal.domain.Role;
import com.excome.exnewsportal.domain.User;
import com.excome.exnewsportal.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

@Service
public class AdminService {
    private final UserService userService;
    private final UserRepository userRepository;
    private final PostService postService;

    public AdminService(UserService userService, PostService postService, UserRepository userRepository) {
        this.userService = userService;
        this.postService = postService;
        this.userRepository = userRepository;
    }

    public boolean changeUser(Map<String, String> userForm, Long userId) {
        User user = getUserById(userId);
        if(user == null){
            return false;
        }
        Set<Role> roles = userService.getRoles();
        user.getRoles().clear();
        for (Map.Entry<String, String> s : userForm.entrySet()) {
            switch (s.getKey()) {
                case "email":
                    user.setEmail(s.getValue());
                    break;
                case "username":
                    user.setUsername(s.getValue());
                    break;
                case "surname":
                    user.setSurname(s.getValue());
                    break;
                case "name":
                    user.setName(s.getValue());
                    break;
                case "patronymic":
                    user.setPatronymic(s.getValue());
                    break;
            }
            if (s.getKey().contains("Role")) {
                for (Role role : roles) {
                    if (userForm.get(s.getKey()).equals(role.getName())) {
                        user.getRoles().add(role);
                    }
                }
            }
        }
        userRepository.save(user);
        return true;
    }

    public boolean changeUserPass(Map<String, String> form, Long userId, Principal principal) {
        User userFromDb = getUserById(userId);
        User admin = getUserByUsername(principal.getName());
        if(userFromDb == null || admin == null) {
            return false;
        }
        String newPass = form.get("password");
        String newPassConf = form.get("passwordConfirm");
        String adminPass = form.get("adminPassword");
        if(newPass.equals(newPassConf) && userService.bCryptPasswordEncoder.matches(adminPass, admin.getPassword())){
            userFromDb.setPassword(userService.bCryptPasswordEncoder.encode(newPass));
            userRepository.save(userFromDb);
        }
        return true;
    }

    public boolean deleteUser(Long userId){
        if(userRepository.findById(userId).isPresent()){
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }


    public User getUserById(Long userId){
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElse(new User());
    }

    public User getUserByUsername(String username){
        return userService.getUserByUsername(username);
    }

    public Set<Role> getRoles(){
        return userService.getRoles();
    }

    public List<User> getLastUsers() {
        return userRepository.findLastUser();
    }

    public List<User> getUsersByUsername(String username) {
        return userRepository.findUsersByUsername(username);
    }

    public List<Post> getPostsByTopic(String topic){
        return postService.getPostsByTopic(topic);
    }

    public List<Post> getLastPosts(){
        return postService.getLastPosts();
    }
}

