package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PublicController {

//	------------
//	Public Pages
//	------------
	@GetMapping("/")
	public String homeRedirect() {
		return "Public/landing";
	}
	
	@GetMapping("/home")
	public String landingPage() {
		return "Public/landing";
	}
	
	@GetMapping("/about-us")
	public String aboutUsPage() {
		return "Public/about-us";
	}
	
	@GetMapping("/contact-us")
	public String contactUsPage() {
		return "Public/contact-us";
	}
	
	@GetMapping("/privacy-policy")
	public String privacyPolicy() {
		return "Public/privacy-policy";
	}
}
