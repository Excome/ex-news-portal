package com.excome.exnewsportal.repository;

import com.excome.exnewsportal.domain.Post;
import org.hibernate.annotations.NamedNativeQuery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.lang.annotation.Native;
import java.util.List;

@Repository
public interface PostRepository extends JpaRepository<Post, Long> {
    Post findPostById(Long id);

    @Query(
            value = "SELECT * FROM Post p order by p.id desc limit(10)",
            nativeQuery = true
    )
    List<Post> findLastPost();
}
