package com.excome.exnewsportal.repository;

import com.excome.exnewsportal.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);

    @Query("select u from User u where u.username = :username")
    User findUserByUsername(@Param("username")String username);
    User findByEmail(String email);
    User findUserById(Long userId);

    @Query(
            value = "SELECT * FROM usr u order by u.id desc limit(10)",
            nativeQuery = true
    )
    List<User> findLastUser();

    @Query("select u from User u where u.username like %:username%")
    List<User> findUsersByUsername(@Param("username")String username);
}
