package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ThreadController {

	@GetMapping("/thread")
	public String threadPage() {
		return "Threads/Thread";
	}
}
