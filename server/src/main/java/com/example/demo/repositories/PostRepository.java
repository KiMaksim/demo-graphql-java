package com.example.demo.repositories;

import com.example.demo.entities.Post;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PostRepository extends JpaRepository<Post, UUID> {

  List<Post> findPostsByAuthorId(UUID uuid);
}
