package com.abc.jobportal.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

@Entity
public class ThreadReply {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String content;
	
	@CreatedDate
	private String date;
	
	@PrePersist
	private void onCreate() {
		
		DateFormat dateOnly = new SimpleDateFormat("dd MMMMM yyyy HH:mm");
		date = dateOnly.format(new Date());
	}
	
	private Long threadId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	
//	CONTRUCTORS
	public ThreadReply() {
		super();
	}
	
	public ThreadReply(Long id, String content, String date, Long threadId, User user) {
		super();
		this.id = id;
		this.content = content;
		this.date = date;
		this.threadId = threadId;
		this.user = user;
	}
	
	
//	GETTER SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Long getThreadId() {
		return threadId;
	}

	public void setThreadId(Long threadId) {
		this.threadId = threadId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
