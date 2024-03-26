package com.jonathan.group_project.repositories;

import java.util.List;

import org.springframework.data.repository.ListPagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Sort;

import com.jonathan.group_project.models.Story;

@Repository
public interface StoryRepository extends ListPagingAndSortingRepository<Story, Long> {

    List<Story> findAll(Sort sort);

    Story findById(long id);

    Story save(Story s);

}
