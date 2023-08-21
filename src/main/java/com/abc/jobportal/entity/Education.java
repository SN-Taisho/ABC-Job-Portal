package com.abc.jobportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Education {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String course;
	
	private String school;
	
	private String startYear;
	
	private String endYear;
	
	private Long userId;
	
	
//	CONSTRUCTORS
	public Education() {
		
	}
	
	public Education(Long id, String course, String school, String startYear, String endYear, Long userId) {
		super();
		this.id = id;
		this.course = course;
		this.school = school;
		this.startYear = startYear;
		this.endYear = endYear;
		this.userId = userId;
	}

	
//	GETTER SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getStartYear() {
		return startYear;
	}

	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}

	public String getEndYear() {
		return endYear;
	}

	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}
}
