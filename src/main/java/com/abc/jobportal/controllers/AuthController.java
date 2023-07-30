package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthController {

	@GetMapping("/signup")
	public String registrationPage() {
		return "Auth/registration";
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
	
	@GetMapping("/reset-password-email")
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
