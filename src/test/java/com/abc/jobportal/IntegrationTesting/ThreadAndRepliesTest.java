package com.abc.jobportal.IntegrationTesting;

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
public class ThreadAndRepliesTest {

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
	public void testSaveThreadAndReplies() {
		
		String username1 = "anzel";
		User user1 = userService.findLoginUser(username1);
		
		Thread thread = new Thread();
		
		thread.setId((long) 4);
		thread.setTitle("JUNIT Thread");
		thread.setContent("JUNIT Thread Content");
		thread.setUser(user1);
		
		Mockito.when(threadRepo.save(thread)).thenReturn(thread);
		Thread savedThread = threadService.save(thread);
		Assert.assertEquals(thread, savedThread);
		
		
		String username2 = "alex";
		User user2 = userService.findLoginUser(username2);
		
		ThreadReply threadReply = new ThreadReply();
		
		threadReply.setThreadId((long) 4);
		threadReply.setContent("JUNIT Thread Reply");
		threadReply.setUser(user2);
		
		Mockito.when(threadReplyRepo.save(threadReply)).thenReturn(threadReply);
		ThreadReply savedThreadReply = threadReplyService.save(threadReply);
		Assert.assertEquals(threadReply, savedThreadReply);
		
		Assert.assertEquals(savedThreadReply.getThreadId(), savedThread.getId());
	}
}
