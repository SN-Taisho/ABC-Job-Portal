package com.abc.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.ThreadReply;
import com.abc.jobportal.entity.User;

@Repository
public interface ThreadReplyRepository extends JpaRepository<ThreadReply, Long> {

	@Query("SELECT t FROM ThreadReply t WHERE t.threadId = :tId ORDER BY t.date DESC")
	List<ThreadReply> findByThreadId(@Param("tId") Long tId);
	
	List<ThreadReply> findByUser(User user);
}
