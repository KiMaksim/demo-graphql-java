package com.example.demo.repositories;

import com.example.demo.entities.Address;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AddressRepository extends JpaRepository<Address, UUID> {

}
