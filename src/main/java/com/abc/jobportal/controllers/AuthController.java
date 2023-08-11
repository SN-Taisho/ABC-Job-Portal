package com.abc.jobportal.controllers;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.EmailService;
import com.abc.jobportal.services.UserService;
import com.abc.jobportal.ServletRequest.Request;

@Controller
public class AuthController {

	@Autowired
	UserService userService;
	
	@Autowired
	EmailService emailService;
	
//	------------
//	REGISTRATION
//	------------
	@GetMapping("/signup")
	public String registrationPage(@ModelAttribute("user") User user) {
		return "Auth/registration";
	}
	
	@PostMapping("sign-up")
    public String registerNewUser(@ModelAttribute("user") User user, Model model, HttpServletRequest request) 
		throws UnsupportedEncodingException, MessagingException {
    	
		Random rnd = new Random();
		int number = rnd.nextInt(999999);
		String code = String.format("%06d", number);
		String siteURL = Request.getSiteURL(request);
		
		if (userService.findUsername(user.getUsername()) == null
				|| userService.findUsername(user.getUsername()).getUsername() == null
				|| userService.findUsername(user.getUsername()).getEmail() == null) {
			user.setActivated(false);
			user.setOTP(code);
			userService.save(user);
			String verifyURL = siteURL + "/verify-registration?username=" + user.getUsername();
			String toEmail = user.getEmail();
			String subject = "Thank you joining ABC Job Portal";
			String body = "<p>Dear " + user.getFullname() + ",</p>";
			body += "<p>Thank you for registering on ABC Jobs, the leading community job seekers and employers in software engineering.</p>";
			body += "<p>To activate your account, please verify your account by entering the following code on the verification page:</p>";
			body += "<a href=\"" + verifyURL + "\">" + user.getOTP() + "</a>";
			body += "<p>This one-time-pin will expire in 24 hours, so please activate your account within the day.</p>";
			body += "<p>If you have any questions or issues, please contact our support team at it.support@abcjobs.com.</p>";
			body += "<p>We look forward in helping you connect with great opportunities.</p>";
			body += "<p>Sincerely,</p>";
			body += "<p>The ABC Jobs Team</p>";

			emailService.sendEmail(toEmail, subject, body);
			return "redirect:verify-registration?username=" + user.getUsername();
		}

		System.out.println("Username already exists");
		String error_msg = "Username already exists";
		model.addAttribute("error_msg", error_msg);
		
		return "Auth/registration";
    }
	
//	OTP CODE VERIFICATION (REGISTRATION)
	@GetMapping("/verify-registration")
	public String registrationVerificationPage(@Param("username") String username, Model model) {
		
		User user = userService.findUsername(username);
		model.addAttribute("username", user.getUsername());
		
		return "Auth/registration-confirmation";
	}
	
	@PostMapping("verify_registration")
	public String verifyRegistration(@RequestParam String OTP, @RequestParam String username, RedirectAttributes redir) {
		
		User user = userService.findUsername(username);
		
		if (user.getOTP().equals(OTP)) {
			userService.activate(user.getUsername());
			return "redirect:thank-you";
		} 
		else {
			String error_msg = "Incorrect OTP";
			redir.addFlashAttribute("error_msg", error_msg);
			return "redirect:verify-registration";
		}
	}
	
	@GetMapping("/thank-you")
	public String registrationSuccessPage() {
		return "Auth/registration-success";
	}
	
//	-----
//	LOGIN
//	-----
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
