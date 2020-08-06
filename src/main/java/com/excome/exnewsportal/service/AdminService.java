package com.excome.exnewsportal.service;

import com.excome.exnewsportal.domain.Role;
import com.excome.exnewsportal.domain.User;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service
public class AdminService {
    private final UserService userService;
    private final PostService postService;

    public AdminService(UserService userService, PostService postService) {
        this.userService = userService;
        this.postService = postService;
    }

    public boolean changeUser(Map<String, String> userForm, Long userId) {
        User user = userService.getUserById(userId);
        if(user != null){
            return false;
        }
        Set<Role> roles = new HashSet<Role>(userService.getRoles());
        user.getRoles().clear();
        for(String key : userForm.keySet()){
            switch (key){
                case "email": user.setEmail(userForm.get(key)); break;
                case "username": user.setUsername(userForm.get(key)); break;
                case "surname": user.setSurname(userForm.get(key)); break;
                case "name": user.setName(userForm.get(key)); break;
                case "patronymic": user.setPatronymic(userForm.get(key)); break;
            }
            if(key.contains("Role")){
                for(Role role : roles){
                    if(userForm.get(key).equals(role.getName())){
                        user.getRoles().add(role);
                    }
                }

            }
        }
        return userService.saveUserRepository(user);
    }

    public boolean changeUserPass(Map<String, String> form, Long userId, Principal principal) {
        User userFromDb = userService.getUserById(userId);
        User admin = userService.getUserByUsername(principal.getName());
        if(userFromDb != null && admin != null) {
            return false;
        }
        String newPass = form.get("password");
        String newPassConf = form.get("passwordConfirm");
        String adminPass = form.get("adminPassword");
        if(newPass.equals(newPassConf) && userService.bCryptPasswordEncoder.matches(adminPass, admin.getPassword())){
            userFromDb.setPassword(userService.bCryptPasswordEncoder.encode(newPass));
            userService.saveUserRepository(userFromDb);
        }
        return true;
    }
}

