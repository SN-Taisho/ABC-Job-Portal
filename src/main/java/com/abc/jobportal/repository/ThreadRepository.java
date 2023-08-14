package com.abc.jobportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.Thread;

@Repository
public interface ThreadRepository extends JpaRepository<Thread, Long>{

}
