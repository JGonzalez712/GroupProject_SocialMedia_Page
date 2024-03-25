package com.jonathan.group_project.repositories;




import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jonathan.group_project.models.Comment;

@Repository
public interface CommentRepository extends CrudRepository<Comment, Long>{
	
	List<Comment> findAll();
}
