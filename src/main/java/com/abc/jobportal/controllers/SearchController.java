package com.abc.jobportal.controllers;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.abc.jobportal.entity.User;
import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.entity.JobPost;
import com.abc.jobportal.services.UserService;
import com.abc.jobportal.services.JobPostService;
import com.abc.jobportal.services.ThreadService;


@Controller
public class SearchController {

	@Autowired
	UserService userService;
	
	@Autowired
	ThreadService threadService;
	
	@Autowired
	JobPostService jobPostService;
	
//	--------------------
//	Search Functionality
//	--------------------
	@GetMapping("/search")
	public String searchPage() {
		return "User/search";
	}
	
	@GetMapping("/thread-search") 
	public String threadSearch() {
		return "Threads/search";
	}
	
	@GetMapping("/job-search")
	public String jobSearch() {
		return "Jobs/search";
	}
	
	@GetMapping("/user-results")
	public ModelAndView searchResultsPage(@RequestParam String keyword, Model model, Principal principal) {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		model.addAttribute("currentUser", user.getUsername());
		
		List<User> searchUser = userService.search(keyword);
		System.out.println(searchUser);
		
		model.addAttribute("keyword", keyword);
		return new ModelAndView("User/search-results", "searchUser", searchUser);
	}
	
	@GetMapping("/thread-results")
	public ModelAndView threadSearchPage(@RequestParam String keyword, Model model, Principal principal) {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		model.addAttribute("currentUser", user.getUsername());
		
		List<Thread> searchThread = threadService.search(keyword);
		System.out.println(searchThread);
		
		model.addAttribute("keyword", keyword);
		return new ModelAndView("Threads/search-results", "searchThread", searchThread);
	}
	
	@GetMapping("/job-results")
	public ModelAndView jonSearchPage(@RequestParam String keyword, Model model, Principal principal) {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		model.addAttribute("currentUser", user.getUsername());
		
		List<JobPost> searchJob = jobPostService.search(keyword);
		System.out.println(searchJob);
		
		model.addAttribute("keyword", keyword);
		return new ModelAndView("Jobs/search-results", "searchJob", searchJob);
	}
	
	
}
