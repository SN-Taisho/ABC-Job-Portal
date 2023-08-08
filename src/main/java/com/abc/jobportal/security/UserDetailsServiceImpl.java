package com.abc.jobportal.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.abc.jobportal.entity.Role;
import com.abc.jobportal.entity.User;
import com.abc.jobportal.repository.UserRepository;

import java.util.Arrays;

import javax.transaction.Transactional;

@Transactional
public class UserDetailsServiceImpl implements UserDetailsService {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private PasswordEncoder passwordEncoder;

	public UserDetailsServiceImpl() {
	}

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		User user = userRepository.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("User " + username + " is not valid. Please enter correct username.");
		}
		org.springframework.security.core.userdetails.User.UserBuilder userBuilder = org.springframework.security.core.userdetails.User
				.builder();

		String[] roleNames = user.getRoles().stream().map(Role::getName).toArray(String[]::new);

		System.out.println("Role name is " + Arrays.toString(roleNames));

		return userBuilder.username(user.getUsername()).password(user.getPassword()).roles(roleNames)
				// .passwordEncoder(passwordEncoder::encode)
				.build();
	}
}