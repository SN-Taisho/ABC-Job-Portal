package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

	
	@GetMapping("/homepage")
	public String userHomepage() {
		return "User/Homepage";
	}
	
	@GetMapping("/search")
	public String userSearch() {
		return "User/Search";
	}
	
	@GetMapping("/user-profile")
	public String userProfile() {
		return "User/Profile";
	}
		
}
