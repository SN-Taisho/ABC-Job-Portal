package com.abc.jobportal.controllers;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abc.jobportal.entity.BulkMail;
import com.abc.jobportal.entity.JobPostResponse;
import com.abc.jobportal.entity.Role;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.BulkMailService;
import com.abc.jobportal.services.EmailService;
import com.abc.jobportal.services.JobPostResponseService;
import com.abc.jobportal.services.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	JobPostResponseService jobPostResponseService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	BulkMailService bulkMailService;

//	-----------------
//	BULK MAIL HISTORY
//	-----------------
	@GetMapping("/bulk-mail")
	public String bulkMailHistory(Model model) {
		
		List<BulkMail> bulkMails = bulkMailService.getAllBulkMailByDate();
		model.addAttribute("bulkMail", bulkMails);
		
		return "Admin/bulk-mail-history";
	}
	
//	--------------
//	SEND BULK MAIL
//	--------------
	@GetMapping("/view-mail")
	public String viewBulkMail(@RequestParam Long bmId, Model model) {
		
		BulkMail bulkMail = bulkMailService.findByMailId(bmId);
		List<BulkMail> bulkMailContent = new ArrayList<BulkMail>();
		bulkMailContent.add(bulkMail);
		
		model.addAttribute("bulkMail",bulkMailContent);
		
		return "Admin/view-mail";
	}
	
//	--------------
//	SEND BULK MAIL
//	--------------
	@GetMapping("/send-bulk-mail")
	public String sendBulkMailPage() {
		return "Admin/bulk-mail";
	}
	
	@PostMapping("send_bulk_mail")
	public String sendBulkMail(@ModelAttribute("bulkMail") BulkMail bulkMail, Principal principal) 
			throws UnsupportedEncodingException, MessagingException {
		
		String username = principal.getName();
		User currentUser = userService.findLoginUser(username);
		
		bulkMail.setUser(currentUser);
		
		String[] recipients = userService.getAllUserEmail();
		
		String text = bulkMail.getContent();
		String htmlFormatedText = text.replace("\r\n", "<br />");
		System.out.println(htmlFormatedText);
		
		String subject = bulkMail.getSubject();
		String body = "<p>" + htmlFormatedText + "</p>";
		
		bulkMail.setContent(htmlFormatedText);
		bulkMailService.save(bulkMail);
		
		emailService.sendBulkMail(recipients, subject, body);
		System.out.println(recipients);
		System.out.println(subject);
		System.out.println(body);
		
		return "redirect:/bulk-mail";
	}
	
//	---------------
//	USER MANAGEMENT
//	---------------
	@GetMapping("/user-management")
	public String userManagementPage(Principal principal, Model model) {
		
		List<User> allUsers = userService.showAllUser();
		
		model.addAttribute("users", allUsers);
		return "Admin/user-management";
	}
	
//	--------------
//	RE-ASSIGN ROLE
//	--------------
	@PostMapping("reassign_user")
	public String reassignUser(@RequestParam Long uid, @RequestParam("name") String role, @ModelAttribute("user") User reassignedUser) {
		
		Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    
    	userService.assignNewRole(user, role);
    	System.out.println(user);
    	return "redirect:user-management";
	}
	
//	-------------------
//	UPDATE USER PROFILE
//	-------------------
	@PostMapping("update_user_profile")
	public String updateProfileInfo(@ModelAttribute("user") User u, @RequestParam String username) {
		
		User user = userService.findUsername(username);
		user.setFullname(u.getFullname());
		user.setOccupation(u.getOccupation());
		user.setLocation(u.getLocation());
		user.setBio(u.getBio());
		
		userService.update(user);
		return "redirect:user-management";
	}
	
//	-------------------
//	DELETE USER PROFILE
//	-------------------
    @GetMapping("delete_user")
    public String deleteUser(@RequestParam Long uid) {
    	
	userService.deleteUser(uid);
	return "redirect:/user-management";
    }
    
    
//	----------------------
//	UPDATE RESPONSE STATUS
//	----------------------
	@PostMapping("update_response")
	public String updateResponse(@RequestParam Long jrId, @ModelAttribute("jobPostResponse") JobPostResponse jobPostResponse) {
		
		JobPostResponse thisJobPost = jobPostResponseService.findJobPostResponse(jrId);
		
		thisJobPost.setStatus(jobPostResponse.getStatus());
		jobPostResponseService.save(thisJobPost);
		
    	return "redirect:/job-post?jpId=" + thisJobPost.getId();
	}
//	---------------------------------
//	DELETE JOB POST RESPONSE (Admins)
//	---------------------------------
	@GetMapping("delete_user_response")
	public String deleteUserJobResponse(@RequestParam Long jrId) {
		
		JobPostResponse thisResponse = jobPostResponseService.findJobPostResponse(jrId);
			
			jobPostResponseService.deleteJobPostResponse(jrId);
			System.out.println("Response Deleted by admin" + jrId);
			
			return "redirect:/job-post?jpId=" + thisResponse.getJobPostId();
	}
}
