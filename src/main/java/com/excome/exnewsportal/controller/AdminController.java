package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    private AdminService adminService;

    public AdminController(AdminService adminService) {
        this.adminService = adminService;
    }

    @GetMapping
    public String admin(@RequestParam(required = false) String username,
                        @RequestParam(required = false) String topic,
                        Model model){
        if(username !=null && !username.isEmpty()){
            model.addAttribute("userList", adminService.getUsersByUsername(username));
        } else {
            model.addAttribute("userList", adminService.getLastUsers());
        }

        if(topic != null && !topic.isEmpty()){
            model.addAttribute("postList", adminService.getPostsByTopic(topic));
        }else {
            model.addAttribute("postList", adminService.getLastPosts());
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

        model.addAttribute("user", adminService.getUserById(userId));
        model.addAttribute("roles", adminService.getRoles());

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
        adminService.deleteUser(userId);

        return "redirect:/admin";
    }

}
