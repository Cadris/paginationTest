package com.sayan.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.sayan.entities.User;
import com.sayan.repository.UserRepository;
import com.sayan.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserRepository userRepository;

	@Override
	public User saveUser(User user) {
		return this.userRepository.save(user);
	}

	@Override
	public List<User> getAllUsers() {
		return this.userRepository.findAll();
	}

	@Override
	public User findById(int id) {
		return this.userRepository.findById(id);
	}

	@Override
	public void deleteById(int id) {
		this.userRepository.deleteById(id);
	}

	@Override
	public Page<User> findPaginated(int pageNo, int pageSize, String sortField, String sortDirection) {
		Sort sort = sortDirection.equalsIgnoreCase(Sort.Direction.ASC.name()) ? Sort.by(sortField).ascending() : Sort.by(sortField).descending();
		
		Pageable pageable = PageRequest.of(pageNo-1, pageSize, sort);
		return this.userRepository.findAll(pageable);
	}

}
