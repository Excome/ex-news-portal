package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.Map;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("user/{username}")
    public String userProfile(@PathVariable String username, Model model){
        model.addAttribute("userProfile", userService.getUserByUsername(username));
        model.addAttribute("posts", userService.getUserPosts(username));

        return "userProfile";
    }

    @GetMapping("auth/settings/profile")
    public String settingsProfile(Principal principal,
                                  Model model,
                                  @RequestParam(required = false) Map<String, String> form){
        if(form != null && !form.isEmpty()){
            userService.saveSettingsProfile(principal, form);
        }

        model.addAttribute("user", userService.getUserByUsername(principal.getName()));

        return "settingsProfile";
    }
}
