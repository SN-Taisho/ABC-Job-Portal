package com.abc.jobportal.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.jobportal.entity.Role;
import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.ThreadService;
import com.abc.jobportal.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ThreadService threadService;
	
	@GetMapping("/homepage")
	public String userHomepage(Principal principal, Model model) {
		
		String username = principal.getName();
		User userdata = userService.findLoginUser(username);

		String[] role = userdata.getRoles().stream().map(Role::getName).toArray(String[]::new);
		String userRole = role[0];
		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);

		List<User> user = new ArrayList<User>();
		user.add(userdata);
		model.addAttribute("user", user);
		
		List<Thread> threads = threadService.getAllThreads();
		model.addAttribute("threads", threads);
		
		return "User/homepage";
	}
	
	@GetMapping("/search")
	public String searchPage() {
		return "User/search";
	}
	
	@GetMapping("/search-results")
	public ModelAndView searchResultsPage(@RequestParam String keyword, Model model, Principal principal) {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		model.addAttribute("currentUser", user.getUsername());
		
		List<User> searchUser = userService.search(keyword);
		System.out.println(searchUser);
		
		model.addAttribute("keyword", keyword);
		return new ModelAndView("User/search-results", "searchUser", searchUser);
	}
	
	@GetMapping("/view-profile")
	public String viewUserProfile() {
		return "User/view-profile";
	}
}
