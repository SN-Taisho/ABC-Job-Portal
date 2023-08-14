package com.abc.jobportal.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
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
public class JobPost {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
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
	
	private String title;
	
	private String company;
	
	private String salary;
	
	private String content;
	
	@Column(nullable = true, length = 64)
	private String photos;

	@Column(nullable = true, length = 64)
	private String photoImagePath;

	
//	CONTRUCTORS
	public JobPost() {
		
	}
	
	public JobPost(Long id, User user, String date, String title, String company, String salary, String content,
			String photos, String photoImagePath) {
		super();
		this.id = id;
		this.user = user;
		this.date = date;
		this.title = title;
		this.company = company;
		this.salary = salary;
		this.content = content;
		this.photos = photos;
		this.photoImagePath = photoImagePath;
	}


	//	GETTER SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getPhotoImagePath() {
		return photoImagePath;
	}

	public void setPhotoImagePath(String photoImagePath) {
		this.photoImagePath = photoImagePath;
	}
	

	//	TO STRING
	@Override
	public String toString() {
		return "JobPost [id=" + id + ", user=" + user + ", date=" + date + ", title=" + title + ", content="
				+ content + ", photos=" + photos + ", photoImagePath=" + photoImagePath + "]";
	}
}
