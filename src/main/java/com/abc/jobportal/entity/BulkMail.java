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
public class BulkMail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String subject;
	
	private String content;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	@CreatedDate
	private String date;
	
	@PrePersist
	private void onCreate() {
		
		DateFormat dateOnly = new SimpleDateFormat("dd MMMMM yyyy HH:mm");
		date = dateOnly.format(new Date());
	}
	
	
//	CONSTRUCTORS
	public BulkMail() {
		
	}
	
	public BulkMail(Long id, String subject, String content, User user, String date) {
		super();
		this.id = id;
		this.subject = subject;
		this.content = content;
		this.user = user;
		this.date = date;
	}

	
//	GETTER SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
