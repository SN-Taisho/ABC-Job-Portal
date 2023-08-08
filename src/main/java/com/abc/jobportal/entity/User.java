package com.abc.jobportal.entity;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class User {
	
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private Long id;

    private String fullname;
    
    private String username;
    
    @ManyToMany
    @JoinTable( name="user_role",
                joinColumns = @JoinColumn(name = "user_id"),
                inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles = new HashSet<>();
    
    private String email;
    
    private String password;
    
    private Long OTP;
    
    private String status;
    
    private String occupation;
    
    private String location;
    
    private String bio;
    
//  CONTRUCTORS
    public User() {

    }

	public User(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public User(String fullname, String username, Set<Role> roles, String password) {
		super();
		this.fullname = fullname;
		this.username = username;
		this.roles = roles;
		this.password = password;
	}

	public User(Long id, String fullname, String username, Set<Role> roles, String email, String password, Long oTP,
			String status, String occupation, String location, String bio) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.username = username;
		this.roles = roles;
		this.email = email;
		this.password = password;
		OTP = oTP;
		this.status = status;
		this.occupation = occupation;
		this.location = location;
		this.bio = bio;
	}

	
//	GETTER SETTERS
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getOTP() {
		return OTP;
	}

	public void setOTP(Long oTP) {
		OTP = oTP;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}


//	EQUALS AND HASH
	@Override
	public boolean equals(Object o) {
	    if (this == o) return true;
	    if (o == null || getClass() != o.getClass()) return false;
	    User user = (User) o;
	    return username.equals(user.username) &&
	            password.equals(user.password);
	}
	
	@Override
	public int hashCode() {
	    return Objects.hash(username, password);
	}

	
//	TO STRING
	@Override
	public String toString() {
		return "User [id=" + id + ", fullname=" + fullname + ", username=" + username + ", roles=" + roles + ", email="
				+ email + ", password=" + password + ", OTP=" + OTP + ", status=" + status + ", occupation="
				+ occupation + ", location=" + location + ", bio=" + bio + "]";
	}
}
