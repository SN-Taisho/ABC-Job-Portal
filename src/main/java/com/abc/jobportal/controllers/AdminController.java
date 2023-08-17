package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {
	
//	---------------
//	USER MANAGEMENT
//	---------------
	@GetMapping("/user-management")
	public String userManagementPage() {
		return"Admin/user-management";
	}
	
//	--------------
//	SEND BULK MAIL
//	--------------
	@GetMapping("/bulk-mail")
	public String sendBulkMail() {
		return "Admin/bulk-mail";
	}
}
