package com.abc.jobportal.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.Thread;

@Repository
public interface ThreadRepository extends JpaRepository<Thread, Long>{
	
	Optional<Thread> findById(Long tId);
	 
	@Query(value = "SELECT t FROM Thread t WHERE t.title LIKE '%' || :keyword || '%'"
			+ " OR t.content LIKE '%' || :keyword || '%'" + " OR t.date LIKE '%' || :keyword || '%'")
	public List<Thread> search(@Param("keyword") String keyword);
}
