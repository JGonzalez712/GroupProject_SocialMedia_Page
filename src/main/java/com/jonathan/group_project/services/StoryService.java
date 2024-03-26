package com.jonathan.group_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.jonathan.group_project.models.Story;
import com.jonathan.group_project.repositories.StoryRepository;

@Service
public class StoryService {

    @Autowired
    StoryRepository storyRepository;

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

    public List<Story> getStoriesByTag(String tag){
        return storyRepository.findByTag(tag);
    }

}
