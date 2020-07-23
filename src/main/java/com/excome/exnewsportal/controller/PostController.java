package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.domain.Post;
import com.excome.exnewsportal.service.PostService;
import com.excome.exnewsportal.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
public class PostController {
    private PostService postService;

    public PostController(PostService postService) {
        this.postService = postService;
    }

    @GetMapping("/posts")
    public String posts(Model model){
        model.addAttribute("posts", postService.getLastPosts());
        return "posts";
    }

    @GetMapping("post/new")
    public String postNew(){

        return "postNew";
    }

    @GetMapping("post/{postId}")
    public String post(@PathVariable("postId") Long post, Model model){
        model.addAttribute("post", postService.getPostById(post));

        return "post";
    }

    @PostMapping("/post/new")
    public String addPost(@ModelAttribute("postForm") Post post,
                          Principal principal,
                          Model model){
        postService.addPost(post, principal);
        model.addAttribute("post", post);

        return "redirect:/post/"+post.getId();
    }

}

