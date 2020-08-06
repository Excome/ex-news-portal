package com.excome.exnewsportal.service;

import com.excome.exnewsportal.domain.Post;
import com.excome.exnewsportal.domain.Role;
import com.excome.exnewsportal.domain.User;
import com.excome.exnewsportal.repository.PostRepository;
import com.excome.exnewsportal.repository.RoleRepository;
import com.excome.exnewsportal.repository.UserRepository;
import org.apache.commons.lang3.time.DateUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.security.Principal;
import java.text.ParseException;
import java.util.*;

@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    BCryptPasswordEncoder bCryptPasswordEncoder;
    private final PostRepository postRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder, PostRepository postRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.postRepository = postRepository;
    }

    public boolean saveUserRepository(User user){
        if(user != null){
            userRepository.save(user);
            return  true;
        }
        return false;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByUsername(username);
        if(user == null){
            throw new UsernameNotFoundException("Пользователь не найден");
        }
        return user;
    }

    public User getUserById(Long userId){
        Optional<User> userFromDb = userRepository.findById(userId);
        return userFromDb.orElse(new User());
    }

    public User getUserByUsername(String username){
        return userRepository.findUserByUsername(username);
    }

    public List<User> getUsers(){
        return userRepository.findAll();
    }

    public boolean saveUser(User user){
        User userFromDb = userRepository.findByEmail(user.getEmail());
        if(userFromDb != null){
            return false;
        }
        userFromDb = userRepository.findByUsername(user.getUsername());
        if(userFromDb != null){
            return false;
        }
        user.setRoles(Collections.singleton(new Role(1L, "ROLE_USER")));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setSurname("");
        user.setName("");
        user.setPatronymic("");
        userRepository.save(user);

        return true;
    }

    public Set<Role> getRoles(){
        return new HashSet<Role>(roleRepository.findAll());
    }

    public boolean deleteUser(Long userId){
        if(userRepository.findById(userId).isPresent()){
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }

    public List<User> getLastUsers() {
        return userRepository.findLastUser();
    }

    public List<User> getUsersByUsername(String username) {
        return userRepository.findUsersByUsername(username);
    }

    public List<Post> getUserPosts(String username){
        return postRepository.findUserPosts(getUserByUsername(username));
    }

    public boolean saveSettingsProfile(Principal principal, Map<String, String> form) {
        User user = getUserByUsername(principal.getName());
        try {
            for (String key : form.keySet()) {
                if(form.get(key) !=null){
                    switch (key) {
                        case "surname":
                            user.setSurname(form.get(key));
                            break;
                        case "name":
                            user.setName(form.get(key));
                            break;
                            
                        case "patronymic":
                            user.setPatronymic(form.get(key));
                            break;
                        case "birthday":
                            if(!form.get(key).isEmpty()) {
                                user.setBirthday(DateUtils.parseDate(form.get(key), "yyyy-MM-dd"));
                            }else{
                                user.setBirthday(null);
                            }
                    }
                }
            }
            userRepository.save(user);
            return true;
        }catch (ParseException parseException) {
            parseException.printStackTrace();
            return false;
        }
    }
}
