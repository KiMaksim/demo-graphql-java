package com.example.demo.repositories;

import com.example.demo.entities.Follower;
import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FollowerRepository extends JpaRepository<Follower, UUID> {

  List<Follower> findByFollowToId(UUID uuid);
}
