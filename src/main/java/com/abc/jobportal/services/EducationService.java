package com.abc.jobportal.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.Education;
import com.abc.jobportal.repository.EducationRepository;

@Service
@Transactional
public class EducationService {
	
	@Autowired
	EducationRepository educationRepo;
	
//	-------------
//	ADD EDUCATION
//	-------------
	public Education save(Education education) {
		return educationRepo.save(education);
	}
	
//	-------------------
//	EDUCATION RETRIEVAL
//	-------------------
	public List<Education> findAllEduByUserId(Long uId) {
		return educationRepo.findAllByUserId(uId);
	}
	
	public Education findEducation(Long expId) {
		return educationRepo.getById(expId);
	}
	
//	--------------------
//	EDUCATION MANAGEMENT
//	--------------------
	public Education updateEducation(Education education) {
		return educationRepo.save(education);
	}
	
	public void deleteEducation(Long expId) {
		educationRepo.deleteById(expId);
	}
}
