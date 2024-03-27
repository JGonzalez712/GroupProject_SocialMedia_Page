package com.jonathan.group_project.controllers;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.jonathan.group_project.services.CommentService;
import com.jonathan.group_project.services.StoryService;
import com.jonathan.group_project.services.UserService;

@Controller
public class LikesController {
	  @Autowired
	    StoryService storyService;

	    @Autowired
	    UserService userService;

	    @Autowired
	    CommentService commentService;


	    @PostMapping("/story/likes/{userId}/{storyId}")
	    public String likedStory(
	            @PathVariable("userId") Long userId,
	            @PathVariable("storyId") Long storyId) {
	        storyService.likedStory(userId, storyId); 
	        return "redirect:/home";
	    }
	    
	    @PostMapping("/story/dislikes/{userId}/{storyId}")
	    public String dislikedStory(
	            @PathVariable("userId") Long userId,
	            @PathVariable("storyId") Long storyId) {
	        storyService.dislikedStory(userId, storyId); 
	        return "redirect:/home"; // 
	    }
	    
	    @PostMapping("/comment/likes/{userId}/{commentId}")
	    public String likedComment(
	            @PathVariable("userId") Long userId,
	            @PathVariable("commentId") Long commentId) {
	        commentService.likedComment(userId, commentId);      
	        return "redirect:/home"; 
	    }
	    
	    @PostMapping("/comment/dislikes/{userId}/{commentId}")
	    public String dislikedComment(
	            @PathVariable("userId") Long userId,
	            @PathVariable("commentId") Long commentId) {
	        commentService.dislikedComment(userId, commentId); 
	        return "redirect:/home";
	    }
}
