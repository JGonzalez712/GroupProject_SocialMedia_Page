package com.jonathan.group_project.models;

import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
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
@Table(name = "users")
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	/*
	 * TODO: to be added later: a user needs a first and last name
	 * 
	 * @NotBlank
	 * private String firstname;
	 * 
	 * @Column(nullable = true)
	 * private String lastname;
	 */
	@NotBlank(message = "Username is required!")
	@Size(min = 3, max = 30, message = "Username must be between 3 characters")
	private String username;

	@NotBlank(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;

	@NotBlank(message = "Password is required!")
	@Size(min = 8, max = 128, message = "Password must be at least 8 characterds")
	private String password;

	@Transient
	@NotEmpty(message = "Confirm Password is required!")
	@Size(min = 8, max = 128, message = "Confirm Password must be at least 8")
	private String confirm;

	// this create our one-to-many from users and comments. Comments will be hanle
	// on a
	@OneToMany(mappedBy = "author", fetch = FetchType.LAZY)
	private List<Comment> comments;

	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	private List<CommentLikedByUsers> likedComments;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "story_like", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "story_id"))
	private Set<Story> likedStories;

	@OneToMany(mappedBy = "author", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private List<Story> authoredStories;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "saved_stories", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "story_id"))
	private List<Story> savedStories;

	public User() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String userName) {
		this.username = userName;
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
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<CommentLikedByUsers> getLikedComments() {
		return likedComments;
	}

	public void setLikedComments(List<CommentLikedByUsers> likedComments) {
		this.likedComments = likedComments;
	}

	public Set<Story> getLikedStories() {
		return likedStories;
	}

	public void setLikedStories(Set<Story> likedStories) {
		this.likedStories = likedStories;
	}

	public List<Story> getAuthoredStories() {
		return authoredStories;
	}

	public void setAuthoredStories(List<Story> authoredStories) {
		this.authoredStories = authoredStories;
	}

	public List<Story> getSavedStories() {
		return savedStories;
	}

	public void setSavedStories(List<Story> savedStories) {
		this.savedStories = savedStories;
	}
	/*
	 * TODO: to be added later
	 * public String getFirstname() {
	 * return firstname;
	 * }
	 * 
	 * public void setFirstname(String firstname) {
	 * this.firstname = firstname;
	 * }
	 * 
	 * public String getLastname() {
	 * return lastname;
	 * }
	 * 
	 * public void setLastname(String lastname) {
	 * this.lastname = lastname;
	 * }
	 */
}
