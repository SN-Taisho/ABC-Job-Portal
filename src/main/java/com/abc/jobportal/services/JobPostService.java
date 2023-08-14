package com.abc.jobportal.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.JobPost;
import com.abc.jobportal.repository.JobPostRepository;

@Service
@Transactional
public class JobPostService {
	
	@Autowired
	JobPostRepository jobPostRepository;
	
	public JobPost save(JobPost jobPost) {
		return jobPostRepository.save(jobPost);
	}
	
	public List<JobPost> getAllJobPosts() {
		return jobPostRepository.findAll();
	}
}