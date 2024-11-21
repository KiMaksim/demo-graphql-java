package com.example.demo.controllers;

import com.example.demo.entities.Post;
import com.example.demo.repositories.PostRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

@Controller
public class PostController {

  private final PostRepository postRepository;
  private final UserRepository userRepository;

  public PostController(PostRepository postRepository, UserRepository userRepository) {
    this.postRepository = postRepository;
    this.userRepository = userRepository;
  }

  @QueryMapping
  public List<Post> getPostsByUser(@Argument String userId) {
    return postRepository.findPostsByAuthorId(UUID.fromString(userId));
  }

  @QueryMapping
  public Optional<Post> getPostById(@Argument String id) {
    return postRepository.findById(UUID.fromString(id));
  }

  @MutationMapping
  @Transactional
  public Post createPost(
      @Argument String title,
      @Argument String content,
      @Argument String userId
  ) {
    return userRepository.findById(UUID.fromString(userId)).map(user -> postRepository.save(new Post(UUID.randomUUID(), title, content, 0, 0, user))).orElse(null);
  }

  @MutationMapping
  @Transactional
  public Post updatePost(
      @Argument String id,
      @Argument String title,
      @Argument String content
  ) {
    return postRepository.findById(UUID.fromString(id)).map(post -> {
      if (title != null) {
        post.setTitle(title);
      }
      if (content != null) {
        post.setContent(content);
      }
      return postRepository.save(post);
    }).orElse(null);
  }

  @MutationMapping
  @Transactional
  public void deletePost(@Argument String id) {
    postRepository.deleteById(UUID.fromString(id));
  }
}
