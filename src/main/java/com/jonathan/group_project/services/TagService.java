package com.jonathan.group_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jonathan.group_project.models.Tag;
import com.jonathan.group_project.repositories.TagRepository;

@Service
public class TagService {

    @Autowired
    TagRepository tagRepository;

    public List<Tag> allTags() {
        return tagRepository.findAll();
    }

}
