package com.jonathan.group_project.services;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jonathan.group_project.models.Comment;
import com.jonathan.group_project.models.Story;
import com.jonathan.group_project.models.User;
import com.jonathan.group_project.repositories.CommentRepository;
import com.jonathan.group_project.repositories.UserRepository;

@Service
public class CommentService {
	
	@Autowired
	CommentRepository commentRepo;
	
	@Autowired
	UserRepository uRepo;
	
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
	
	public Comment likedComment(Long userId, Long commentId) {
		Comment thisComment = commentRepo.findById(commentId).orElse(null);
		User thisUser = uRepo.findById(userId).orElse(null);
		if (thisComment == null || thisUser == null) {
	        return null; 
	    }
		Set<User> likes = thisComment.getUsersWhoLikedMe();
		likes.add(thisUser); 
		thisComment.setUsersWhoLikedMe(likes);
		return commentRepo.save(thisComment);
	}
	
	public Comment dislikedComment(Long userId, Long commentId) {
		Comment thisComment = commentRepo.findById(commentId).orElse(null);
		User thisUser = uRepo.findById(userId).orElse(null);   
	    if (thisComment == null || thisUser == null) {
	        throw new IllegalArgumentException("Comment or user not found");
	    }
    
	    Set<User> likes = new HashSet<>(thisComment.getUsersWhoLikedMe());
	    likes.remove(thisUser);
	    thisComment.setUsersWhoLikedMe(likes);
	    return commentRepo.save(thisComment);
	}
}
