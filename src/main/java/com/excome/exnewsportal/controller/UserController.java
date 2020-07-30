package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("{username}")
    public String userProfile(@PathVariable String username, Model model){
        model.addAttribute("userProfile", userService.getUserByUsername(username));
        model.addAttribute("posts", userService.getUserPosts(username));

        return "userProfile";
    }
}
