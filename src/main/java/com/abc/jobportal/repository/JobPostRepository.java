package com.abc.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.JobPost;

@Repository
public interface JobPostRepository extends JpaRepository<JobPost, Long>{

}
