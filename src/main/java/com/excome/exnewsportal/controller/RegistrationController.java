package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.domain.User;
import com.excome.exnewsportal.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/registration")
public class RegistrationController {
    private UserService userService;

    public RegistrationController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String registration(Model model){
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @PostMapping
    public String addUser(@ModelAttribute User userForm, Model model){
        if(!userService.saveUser(userForm)){
            return "registration";
        }

        return "redirect:/login";
    }
}

