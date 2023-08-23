package com.abc.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.JobPost;

@Repository
public interface JobPostRepository extends JpaRepository<JobPost, Long> {
	
	@Query(value = "SELECT j FROM JobPost j WHERE j.title LIKE '%' || :keyword || '%'"
			+ " OR j.company LIKE '%' || :keyword || '%'" + " OR j.salary LIKE '%' || :keyword || '%'"
			+ " OR j.date LIKE '%' || :keyword || '%'" + " OR j.content LIKE '%' || :keyword || '%'")
	public List<JobPost> search(@Param("keyword") String keyword);

}
