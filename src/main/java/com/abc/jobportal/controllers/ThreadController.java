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
		
		String text = thread.getContent();
		String htmlFormatedText = text.replace("\r\n", "<br />");
		thread.setContent(htmlFormatedText);
		
		threadService.save(thread);
		
		return "redirect:homepage";
	}

//	-----------
//	VIEW THREAD
//	-----------
	@GetMapping("/thread")
	public String viewThreadPage(@RequestParam Long tId, Model model, Principal principal) {
		
		String username = principal.getName();
		
		model.addAttribute("currentUser", username);
		
		System.out.println("Viewing Thread Id = " + tId);
		Thread threadContent = threadService.findThread(tId);
		List<Thread> thread = new ArrayList<Thread>();
		thread.add(threadContent);
		
		List<ThreadReply> replies = threadReplyService.getThreadReplies(tId);
		
		model.addAttribute("thread", thread);
		model.addAttribute("replies", replies);
		
		return "Threads/thread";
	}
	
//	-------------
//	UPDATE THREAD
//	-------------
	@PostMapping("update_thread")
	public String updateThread(@ModelAttribute("thread") Thread thread, @RequestParam Long tId, Principal principal) {
		
		String currentUser = principal.getName();
		
		Thread thisThread = threadService.findThread(tId);
		String poster = thisThread.getUser().getUsername();
		
		if (currentUser.equals(poster)) {
			
			String text = thread.getContent();
			String htmlFormatedText = text.replace("\r\n", "<br />");
			thread.setContent(htmlFormatedText);
			
			thisThread.setTitle(thread.getTitle()  + " (edited)");
			thisThread.setContent(thread.getContent());
			
			threadService.save(thisThread);
			
			return "redirect:/thread?tId=" + tId;
		}
		return "redirect:/access-denied";
	}
	
//	-------------
//	DELETE THREAD
//	-------------
	@GetMapping("delete_thread")
	public String deleteThread(@RequestParam Long tId, Principal principal) {
		
		String currentUser = principal.getName();
		
		Thread thisThread = threadService.findThread(tId);
		String poster = thisThread.getUser().getUsername();
		
		if (currentUser.equals(poster)) {
			threadService.deleteThread(tId);
			System.out.println("Thread Deleted " + tId);
			
			return "redirect:/homepage";
		}		
		return "redirect:/access-denied";
	}
	
//	---------------
//	REPLY TO THREAD
//	---------------
	@PostMapping("reply_thread")
	public String repyToThread(@ModelAttribute("threadReply") ThreadReply threadReply, Principal principal) {
		
		String username = principal.getName();
		
		User user = userService.findLoginUser(username);
		
		threadReply.setUser(user);
		
		String text = threadReply.getContent();
		String htmlFormatedText = text.replace("\r\n", "<br />");
		threadReply.setContent(htmlFormatedText);
		
		threadReplyService.save(threadReply);
		
		return "redirect:thread?tId=" + threadReply.getThreadId();
	}
	
//	------------
//	UPDATE REPLY
//	------------
	@PostMapping("update_reply")
	public String updateReply(@ModelAttribute("threadReply") ThreadReply threadReply, @RequestParam Long trId, Principal principal) {
		
		String currentUser = principal.getName();
		
		Long threadId = threadReply.getThreadId();
		ThreadReply thisThreadReply = threadReplyService.findThreadReply(trId);
		String poster = thisThreadReply.getUser().getUsername();
		
		if (currentUser.equals(poster)) {
			
			String text = threadReply.getContent();
			String htmlFormatedText = text.replace("\r\n", "<br />");
			threadReply.setContent(htmlFormatedText);
			
			thisThreadReply.setContent(threadReply.getContent() + " (edited)");
			
			threadReplyService.save(thisThreadReply);
			
			return "redirect:/thread?tId=" + threadId;
		}
		return "redirect:access-denied";
	}
	
//	------------
//	DELETE REPLY
//	------------
	@GetMapping("delete_reply")
	public String deleteReply(@RequestParam Long trId, Principal principal) {
		
		String currentUser = principal.getName();
		
		ThreadReply thisReply = threadReplyService.findThreadReply(trId);
		String poster = thisReply.getUser().getUsername();
		
		if (currentUser.equals(poster)) {
			threadReplyService.deleteThreadReply(trId);
			System.out.println("Reply Deleted " + trId);
			
			return "redirect:/thread?tId=" + thisReply.getThreadId();
		}		
		return "redirect:/access-denied";
	}
}