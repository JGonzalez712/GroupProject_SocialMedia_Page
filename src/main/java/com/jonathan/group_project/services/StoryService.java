package com.jonathan.group_project.services;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.jonathan.group_project.models.Story;
import com.jonathan.group_project.models.User;
import com.jonathan.group_project.repositories.StoryRepository;
import com.jonathan.group_project.repositories.UserRepository;


@Service
public class StoryService {

    @Autowired
    StoryRepository storyRepository;
    
    @Autowired
    UserRepository uRepo;
    
  

    public List<Story> allStories() {
        Sort sort = Sort.by(Sort.Direction.DESC, "createdAt");
        return storyRepository.findAll(sort);
    }

    public Story oneStory(long id) {
        return storyRepository.findById(id);
    }

    public Story save(Story story) {
        return storyRepository.save(story);
    }

    public void deleteStory(long id) {
        storyRepository.deleteById(id);
    }
    
    
	public Story likedStory(Long userId, Long storyId) {
		Story thisStory = storyRepository.findById(storyId);
		User thisUser = uRepo.findById(userId).orElse(null);
		if (thisStory == null || thisUser == null) {
	        return null; // Or handle the error appropriately
	    }
		Set<User> likes = thisStory.getLikes();
		likes.add(thisUser); 
		thisStory.setLikes(likes);
		return storyRepository.save(thisStory);
	}
	
	public Story dislikedStory(Long userId, Long storyId) {
	    Story thisStory = storyRepository.findById(storyId);
	    User thisUser = uRepo.findById(userId).orElse(null);

	    // Handle null checks
	    if (thisStory == null || thisUser == null) {
	        // Handle the error appropriately, such as throwing an exception
	        throw new IllegalArgumentException("Story or user not found");
	    }

	    // Create a new set to remove the user from the likes
	    Set<User> likes = new HashSet<>(thisStory.getLikes());
	    likes.remove(thisUser);

	    // Update the story's likes and save it
	    thisStory.setLikes(likes);
	    return storyRepository.save(thisStory);
	}

}
