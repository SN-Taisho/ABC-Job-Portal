package com.abc.jobportal.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.abc.jobportal.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long>{
	
	User findByUsername(String username);
	
	User findByEmail(String email);
	
	@Query("UPDATE User u SET u.activated = true WHERE u.id = ?1")
	@Modifying
	public void activate(long id);
	
	
	@Query(value = "SELECT u FROM User u WHERE u.fullname LIKE '%' || :keyword || '%'"
			+ " OR u.username LIKE '%' || :keyword || '%'" + " OR u.location LIKE '%' || :keyword || '%'"
			+ " OR u.occupation LIKE '%' || :keyword || '%'" + " OR u.email LIKE '%' || :keyword || '%'")
	public List<User> search(@Param("keyword") String keyword);
}
