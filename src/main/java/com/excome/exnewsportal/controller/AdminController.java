package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private UserService userService;

    public AdminController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String userList(Model model){
        model.addAttribute("userList", userService.getUsers());

        return "admin";
    }

    @GetMapping("ue/{userId}")
    public String userEdit(@PathVariable("userId") Long userId, Model model){
        model.addAttribute("user", userService.findUserById(userId));
        model.addAttribute("roles", userService.getRoles());

        return "userEdit";
    }

    @PostMapping("ue/cngUser")
    public String updateUser(@RequestParam Map<String, String> form,
                             @RequestParam Long userId
    ){
        userService.changeUser(form, userService.findUserById(userId));

        return "redirect:/admin";
    }

    @PostMapping("ue/cngUserPass")
    public String updateUserPass(
            @RequestParam Map<String, String> form,
            @RequestParam Long userId,
            Principal principal
    ){
        userService.changeUserPass(form, userId, principal);


        return "redirect:/admin";
    }

    @PostMapping("ue/deleteUser")
    public String deleteUser(@RequestParam Long userId){
        userService.deleteUser(userId);

        return "redirect:/admin";
    }

}
