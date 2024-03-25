package com.jonathan.group_project.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;


import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;

@Entity
@Table(name="users")
public class User {
	   @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    
	    @NotBlank(message="Username is required!")
	    @Size(min=3, max=30, message="Username must be between 3 characters")
	    private String userName;
	    
	    @NotBlank(message="Email is required!")
	    @Email(message="Please enter a valid email!")
	    private String email;
	    
	    @NotBlank(message="Password is required!")
	    @Size(min=8, max=128, message="Password must be at least 8 characterds")
	    private String password;
	    
	    @Transient
	    @NotEmpty(message="Confirm Password is required!")
	    @Size(min=8, max=128, message="Confirm Password must be at least 8")
	    private String confirm;
	    
	    //this create our one-to-many from users and comments. Comments will be hanle on a 
	    @OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	    private List<Comment> comments;
	    
	    @OneToMany(mappedBy="user", fetch=FetchType.LAZY)
	    private List<CommentManyToMany> likes;
	    
	    @Column(updatable = false)
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date createdAt;
		
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private Date updatedAt;
		
		public User() {}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
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

		public String getConfirm() {
			return confirm;
		}

		public void setConfirm(String confirm) {
			this.confirm = confirm;
		}

		public Date getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}

		public Date getUpdatedAt() {
			return updatedAt;
		}

		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}
	    

		@PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }
	    
		@PreUpdate
	    protected void onUpdate(){
	    	this.updatedAt = new Date();
	    }

		public List<Comment> getComments() {
			return comments;
		}

		public void setComments(List<Comment> comments) {
			this.comments = comments;
		}

		public List<CommentManyToMany> getLikes() {
			return likes;
		}

		public void setLikes(List<CommentManyToMany> likes) {
			this.likes = likes;
		}

	    
}
