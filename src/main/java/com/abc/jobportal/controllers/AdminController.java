package com.abc.jobportal.controllers;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.abc.jobportal.entity.Role;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.UserService;

@Controller
public class AdminController {
	
	@Autowired
	UserService userService;
	
//	--------------
//	SEND BULK MAIL
//	--------------
	@GetMapping("/bulk-mail")
	public String sendBulkMail() {
		return "Admin/bulk-mail";
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
	public String updateProfileInfo(Principal principal, @ModelAttribute("user") User u, RedirectAttributes redir) {
		
		String username = principal.getName();
		
		User user = userService.findLoginUser(username);
		
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
    public String deleteUser(@RequestParam Long uid, Principal principal) {
    	
		String username = principal.getName();
		User user = userService.findLoginUser(username);

		String[] role = user.getRoles().stream().map(Role::getName).toArray(String[]::new);
		String userRole = role[0];
		String[] roleNames = userService.getAllRoles().stream().map(Role::getName).toArray(String[]::new);

		for (String roleName : roleNames) {
			if (roleName == userRole && userRole.equalsIgnoreCase("Admin")) {
				userService.deleteUser(uid);
				return "redirect:/user-management";
			}
			if (roleName == userRole && userRole.equalsIgnoreCase("User")) {
				return "redirect:/access-denied";
			}
		}
    	return "redirect:access-denied";
    }
    
//	-----------------
//	THREAD MANAGEMENT
//	-----------------
}
