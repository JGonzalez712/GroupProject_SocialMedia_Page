package com.jonathan.group_project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jonathan.group_project.models.Tag;

@Repository
public interface TagRepository extends CrudRepository<Tag, Long> {

    List<Tag> findAll();

}
