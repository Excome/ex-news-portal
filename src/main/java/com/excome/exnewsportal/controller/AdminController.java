package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.service.AdminService;
import com.excome.exnewsportal.service.PostService;
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
    private PostService postService;
    private AdminService adminService;

    public AdminController(UserService userService, PostService postService, AdminService adminService) {
        this.userService = userService;
        this.postService = postService;
        this.adminService = adminService;
    }

    @GetMapping
    public String admin(@RequestParam(required = false) String username,
                        @RequestParam(required = false) String topic,
                        Model model){
        if(username !=null && !username.isEmpty()){
            model.addAttribute("userList", userService.getUsersByUsername(username));
        } else {
            model.addAttribute("userList", userService.getLastUsers());
        }

        if(topic != null && !topic.isEmpty()){
            model.addAttribute("postList", postService.getPostsByTopic(topic));
        }else {
            model.addAttribute("postList", postService.getLastPosts());
        }
        return "admin";
    }

    @GetMapping("ue/{userId}")
    public String userEdit(@PathVariable("userId") Long userId,
                           @RequestParam(required = false) Map<String, String> form,
                           Model model){
        if(form != null && !form.isEmpty()){
            adminService.changeUser(form, userId);
        }

        model.addAttribute("user", userService.getUserById(userId));
        model.addAttribute("roles", userService.getRoles());

        return "userEdit";
    }

    @PostMapping("ue/{userId}")
    public String userPassEdit(
            @RequestParam Map<String, String> form,
            @PathVariable Long userId,
            Principal principal
    ){
        adminService.changeUserPass(form, userId, principal);


        return "redirect:/admin/ue/"+userId;
    }

    @PostMapping("ue/{userId}/delete")
    public String deleteUser(@PathVariable Long userId){
        userService.deleteUser(userId);

        return "redirect:/admin";
    }

}
