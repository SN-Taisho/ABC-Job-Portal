package com.abc.jobportal.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class JobPostController {
	
	
	@GetMapping("/jobs")
	public String jobListingPage() {
		return "Jobs/job-listing";
	}
	
	@GetMapping("/job-post")
	public String jobPostPage() {
		return "Jobs/job-post";
	}
	
	@GetMapping("create-job-post")
	public String createJobPost() {
		return "Jobs/create-job-post";
	}

}
