package com.abc.jobportal.IntegrationTesting;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.abc.jobportal.entity.JobPost;
import com.abc.jobportal.entity.JobPostResponse;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.repository.JobPostRepository;
import com.abc.jobportal.repository.JobPostResponseRepository;
import com.abc.jobportal.services.JobPostResponseService;
import com.abc.jobportal.services.JobPostService;
import com.abc.jobportal.services.UserService;

@RunWith(MockitoJUnitRunner.class)
public class JobPostAndJobResponseTest {

	@Mock
	UserService userService;
	
	@InjectMocks
	JobPostService jobPostService;
	
	@Mock
	JobPostRepository jobPostRepo;
	
	@InjectMocks
	JobPostResponseService jobPostResponseService;
	
	@Mock
	JobPostResponseRepository jobPostResponseRepo;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testJobPostAndJobResponse() {
		
		String adminname = "anzel";
		User admin = userService.findLoginUser(adminname);
		
		JobPost jobPost = new JobPost();
		
		jobPost.setId((long) 2); 
		jobPost.setCompany("Amazon");
		jobPost.setTitle("IT Manager");
		jobPost.setSalary("180,000");
		jobPost.setUser(admin);
		
		Mockito.when(jobPostRepo.save(jobPost)).thenReturn(jobPost);
		JobPost savedJobPost = jobPostService.save(jobPost);
		Assert.assertEquals(jobPost, savedJobPost);
		
		String username = "alex";
		User user = userService.findLoginUser(username);
		
		JobPostResponse jobPostResponse = new JobPostResponse();
		
		jobPostResponse.setContactInfo("+63-09062820823");
		jobPostResponse.setJobPostId((long) 2);
		jobPostResponse.setContent("JUNIT Hire Me");
		jobPostResponse.setStatus("pending");
		jobPostResponse.setUser(user);
		
		Mockito.when(jobPostResponseRepo.save(jobPostResponse)).thenReturn(jobPostResponse);
		JobPostResponse savedJobPostResponse = jobPostResponseService.save(jobPostResponse);
		Assert.assertEquals(jobPostResponse, savedJobPostResponse);
		
		Assert.assertEquals(savedJobPostResponse.getJobPostId(), savedJobPost.getId());
	}
	
	
}
