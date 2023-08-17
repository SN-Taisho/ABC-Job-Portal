package com.abc.jobportal.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.repository.ThreadRepository;

@Service
@Transactional
public class ThreadService {

	@Autowired
	ThreadRepository threadRepository;
	
//	---------------
//	CREATE A THREAD
//	---------------
	public Thread save(Thread thread) {
		return threadRepository.save(thread);
	}
	
//	----------------
//	THREAD RETRIEVAL
//	----------------
	public List<Thread> getAllThreads() {
		return threadRepository.findAll();
	}
	
	public List<Thread> getAllThreadsByDate() {
		return threadRepository.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}

	public Thread findThread(Long tId) {
		return threadRepository.getById(tId);
	}
}