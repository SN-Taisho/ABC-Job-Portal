package com.abc.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.Education;

@Repository
public interface EducationRepository extends JpaRepository<Education, Long> {

	@Query("SELECT e FROM Education e WHERE e.userId = :uId")
	List<Education> findAllByUserId(@Param("uId") Long uId);
}
