package com.jonathan.group_project.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.ListPagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Sort;

import com.jonathan.group_project.models.Story;

@Repository
public interface StoryRepository extends ListPagingAndSortingRepository<Story, Long> {

    List<Story> findAll(Sort sort);

    Story findById(long id);

    @Query("select s from stories s join taggings tg on s.id=tg.story_id join tags t on tg.tag_id=t.id where t.name=?1")
    List<Story> findByTag(String tag);

    Story save(Story s);

}
