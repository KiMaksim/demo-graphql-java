package com.example.demo.controllers;

import com.example.demo.entities.Address;
import com.example.demo.entities.Follower;
import com.example.demo.entities.User;
import com.example.demo.repositories.AddressRepository;
import com.example.demo.repositories.FollowerRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.UUID;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

@Controller
public class FollowerController {

  private final FollowerRepository followerRepository;
  private final UserRepository userRepository;
  private final AddressRepository addressRepository;

  public FollowerController(FollowerRepository followerRepository, UserRepository userRepository,
      AddressRepository addressRepository) {
    this.followerRepository = followerRepository;
    this.userRepository = userRepository;
    this.addressRepository = addressRepository;
  }

  @QueryMapping
  public List<Follower> getFollowersByUser(@Argument String userId) {
    return followerRepository.findByFollowToId(UUID.fromString(userId));
  }

  @MutationMapping
  @Transactional
  public Follower createFollower(
      @Argument String name,
      @Argument String birthday,
      @Argument Address addressInput,
      @Argument String userId
  ) {
    User user = userRepository.findById(UUID.fromString(userId)).orElse(null);

    if (user == null) {
      return null;
    }

    Address address = new Address(UUID.randomUUID(), addressInput.getStreet(),
        addressInput.getPostalCode(), addressInput.getCity(), null);
    addressRepository.save(address);

    Follower follower = new Follower(UUID.randomUUID(), name, birthday, address, user);
    return followerRepository.save(follower);
  }

  @MutationMapping
  @Transactional
  public void deleteFollower(@Argument String id) {
    followerRepository.deleteById(UUID.fromString(id));
  }
}
