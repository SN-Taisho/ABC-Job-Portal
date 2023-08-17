package com.abc.jobportal.services;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.ThreadReply;
import com.abc.jobportal.repository.ThreadReplyRepository;

@Service
@Transactional
public class ThreadReplyService {

	@Autowired
	ThreadReplyRepository threadReplyRepo;
	
	public ThreadReply save(ThreadReply threadReplies) {
		return threadReplyRepo.save(threadReplies);
	}
	
	public List<ThreadReply> getAllReplies() {
		return threadReplyRepo.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}
	
	public List<ThreadReply> getThreadReplies(Long tId) {
		return threadReplyRepo.findByThreadId(tId);
	}
	
	public void deleteThreadReply(Long tId) {
		threadReplyRepo.deleteById(tId);
	}
	
	public Optional<ThreadReply> getThreadReplyInfo(Long tId) {
		return threadReplyRepo.findById(tId);
	}
	
	public ThreadReply updateThreadReplies(ThreadReply threadReplies) {
		return threadReplyRepo.save(threadReplies);
	}
}
