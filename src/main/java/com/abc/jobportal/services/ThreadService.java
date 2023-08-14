package com.abc.jobportal.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.repository.ThreadRepository;

@Service
@Transactional
public class ThreadService {

	@Autowired
	ThreadRepository threadRepository;
	
	public Thread save(Thread thread) {
		return threadRepository.save(thread);
	}
	
	public List<Thread> getAllThreads() {
		return threadRepository.findAll();
	}
}