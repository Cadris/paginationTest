package com.sayan.service;

import java.util.List;

import com.sayan.entities.User;

public interface UserService {

	User saveUser(User user);
	List<User> getAllUsers();
	User findById(int id);
}
