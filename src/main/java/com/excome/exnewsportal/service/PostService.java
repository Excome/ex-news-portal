package com.excome.exnewsportal.service;

import com.excome.exnewsportal.domain.Post;
import com.excome.exnewsportal.domain.User;
import com.excome.exnewsportal.repository.PostRepository;
import org.springframework.stereotype.Service;

import java.security.Principal;
import java.util.List;

@Service
public class PostService {
    private PostRepository postRepository;
    private UserService userService;

    public PostService(PostRepository postRepository, UserService userService) {
        this.postRepository = postRepository;
        this.userService = userService;
    }

    public Post getPostById(Long postId) {
        return postRepository.findPostById(postId);
    }

    public List<Post> getLastPosts() {
        return postRepository.findLastPost();
    }

    public Post addPost(Post post, Principal principal) {
        if(principal == null) {
            return null;
        }
        User user = (User) userService.loadUserByUsername(principal.getName());
        post.setAuthor(user);
        postRepository.save(post);

        return post;
    }
}
