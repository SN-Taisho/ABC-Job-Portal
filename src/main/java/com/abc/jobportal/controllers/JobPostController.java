package com.abc.jobportal.controllers;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.abc.jobportal.entity.JobPost;
import com.abc.jobportal.entity.JobPostResponse;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.JobPostResponseService;
import com.abc.jobportal.services.JobPostService;
import com.abc.jobportal.services.UserService;

@Controller
public class JobPostController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	JobPostService jobPostService;
	
	@Autowired
	JobPostResponseService jobPostResposeService;
	
//	-----------------
//	JOB POST CREATION
//	-----------------
	@GetMapping("create-job-post")
	public String createJobPostPage() {
		return "Jobs/create-job-post";
	}
	
	@PostMapping("create_job_post")
	public String createJobPost(@ModelAttribute("jobPost") JobPost jobPost,@RequestParam("fileImage") MultipartFile multipartFile, Principal principal)
		throws IOException {
		
		String username = principal.getName();
		User user = userService.findLoginUser(username);
		jobPost.setUser(user);
		
		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		
		jobPost.setPhotos(fileName);
		JobPost savedJobPost = jobPostService.save(jobPost);
		
		String uploadDir = "./src/main/resources/static/images/post-image/" + savedJobPost.getId();
		Path uploadPath = Paths.get(uploadDir);
		
		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			System.out.println(filePath.toFile().getAbsolutePath());
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw new IOException("Could not save uploaded file: " + fileName);
		}
		
		jobPost.setPhotoImagePath("/images/post-image/" + savedJobPost.getId() + "/" + savedJobPost.getPhotos());
		
		jobPostService.save(jobPost);
		
		return "redirect:dashboard";
	}
	
//	------------
//	JOBS LISTING
//	------------
	@GetMapping("/jobs")
	public String jobListingPage(Model model) {
		
		List<JobPost> jobPosts = jobPostService.getAllJobPosts();
		model.addAttribute("jobPosts", jobPosts);
		
		return "Jobs/job-listing";
	}
	
//	-------------
//	VIEW JOB POST
//	-------------
	@GetMapping("/job-post")
	public String viewJobPost(@RequestParam Long jpId, Model model) {
		
		System.out.println("Viewing Job Post Id = " + jpId);
		JobPost jobPostContent = jobPostService.findJobPost(jpId);
		List<JobPost> jobPost = new ArrayList<JobPost>();
		jobPost.add(jobPostContent);
		
		List<JobPostResponse> responses = jobPostResposeService.getJobPostResponses(jpId);
		
		model.addAttribute("jobPost", jobPost);
		model.addAttribute("responses", responses);
		
		return "Jobs/job-post";
	}
	
//	------------------------
//	CREATE JOB POST RESPONSE
//	------------------------
	@PostMapping("respond_job_post")
	public String respondJobPost(@ModelAttribute("jobPostResponse") JobPostResponse jobPostResponse, Principal principal) {
		
		String username = principal.getName();
		
		User user = userService.findLoginUser(username);
		
		jobPostResponse.setUser(user);
		
		jobPostResposeService.save(jobPostResponse);
		
		return "redirect:/job-post?jpId=" + jobPostResponse.getJobPostId();
	}
}
