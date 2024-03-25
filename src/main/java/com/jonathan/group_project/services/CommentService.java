package com.jonathan.group_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jonathan.group_project.models.Comment;
import com.jonathan.group_project.repositories.CommentRepository;

@Service
public class CommentService {
	
	@Autowired
	CommentRepository commentRepo;
	
	// Find all Comments
		public List<Comment> allComments() {
			return commentRepo.findAll();
		}
	
		
	// Find One Comment
	public Comment findOneComment(Long id) {
		return commentRepo.findById(id).orElse(null);
	}
	
	// Create a comment
		public Comment createComment(Comment comment) {
			return commentRepo.save(comment);
		}
		
	// Update a comment
	public Comment updateComment(Comment comment) {
		return commentRepo.save(comment);
	}
	
	// Delete a Game
	public void deleteComment(Long id) {
		commentRepo.deleteById(id);
	}
}
