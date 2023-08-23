package com.abc.jobportal.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
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

import com.abc.jobportal.entity.Education;
import com.abc.jobportal.entity.Experience;
import com.abc.jobportal.entity.Role;
import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.EducationService;
import com.abc.jobportal.services.EmailService;
import com.abc.jobportal.services.ExperienceService;
import com.abc.jobportal.services.ThreadService;
import com.abc.jobportal.services.UserService;
import com.abc.jobportal.ServletRequest.Request;

@Controller
public class AuthController {

	@Autowired
	UserService userService;
	
	@Autowired
	ExperienceService experienceService;
	
	@Autowired
	EducationService educationService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	ThreadService threadService;
	
//	------------
//	REGISTRATION
//	------------
	@GetMapping("/signup")
	public String registrationPage(@ModelAttribute("user") User user) {
		return "Auth/registration";
	}
	
	@PostMapping("sign_up")
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
	
//	----------------
//	REGISTRATION OTP
//	----------------
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
	
	@GetMapping("/login-success")
	public String loginSuccess(RedirectAttributes redir, Principal principal) {
		
		String username = principal.getName();
		
		User user = userService.findLoginUser(username);
		
		String[] role = user.getRoles().stream().map(Role::getName).toArray(String[]::new);
		String userRole = role[0];
		
		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);
		
		for (String roleName : roleNames) {
			if (roleName == userRole) {
//				System.out.println("Logged in successfully as " + userRole);
//				String success_msg = "Logged in successfully. Click here to go to dashboard.";
//				redir.addFlashAttribute("success_msg", success_msg);
				return "redirect:homepage";
			}
		}

		System.out.println("Login failed");
		String error_msg = "Login failed";
		redir.addFlashAttribute("error_msg", error_msg);
		return "redirect:login";
	}
	
	@GetMapping("/login-error")
	public String loginError(RedirectAttributes redir) {
		
		System.out.println("Incorrect Password or Username");
		
		String error_msg = "Incorrect Credentials";
		redir.addFlashAttribute("error_msg", error_msg);
		return "redirect:login";
	}
	
	@GetMapping("logout")
	public String logout(Model model, RedirectAttributes redir) {
		return "redirect:home";
	}
	
//	---------------
//	FORGOT PASSWORD
//	---------------
	@GetMapping("/forgot-password")
	public String forgotPasswordPage() {
		return "Auth/forgot-password";
	}
	
	@PostMapping("reset_request")
	public String verifyUserEmail(@RequestParam String email, HttpServletRequest request, RedirectAttributes redir)
		throws UnsupportedEncodingException, MessagingException {
		
		if (!(userService.findEmail(email) == null)) {
			User user = userService.findEmail(email);
			String siteURL = Request.getSiteURL(request);
			Random rnd = new Random();
			int number = rnd.nextInt(999999);
			String code = String.format("%06d", number);
			user.setOTP(code);
			userService.updateOTP(user);
			String verifyURL = siteURL + "/verify-email?email=" + user.getEmail();
			String toEmail = user.getEmail();
			String subject = "ABC Jobs | Password reset";
			String body = "<p>Dear " + user.getFullname() + ",</p>";
			body += "<p>We have received a request to reset your password for your account. To verify your identity, please enter the one-time-pin to reset your password:</p>";
			body += "<a href=\"" + verifyURL + "\">" + user.getOTP() + "</a>";
			body += "<p>This OTP will expire in 24 hours, so please verify your identity within the day</p>";
			body += "<p>If this request was not made by you, please contact our support team at support@abcjobs.com.</p>";

			emailService.sendEmail(toEmail, subject, body);
			return "redirect:verify-identity?email=" + user.getEmail();
		} else {
			System.out.println("User Not Found");
			String error_msg = "No account uses this email";
			redir.addFlashAttribute("error_msg", error_msg);
			return "redirect:forgot-password";
		}
	}
	
//	-------------------
//	FORGOT PASSWORD OTP
//	-------------------
	@GetMapping("/verify-identity")
	public String passwordResetOTPPage(@Param("email") String email, Model model) {
		User user = userService.findEmail(email);
		model.addAttribute("email", user.getEmail());
		return "Auth/password-email";
	}
	
	@PostMapping("/verify_identity")
	public String verifyIdentity(@RequestParam String OTP, @RequestParam String email, RedirectAttributes redir) {
		User user = userService.findEmail(email);
    	
    	if(user.getOTP().equals(OTP)) {
    		redir.addFlashAttribute("email", user.getEmail());
        	return "redirect:reset-password";
    	} else if (!(OTP.length() == 6)) {
			String error_msg = "Code must be atleast 6 digits.";
			redir.addFlashAttribute("error_msg", error_msg);
        	return "redirect:verify-identity?email=" + user.getEmail();
    	} else {
			String error_msg = "Incorrect code.";
			redir.addFlashAttribute("error_msg", error_msg);
        	return "redirect:verify-identity?email=" + user.getEmail();
    	}
	}
	
	@GetMapping("/reset-password")
	public String resetPasswordPage() {
		return "Auth/reset-password";
	}
	
	@PostMapping("reset_password")
	public String resetPassword(@RequestParam String email, @RequestParam String password) {
		
		User user = userService.findEmail(email);
		user.setPassword(userService.encodePassword(password));
		userService.update(user);
		
		return "redirect:password-changed";
	}
	
	@GetMapping("/password-changed")
	public String paswordChanged() {
		return "Auth/password-success";
	}
	
//	-------------
//	ACCESS DENIED
//	-------------
	@GetMapping("/access-denied")
	public String accessDeniedPage() {
		return "Public/access-denied";
	}

//	-------
//	PROFILE
//	-------
	@GetMapping("/my-profile")
	public String viewProfile(Principal principal, Model model) {
		
		if (principal.getName().equals(null)) {
			return "redirect:access-denied";
		}
		
		String username = principal.getName();
		User userdata = userService.findLoginUser(username);

		List<Thread> threads = threadService.getAllThreadsByDate();
		model.addAttribute("threads", threads);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		model.addAttribute("user", user);
		
		List<Experience> experience = experienceService.findAllExpByUserId(userdata.getId());
		model.addAttribute("experience", experience);
		List<Education> education = educationService.findAllEduByUserId(userdata.getId());
		model.addAttribute("education", education);

		return "User/profile";
	}

//	-----------------------
//	UPDATE PERSONAL PROFILE
//	-----------------------
	@PostMapping("update_profile")
	public String updateProfileInfo(Principal principal, @ModelAttribute("user") User u, RedirectAttributes redir) {
		
		String username = principal.getName();
		
		User user = userService.findLoginUser(username);
		
		user.setFullname(u.getFullname());
		user.setOccupation(u.getOccupation());
		user.setLocation(u.getLocation());
		user.setBio(u.getBio());
		
		userService.update(user);
		
		return "redirect:my-profile";
	}
}
