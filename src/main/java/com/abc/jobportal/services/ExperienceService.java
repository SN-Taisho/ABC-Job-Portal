package com.abc.jobportal.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.Experience;
import com.abc.jobportal.repository.ExperienceRepository;

@Service
@Transactional
public class ExperienceService {

	@Autowired
	ExperienceRepository experienceRepo;
	
//	--------------
//	ADD EXPERIENCE
//	--------------
	public Experience save(Experience experience) {
		return experienceRepo.save(experience);
	}
	
//	--------------------
//	EXPERIENCE RETRIEVAL
//	--------------------
	public List<Experience> findAllExpByUserId(Long uId) {
		return experienceRepo.findAllByUserId(uId);
	}
	
	public Experience findExperience(Long expId) {
		return experienceRepo.getById(expId);
	}
	
//	---------------------
//	EXPERIENCE MANAGEMENT
//	---------------------
	public Experience updateExperience(Experience experience) {
		return experienceRepo.save(experience);
	}
	
	public void deleteExperience(Long expId) {
		experienceRepo.deleteById(expId);
	}
}
