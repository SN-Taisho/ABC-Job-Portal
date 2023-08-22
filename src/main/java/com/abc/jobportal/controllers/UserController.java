package com.abc.jobportal.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abc.jobportal.entity.Education;
import com.abc.jobportal.entity.Experience;
import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.EducationService;
import com.abc.jobportal.services.ExperienceService;
import com.abc.jobportal.services.ThreadService;
import com.abc.jobportal.services.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	ExperienceService experienceService;
	
	@Autowired
	EducationService educationService;
	
	@Autowired
	ThreadService threadService;
	
	
//	-------------
//	User Homepage
//	-------------
	@GetMapping("/homepage")
	public String userHomepage(Principal principal, Model model) {
		
		String username = principal.getName();
		User userdata = userService.findLoginUser(username);

		List<Thread> threads = threadService.getAllThreadsByDate();
		model.addAttribute("threads", threads);
		
		List<User> user = new ArrayList<User>();
		user.add(userdata);
		model.addAttribute("user", user);
		return "User/homepage";
	}
	
//	-----------------
//	View User Profile
//	-----------------
	@GetMapping("/view-profile")
	public String viewUserProfile(@RequestParam String username, Model model, Principal principal) {
		
		String loggedUser = principal.getName();
		
		if (loggedUser.equals(username)) {
			return "redirect:/my-profile";
		}
		
		User userInfo = userService.findUsername(username);
		List<User> user = new ArrayList<User>();
		user.add(userInfo);
		
		List<Thread> threads = threadService.getAllThreadsByDate();
		List<Experience> experiences = experienceService.findAllExpByUserId(userInfo.getId());
		List<Education> educations = educationService.findAllEduByUserId(userInfo.getId());
		
		
		model.addAttribute("threads", threads);
		model.addAttribute("user", user);
		model.addAttribute("experience", experiences);
		model.addAttribute("education", educations);
		
		return "User/view-profile";
	}
	
//	--------------
//	ADD EXPERIENCE
//	--------------
	@PostMapping("add_experience")
	public String addExperience(@ModelAttribute("experience") Experience experience, Principal principal) {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		
		experience.setUserId(user.getId());
		
		experienceService.save(experience);
		
		return "redirect:/my-profile";
	}
	
//	-----------------
//	UPDATE EXPERIENCE
//	-----------------
	@PostMapping("update_experience")
	public String updateExparience(@ModelAttribute("experience") Experience experience, @RequestParam Long expId, Principal principal) {
		
		String currentUser = principal.getName();
		User user = userService.findLoginUser(currentUser);
		
		Experience thisExperience = experienceService.findExperience(expId);
		Long currentUserId = user.getId();
		
		if (currentUserId.equals(thisExperience.getUserId())) {
			
			thisExperience.setOccupation(experience.getOccupation());
			thisExperience.setCompany(experience.getCompany());
			thisExperience.setStartYear(experience.getStartYear());
			thisExperience.setEndYear(experience.getEndYear());
			
			experienceService.save(thisExperience);
			
			return "redirect:/my-profile";
		}
		return "redirect:access-denied";
	}
	
//	-----------------
//	DELETE EXPERIENCE
//	-----------------
	@GetMapping("delete_experience")
	public String deleteExperience(@RequestParam Long expId, Principal principal) {
		
		String currentUser = principal.getName();
		User user = userService.findLoginUser(currentUser);
		
		Experience thisExperience = experienceService.findExperience(expId);
		Long currentUserId = user.getId();
		
		if (currentUserId.equals(thisExperience.getUserId())) {
			
			experienceService.deleteExperience(expId);
			System.out.println("Experience Deleted expId = " + expId);
			
			return "redirect:/my-profile";
		}		
		return "redirect:/access-denied";
	}
	
//	-------------
//	ADD EDUCATION
//	-------------
	@PostMapping("add_education")
	public String addExperience(@ModelAttribute("education") Education education, Principal principal) {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		
		education.setUserId(user.getId());
		
		educationService.save(education);
		
		return "redirect:/my-profile";
	}
	
//	----------------
//	UPDATE EDUCATION
//	----------------
	@PostMapping("update_education")
	public String updateEducation(@ModelAttribute("education") Education education, @RequestParam Long eduId, Principal principal) {
		
		String currentUser = principal.getName();
		User user = userService.findLoginUser(currentUser);
		
		Education thisEducation = educationService.findEducation(eduId);
		Long currentUserId = user.getId();
		
		if (currentUserId.equals(thisEducation.getUserId())) {
			
			thisEducation.setCourse(education.getCourse());
			thisEducation.setSchool(education.getSchool());
			thisEducation.setStartYear(education.getStartYear());
			thisEducation.setEndYear(education.getEndYear());
			
			educationService.save(thisEducation);
			
			return "redirect:/my-profile";
		}
		return "redirect:access-denied";
	}
	
//	-----------------
//	DELETE EDUCATION
//	-----------------
	@GetMapping("delete_education")
	public String deleteEducation(@RequestParam Long eduId, Principal principal) {
		
		String currentUser = principal.getName();
		User user = userService.findLoginUser(currentUser);
		
		Education thisEducation = educationService.findEducation(eduId);
		Long currentUserId = user.getId();
		
		if (currentUserId.equals(thisEducation.getUserId())) {
			
			educationService.deleteEducation(eduId);
			System.out.println("Experience Deleted expId = " + eduId);
			
			return "redirect:/my-profile";
		}		
		return "redirect:/access-denied";
	}
	
}
