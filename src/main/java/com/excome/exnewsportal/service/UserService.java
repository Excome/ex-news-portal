package com.excome.exnewsportal.service;

import com.excome.exnewsportal.domain.Role;
import com.excome.exnewsportal.domain.User;
import com.excome.exnewsportal.repository.RoleRepository;
import com.excome.exnewsportal.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.security.Principal;
import java.util.*;

@Service
public class UserService implements UserDetailsService {
    @PersistenceContext
    private EntityManager em;
    private UserRepository userRepository;
    private RoleRepository roleRepository;
    BCryptPasswordEncoder bCryptPasswordEncoder;

    public UserService(UserRepository userRepository, RoleRepository roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
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

    public boolean changeUser(Map<String, String> userForm, User user) {
        try {
            Set<Role> roles = new HashSet<Role>(roleRepository.findAll());
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
            userRepository.save(user);
            return true;
        }catch (Exception ex){
            return false;
        }

    }

    public boolean changeUserPass(Map<String, String> form, Long userId, Principal principal) {
        User userFromDb = userRepository.findUserById(userId);
        User admin = userRepository.findByUsername(principal.getName());
        String newPass = form.get("password");
        String newPassConf = form.get("passwordConfirm");
        String adminPass = form.get("adminPassword");
        if(userFromDb != null){
            if(newPass.equals(newPassConf) && bCryptPasswordEncoder.matches(adminPass, admin.getPassword())){
                userFromDb.setPassword(bCryptPasswordEncoder.encode(newPass));
                userRepository.save(userFromDb);
                return true;
            }
        }

        return false;
    }

    public boolean deleteUser(Long userId){
        if(userRepository.findById(userId).isPresent()){
            userRepository.deleteById(userId);
            return true;
        }
        return false;
    }
}
