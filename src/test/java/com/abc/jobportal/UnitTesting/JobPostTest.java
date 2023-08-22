package com.abc.jobportal.UnitTesting;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.abc.jobportal.entity.JobPostResponse;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.repository.JobPostResponseRepository;
import com.abc.jobportal.services.JobPostResponseService;
import com.abc.jobportal.services.UserService;

@RunWith(MockitoJUnitRunner.class)
public class JobPostTest {
	
	@Mock
	UserService userService;
	
	@InjectMocks
	JobPostResponseService jobPostResponseService;
	
	@Mock
	JobPostResponseRepository jobPostResponseRepo;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testSaveJobResponse() {
		
		String username = "alex";
		User user = userService.findLoginUser(username);
		
		JobPostResponse jobPostResponse = new JobPostResponse();
		
		jobPostResponse.setContactInfo("+63-09062820823");
		jobPostResponse.setJobPostId((long) 1);
		jobPostResponse.setContent("JUNIT Hire Me");
		jobPostResponse.setStatus("pending");
		jobPostResponse.setUser(user);
		
		Mockito.when(jobPostResponseRepo.save(jobPostResponse)).thenReturn(jobPostResponse);
		JobPostResponse savedJobPostResponse = jobPostResponseService.save(jobPostResponse);
		Assert.assertEquals(jobPostResponse, savedJobPostResponse);
	}
}
