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
public class JobPostResponse {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String contactInfo;
	
	private String content;
	
	private String status;
	
	@CreatedDate
	private String date;
	
	@PrePersist
	private void onCreate() {
		
		DateFormat dateOnly = new SimpleDateFormat("dd MMMMM yyyy HH:mm");
		date = dateOnly.format(new Date());
	}
	
	private Long jobPostId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	
//	CONSTRUCTORS
	public JobPostResponse() {
		super();
	}
	public JobPostResponse(Long id, String contactInfo, String content, String status, String date, Long jobPostId,
			User user) {
		super();
		this.id = id;
		this.contactInfo = contactInfo;
		this.content = content;
		this.status = status;
		this.date = date;
		this.jobPostId = jobPostId;
		this.user = user;
	}
	
	
//	GETTER SETTERS
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getContactInfo() {
		return contactInfo;
	}
	public void setContactInfo(String contactInfo) {
		this.contactInfo = contactInfo;
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
	public Long getJobPostId() {
		return jobPostId;
	}
	public void setJobPostId(Long jobPostId) {
		this.jobPostId = jobPostId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
}