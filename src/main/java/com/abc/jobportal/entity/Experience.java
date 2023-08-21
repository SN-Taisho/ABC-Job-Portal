package com.abc.jobportal.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Experience {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String occupation;
	
	private String company;
	
	private String startYear;
	
	private String endYear;
	
	private Long userId;
	
	
//	CONSTRUCTORS
	public Experience() {
		
	}
	
	public Experience(Long id, String occupation, String company, String startYear, String endYear, Long userId) {
		super();
		this.id = id;
		this.occupation = occupation;
		this.company = company;
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

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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
