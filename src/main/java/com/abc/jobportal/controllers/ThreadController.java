package com.abc.jobportal.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.abc.jobportal.entity.Thread;
import com.abc.jobportal.entity.ThreadReply;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.services.ThreadReplyService;
import com.abc.jobportal.services.ThreadService;
import com.abc.jobportal.services.UserService;

@Controller
public class ThreadController {

	@Autowired
	UserService userService;
	
	@Autowired
	ThreadService threadService;
	
	@Autowired
	ThreadReplyService threadReplyService;
	
//	----------------
//	THREADS CREATION
//	----------------
	@GetMapping("/create-thread")
	public String createThreadPage() {
		return "Threads/create-thread";
	}
	
	@PostMapping("create_thread")
	public String createThread(@ModelAttribute("thread") Thread thread, Principal principal) {
		
		String username = principal.getName();

		User user = userService.findLoginUser(username);
		
		thread.setUser(user);
		
		threadService.save(thread);
		
		return "redirect:homepage";
	}

//	-----------
//	VIEW THREAD
//	-----------
	@GetMapping("/thread")
	public String viewThreadPage(@RequestParam Long tId, Model model) {
		
		System.out.println("Viewing Thread Id = " + tId);
		Thread threadContent = threadService.findThread(tId);
		List<Thread> thread = new ArrayList<Thread>();
		thread.add(threadContent);
		
		List<ThreadReply> replies = threadReplyService.getThreadReplies(tId);
		
		model.addAttribute("thread", thread);
		model.addAttribute("replies", replies);
		
		return "Threads/thread";
	}
	
//	---------------
//	REPLY TO THREAD
//	---------------
	@PostMapping("reply_thread")
	public String repyToThread(@ModelAttribute("threadReply") ThreadReply threadReplies, Principal principal) {
		
		String username = principal.getName();
		
		User user = userService.findLoginUser(username);
		
		threadReplies.setUser(user);
		
		threadReplyService.save(threadReplies);
		
		return "redirect:thread?tId=" + threadReplies.getThreadId();
	}
	
}