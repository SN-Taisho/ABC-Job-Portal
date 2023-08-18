package com.abc.jobportal.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.JobPost;
import com.abc.jobportal.repository.JobPostRepository;

@Service
@Transactional
public class JobPostService {
	
	@Autowired
	JobPostRepository jobPostRepository;
	
//	---------------
//	CREATE JOB POST
//	---------------
	public JobPost save(JobPost jobPost) {
		return jobPostRepository.save(jobPost);
	}
	
//	------------------
//	JOB POST RETRIEVAL
//	------------------
	public List<JobPost> getAllJobPosts() {
		return jobPostRepository.findAll();
	}
	
	public List<JobPost> getAllJobPostsByDate() {
		return jobPostRepository.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}
	
	public JobPost findJobPost(Long jpId) {
		return jobPostRepository.getById(jpId);
	}
}