package com.abc.jobportal.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.JobPostResponse;
import com.abc.jobportal.repository.JobPostResponseRepository;

@Service
@Transactional
public class JobPostResponseService {

	@Autowired
	JobPostResponseRepository jobPostResponseRepo;
	
//	----------------------
//	SAVE JOB POST RESPONSE
//	----------------------
	public JobPostResponse save(JobPostResponse jobPostResponse) {
		return jobPostResponseRepo.save(jobPostResponse);
	}
	
//	------------------
//	RESPONSE RETRIEVAL
//	------------------
	public List<JobPostResponse> getJobPostResponses(Long jpId) {
		return jobPostResponseRepo.findByJobPostId(jpId);
	}
	
	public Optional<JobPostResponse> getJobPostResponseInfo(Long jpId) {
		return jobPostResponseRepo.findById(jpId);
	}
	
//	-------------------
//	RESPONSE MANAGEMENT
//	-------------------
	public JobPostResponse updateJobPostResponse(JobPostResponse jobPostResponse) {
		return jobPostResponseRepo.save(jobPostResponse);
	}
	
	public void deleteJobPostResponse(Long jpId) {
		jobPostResponseRepo.deleteById(jpId);
	}
}
