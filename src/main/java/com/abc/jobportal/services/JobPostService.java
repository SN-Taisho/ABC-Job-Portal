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
	JobPostRepository jobPostRepo;
	
//	---------------
//	CREATE JOB POST
//	---------------
	public JobPost save(JobPost jobPost) {
		return jobPostRepo.save(jobPost);
	}
	
//	------------------
//	JOB POST RETRIEVAL
//	------------------
	public List<JobPost> getAllJobPosts() {
		return jobPostRepo.findAll();
	}
	
	public List<JobPost> search(String keyword) {
		return jobPostRepo.search(keyword);
	}
	
	public List<JobPost> getAllJobPostsByDate() {
		return jobPostRepo.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}
	
	public JobPost findJobPost(Long jpId) {
		return jobPostRepo.getById(jpId);
	}
}