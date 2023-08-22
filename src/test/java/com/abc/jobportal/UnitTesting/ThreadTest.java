package com.abc.jobportal.UnitTesting;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.entity.ThreadReply;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.repository.ThreadReplyRepository;
import com.abc.jobportal.repository.ThreadRepository;
import com.abc.jobportal.services.ThreadReplyService;
import com.abc.jobportal.services.ThreadService;
import com.abc.jobportal.services.UserService;

@RunWith(MockitoJUnitRunner.class)
public class ThreadTest {

	@Mock
	UserService userService;
	
	@Mock
	ThreadRepository threadRepo;
	
	@InjectMocks
	ThreadService threadService;
	
	@Mock
	ThreadReplyRepository threadReplyRepo;
	
	@InjectMocks
	ThreadReplyService threadReplyService;
	
	@SuppressWarnings("deprecation")
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testSaveThread() {
		
		String username = "anzel";
		User user = userService.findLoginUser(username);
		
		Thread thread = new Thread();
		
		thread.setTitle("JUNIT Thread");
		thread.setContent("JUNIT Thread Content");
		thread.setUser(user);
		
		Mockito.when(threadRepo.save(thread)).thenReturn(thread);
		Thread savedThread = threadService.save(thread);
		Assert.assertEquals(thread, savedThread);
	}
	
	@Test public void testSaveThreadReply() {
		
		String username = "anzel";
		User user = userService.findLoginUser(username);
		
		ThreadReply threadReply = new ThreadReply();
		
		threadReply.setThreadId((long) 2);
		threadReply.setContent("JUNIT Thread Reply");
		threadReply.setUser(user);
		
		Mockito.when(threadReplyRepo.save(threadReply)).thenReturn(threadReply);
		ThreadReply savedThreadReply = threadReplyService.save(threadReply);
		Assert.assertEquals(threadReply, savedThreadReply);
	}
}
