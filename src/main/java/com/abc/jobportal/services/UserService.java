package com.abc.jobportal.services;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.abc.jobportal.entity.User;
import com.abc.jobportal.repository.RoleRepository;
import com.abc.jobportal.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	RoleRepository roleRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public String save(User user) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		user.setRoles(new HashSet<>(roleRepo.findBySpecificRoles("User")));
		
		userRepo.save(user);
		
		return "User saved successfully";
	}
	
	public Boolean activate(String username) {
		User user = userRepo.findByUsername(username);
		
		if (user == null || user.isActivated()) {
			return false;
		}
		else {
			userRepo.activate(user.getId());
			return true;
		}
	}
	
	public User findUsername(String username) {
		return userRepo.findByUsername(username);
	}
	
	public User findLoginUser(String username) {
	
		return userRepo.findByUsername(username);
		
	}
	
	public List<User> showAllUser(){
		
		return userRepo.findAll();
	}
	
	public void update(User user) {
		
		userRepo.save(user);
		
	}
	
	public Optional<User> getUserInfo(long uid){
		
		return userRepo.findById(uid);
		
	}
	
	public void deleteUser(long uid) {
		
		userRepo.deleteById(uid);
	}
	
	public void assignNewRole(User user, String role) {
		
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepo.findBySpecificRoles(role)));
		userRepo.save(user);
	}
}
