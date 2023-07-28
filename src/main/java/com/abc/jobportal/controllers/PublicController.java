package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PublicController {

	@GetMapping("/")
	public String homeRedirect() {
		return "Public/landing";
	}
	
	@GetMapping("/home")
	public String landing() {
		return "Public/landing";
	}
}
