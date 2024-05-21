package com.inc.backend.repository;


import com.inc.backend.domain.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface PostRepository extends JpaRepository<Post, Integer> {

//    @Query("SELECT p FROM Post p WHERE p.title = :title")
    Optional<Post> findPostByTitle(@Param("title") String title);

    Optional<Post> findPostByName(@Param("name")String name);


}
