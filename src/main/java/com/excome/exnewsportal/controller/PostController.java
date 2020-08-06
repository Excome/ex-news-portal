package com.excome.exnewsportal.controller;

import com.excome.exnewsportal.domain.Post;
import com.excome.exnewsportal.service.PostService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

    @GetMapping("post/{postId}/edit")
    public String postEdit(@PathVariable("postId") Long postId, Model model){
        model.addAttribute(postService.getPostById(postId));

        return "postEdit";
    }

    @PostMapping("post/{postId}/edit")
    public String updatePost(@ModelAttribute("postForm") Post postForm,
                             Model model){
        postService.updatePost(postForm);

        return "redirect:/post/{postId}";
    }

    @PostMapping("post/{postId}/delete")
    public String deletePost(@RequestParam("postId") Long postId){
        postService.deletePost(postId);

        return "redirect:/";
    }
}

