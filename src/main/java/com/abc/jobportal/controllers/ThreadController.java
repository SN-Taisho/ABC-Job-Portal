package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ThreadController {

//	THREADS
	@GetMapping("/create-thread")
	public String createThreadPage() {
		return "Threads/create-thread";
	}
	
	@GetMapping("/thread")
	public String viewThreadPage() {
		return "Threads/thread";
	}
}
