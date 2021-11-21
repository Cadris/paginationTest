package com.sayan.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sayan.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	
	User findById(int id);
}
