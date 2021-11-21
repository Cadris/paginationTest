package com.sayan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sayan.entities.User;
import com.sayan.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	
	//Display Controllers
	
	@GetMapping("/")
	public String indexPage() {
		log("index : hit");
		return "index";
	}
	
	@GetMapping("/addUserForm")
	public String addUserPage(@ModelAttribute("user") User user , Model model) {
		log("hit add user");
		
		//User user = new User();
		System.out.println(user);
		model.addAttribute("user",user);
		model.addAttribute("purpose", "Add");
		return "addUser";
	}
	
	@GetMapping("/viewAllPage")
	public String viewAllPage(Model model) {
		log("hit /viewAllPage");
		
		List<User> theUserList = userService.getAllUsers();
		model.addAttribute("theUserList", theUserList);
		
		return "viewAll";
	}
	
	@GetMapping("/updateUserForm")
	public String showFormForUpdate(@RequestParam("userID") int theId,
									Model model) {
		User user = userService.findById(theId);
//		theModel.addAttribute("librarian", librarian);
		model.addAttribute("user",user);
		model.addAttribute("purpose", "Modify");
		return "addUser";
	}
	
	//Database Modify
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("user") User user , Model model) {
		log("hit saveUser");
		
		userService.saveUser(user);
		
		System.out.println(user);
		model.addAttribute("user",user);
		
		return "redirect:/addUserForm";
	}
	
	
//	Private Methods
	
	private void log(String action) {
		System.out.println(action);
	}

}
