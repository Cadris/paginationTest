package com.sayan.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.sayan.entities.User;

public interface UserService {

	User saveUser(User user);
	List<User> getAllUsers();
	User findById(int id);
	
	void deleteById(int id);
	
	Page<User> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection);
}
