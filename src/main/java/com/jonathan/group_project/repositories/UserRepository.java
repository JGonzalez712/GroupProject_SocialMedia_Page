package com.jonathan.group_project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.jonathan.group_project.models.User;



@Repository
public interface UserRepository extends CrudRepository<User, Long> {

	List<User> findAll();

	public User findByEmail(String email);

}