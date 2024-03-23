package com.jonathan.group_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.jonathan.group_project.services.UserService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	UserService uService;
	
	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		if( session.getAttribute("loggedInId") == null) {
			return "redirect:/";
			}
		Long userFromDb = (Long)session.getAttribute("loggedInId");
		model.addAttribute("user", uService.findOneUser(userFromDb));//This retrieve user information.
		return "Home.jsp";
	}
}
