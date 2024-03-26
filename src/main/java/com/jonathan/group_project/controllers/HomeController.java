package com.jonathan.group_project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.jonathan.group_project.models.Comment;
import com.jonathan.group_project.models.Story;
import com.jonathan.group_project.services.CommentService;
import com.jonathan.group_project.services.StoryService;
import com.jonathan.group_project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class HomeController {

	@Autowired
	UserService uService;

	@Autowired
	CommentService cService;

	@Autowired
	StoryService storyService;

	@GetMapping("/home")
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("loggedInId") == null) {
			return "redirect:/";
		}
		Long userFromDb = (Long) session.getAttribute("loggedInId");
		model.addAttribute("loggedUser", uService.findOneUser(userFromDb));// This retrieve user information.
		model.addAttribute("comment", new Comment());
		model.addAttribute("story", new Story());
		model.addAttribute("stories", storyService.allStories());
		List<Comment> comments = cService.allComments();
		model.addAttribute("comments", comments);
		return "mainpage.jsp";
	}

	@PostMapping("/createComment")
	public String createComment(@Valid @ModelAttribute("comment") Comment comment, BindingResult result, Model model,
			HttpSession session) {
		if (session.getAttribute("loggedInId") == null) {
			return "redirect:/";
		}
		if (result.hasErrors()) {
			Long userFromDb = (Long) session.getAttribute("loggedInId");
			model.addAttribute("user", uService.findOneUser(userFromDb));
			session.getAttribute("loggedInId");
			System.out.println(result);
			return "mainpage.jsp";
		}
		cService.createComment(comment);
		return "redirect:/home";
	}

}
