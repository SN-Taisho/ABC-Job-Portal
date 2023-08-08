package com.abc.jobportal.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.UserService;

@Controller
public class AuthController {

	@Autowired
	UserService userService;
	
//	REGISTRATION
	@GetMapping("/signup")
	public String registrationPage() {
		return "Auth/registration";
	}
	
	@PostMapping("sign-up")
    public String registerNewUser(@ModelAttribute("user") User user, Model model) {
    	
    	userService.save(user);
    	
    	return "redirect:email-verification";
    }
	
	
	@GetMapping("/email-verification")
	public String emailVerificationPage() {
		return "Auth/registration-confirmation";
	}
	
	@GetMapping("/thank-you")
	public String registrationSuccessPage() {
		return "Auth/registration-success";
	}
	
	@GetMapping("/login")
	public String loginPage() {
		return "Auth/login";
	}
	
	@GetMapping("/forgot-password")
	public String forgotPasswordPage() {
		return "Auth/forgot-password";
	}
	
	@GetMapping("/account-verification")
	public String passwrdResetEmailPage() {
		return "Auth/password-email";
	}
	
	@GetMapping("/reset-password")
	public String resetPasswordPage() {
		return "Auth/reset-password";
	}
	
	@GetMapping("/password-changed")
	public String paswordChanged() {
		return "Auth/password-success";
	}
}
