package com.abc.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.Experience;

@Repository
public interface ExperienceRepository extends JpaRepository<Experience, Long> {

	@Query("SELECT e FROM Experience e WHERE e.userId = :uId")
	List<Experience> findAllByUserId(@Param("uId") Long uId);

}
