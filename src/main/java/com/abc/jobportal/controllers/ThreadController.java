package com.abc.jobportal.controllers;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.ThreadService;
import com.abc.jobportal.services.UserService;

@Controller
public class ThreadController {

	@Autowired
	UserService userService;
	
	@Autowired
	ThreadService threadService;
	
//	----------------
//	THREADS CREATION
//	----------------
	@GetMapping("/create-thread")
	public String createThreadPage() {
		return "Threads/create-thread";
	}
	
	@PostMapping("create_thread")
	public String createThread(@ModelAttribute("thread") Thread thread, Principal principal) {
		
		String username = principal.getName();

		User user = userService.findLoginUser(username);
		
		thread.setUser(user);
		
		threadService.save(thread);
		
		return "redirect:homepage";
	}
	
	@GetMapping("/thread")
	public String viewThreadPage() {
		return "Threads/thread";
	}
}