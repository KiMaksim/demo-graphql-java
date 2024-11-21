package com.example.demo.controllers;

import com.example.demo.entities.Address;
import com.example.demo.entities.User;
import com.example.demo.repositories.AddressRepository;
import com.example.demo.repositories.UserRepository;
import jakarta.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

@Controller
public class UserController {

  private final UserRepository userRepository;
  private final AddressRepository addressRepository;

  public UserController(UserRepository userRepository, AddressRepository addressRepository) {
    this.userRepository = userRepository;
    this.addressRepository = addressRepository;
  }

  @QueryMapping
  public User getUser(@Argument String id) {
    return userRepository.findById(UUID.fromString(id)).orElse(null);
  }

  @QueryMapping
  public List<User> getUsers() {
    return userRepository.findAll();
  }

  @MutationMapping
  @Transactional
  public User createUser(
      @Argument String name,
      @Argument String birthday,
      @Argument Address addressInput
  ) {
    Address address = new Address(UUID.randomUUID(), addressInput.getStreet(),
        addressInput.getPostalCode(), addressInput.getCity(), null);
    addressRepository.save(address); // Save address first

    return userRepository.save(
        new User(UUID.randomUUID(), name, birthday, address, new ArrayList<>(),
            new ArrayList<>()));
  }

  @MutationMapping
  @Transactional
  public User updateUser(
      @Argument String id,
      @Argument String name,
      @Argument String birthday,
      @Argument Address addressInput
  ) {
    return userRepository.findById(UUID.fromString(id)).map(user -> {
      if (name != null) {
        user.setName(name);
      }
      if (birthday != null) {
        user.setBirthday(birthday);
      }

      if (addressInput != null) {
        Address address = new Address(
            UUID.randomUUID(),
            addressInput.getStreet(),
            addressInput.getPostalCode(),
            addressInput.getCity(),
            user
        );
        addressRepository.save(address);
        user.setAddress(address);
      }
      userRepository.save(user);
      return user;
    }).orElse(null);
  }

  @MutationMapping
  @Transactional
  public void deleteUser(@Argument String id) {
    userRepository.deleteById(UUID.fromString(id));
  }
}
