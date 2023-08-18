package com.abc.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.JobPostResponse;
import com.abc.jobportal.entity.User;

@Repository
public interface JobPostResponseRepository extends JpaRepository<JobPostResponse, Long> {
	
	@Query("SELECT j FROM JobPostResponse j WHERE j.jobPostId = :jpId ORDER BY j.date DESC")
	List<JobPostResponse> findByJobPostId(@Param("jpId") Long jpId);
	
	List<JobPostResponse> findByUser(User user);
}
