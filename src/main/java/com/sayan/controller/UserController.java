package com.sayan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String showFormForUpdate(@RequestParam("userID") int theId, Model model) {
		
		User user = userService.findById(theId);
		
		model.addAttribute("user",user);
		model.addAttribute("purpose", "Modify");
		
		return "addUser";
	}
	
	@GetMapping("/viewPageinated")
	public String viewPaginated(Model model) {
		return findPaginated(1, model);
	}
	
	@GetMapping("/page")
	public String findPaginated(@RequestParam("pageNo") int pageNo, Model model) {
		int pageSize=5;
		
		Page<User> page = userService.findPaginated(pageNo, pageSize);
		List<User> listUser = page.getContent();
		
		model.addAttribute("currentPage",pageNo);
		model.addAttribute("totalPages", page.getTotalPages());
		model.addAttribute("totalItems", page.getTotalElements());
		model.addAttribute("theUserList", listUser);
		
		return "viewAllPaginated";
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
	
	@GetMapping("/deleteUser")
	public String deleteUserByID(@RequestParam("userID") int theId, Model model) {
		log("Delete User : "+theId);
		
		userService.deleteById(theId);
		
		return "redirect:/viewAllPage";
	}
	
	
	
//	Private Methods
	
	private void log(String action) {
		System.out.println(action);
	}

}
