package com.abc.jobportal.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.BulkMail;
import com.abc.jobportal.repository.BulkMailRepository;

@Service
@Transactional
public class BulkMailService {
	
	@Autowired
	BulkMailRepository bulkMailRepo;

//	--------------
//	SAVE BULK MAIL
//	--------------
	public BulkMail save(BulkMail bulkMail) {
		return bulkMailRepo.save(bulkMail);
	}

//	-------------------
//	BULK MAIL RETRIEVAL
//	-------------------
	public List<BulkMail> getAllBulkMailByDate() {
		return bulkMailRepo.findAll(Sort.by(Sort.Direction.DESC, "date"));
	}
}
