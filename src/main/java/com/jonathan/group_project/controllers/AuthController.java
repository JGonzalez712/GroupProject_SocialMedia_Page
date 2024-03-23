package com.jonathan.group_project.controllers;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jonathan.group_project.models.LoginUser;
import com.jonathan.group_project.models.User;
import com.jonathan.group_project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class AuthController {
	
	@Autowired
	private UserService uService;
	
	//This controller handles login/registration page.
	@GetMapping("/")
	public String auth(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "LoginPage.jsp";
	}
	
	
	//Post route for register
	@PostMapping("/registration")
	public String register(@Valid @ModelAttribute("user") User user, 
			BindingResult result, Model model, HttpSession session) {
		
		model.addAttribute("loginUser", new LoginUser());
		User userFromDb = uService.findUserByEmail(user.getEmail());
		if (userFromDb != null) {
			result.rejectValue("email", "unique", "Email already in database");
			return"LoginPage.jsp";
		}
		if(!user.getPassword().equals(user.getConfirm())) {
			result.rejectValue("password", "password_unmatch", "password do not match");			
			return"LoginPage.jsp";
		}
		if (result.hasErrors()) {
			return"LoginPage.jsp";
		}
		String encryptedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
		user.setPassword(encryptedPassword);
		uService.createUser(user);
		session.setAttribute("loggedInId", user.getId());
		return "redirect:/home";
	}
	
	//post for login in
	@PostMapping("/logIn")
	public String logIn(@Valid @ModelAttribute("loginUser") LoginUser loginUser, 
			BindingResult result, Model model, HttpSession session) {
		model.addAttribute("user", new User());
		User userFromDb = uService.findUserByEmail(loginUser.getEmail());
		if (userFromDb == null) {
			result.rejectValue("email", "unique", "Invalid email or password");
			return"LoginPage.jsp";
		}
		
		if (!BCrypt.checkpw(loginUser.getPassword(), userFromDb.getPassword())) {
			result.rejectValue("email", "unique", " password");
			return"LoginPage.jsp";
		}
		if (result.hasErrors()) {
			return"LoginPage.jsp";
		}
		session.setAttribute("loggedInId", userFromDb.getId());
		return "redirect:/home";
	}
	
	//This is is our log out route
	@GetMapping("/logOut")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}