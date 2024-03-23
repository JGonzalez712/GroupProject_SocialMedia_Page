package com.jonathan.group_project.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jonathan.group_project.models.User;
import com.jonathan.group_project.repositories.UserRepository;



@Service
public class UserService {
	
	@Autowired
	private  UserRepository userRepo;
	
	//Find all users
	public List<User> allUsers(){
		return userRepo.findAll();
	}
	
	//Find by user by email
	public User findUserByEmail(String email) {
		return userRepo.findByEmail(email);
	}
	

	//Find One User
	
	public User findOneUser(Long id){
		return userRepo.findById(id).orElse(null);
	}
	
	//Create a User
	public User createUser(User user) {
		return userRepo.save(user);
	}
	
	//Update a User
	public User updateUser(User user) {
		return userRepo.save(user);
	}
	
	//Delete a User
	public void deleteUser(Long id) {
		 userRepo.deleteById(id);
	}
}
