package com.abc.jobportal.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.BulkMail;

@Repository
public interface BulkMailRepository extends JpaRepository<BulkMail, Long> {

	Optional<BulkMail> findById(Long tId);
}
