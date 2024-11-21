package com.example.demo.controllers;

import com.example.demo.entities.Address;
import com.example.demo.repositories.AddressRepository;
import java.util.UUID;
import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

@Controller
public class AddressController {

  private final AddressRepository addressRepository;

  public AddressController(AddressRepository addressRepository) {
    this.addressRepository = addressRepository;
  }

  @QueryMapping
  public Address getAddress(@Argument String id) {
    return addressRepository.findById(UUID.fromString(id)).orElse(null);
  }
}
