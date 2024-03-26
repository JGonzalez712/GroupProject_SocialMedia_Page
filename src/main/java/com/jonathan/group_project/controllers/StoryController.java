package com.jonathan.group_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jonathan.group_project.models.Comment;
import com.jonathan.group_project.models.Story;
import com.jonathan.group_project.services.StoryService;
import com.jonathan.group_project.services.UserService;
import com.jonathan.group_project.services.CommentService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping("/story")
public class StoryController {

    @Autowired
    StoryService storyService;

    @Autowired
    UserService userService;

    @Autowired
    CommentService commentService;

    @PostMapping("/add")
    public String postAStory(@Valid @ModelAttribute("story") Story story, BindingResult result, Model model,
            HttpSession session) {

        if (session.getAttribute("loggedInId") == null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {

            long loggedUserId = (Long) session.getAttribute("loggedInId");
            model.addAttribute("loggedUser", userService.findOneUser(loggedUserId));
            model.addAttribute("story", new Story());
            model.addAttribute("stories", storyService.allStories());
            return "mainpage.jsp";
        }

        storyService.save(story);

        return "redirect:/home";
    }

    @GetMapping("/{storyId}")
    public String getStoryDetail(@PathVariable("storyId") long id, Model model, HttpSession session) {
        if (session.getAttribute("loggedInId") == null) {
            return "redirect:/";
        }

        long loggedUserId = (Long) session.getAttribute("loggedInId");
        model.addAttribute("loggedUser", userService.findOneUser(loggedUserId));
        model.addAttribute("comment", new Comment());
        model.addAttribute("story", storyService.oneStory(id));
        return "story-detail.jsp";
    }

    @PostMapping("/{storyId}/comment")
    public String addComment(@PathVariable("storyId") long id, @Valid @ModelAttribute("comment") Comment comment,
            BindingResult result, Model model, HttpSession session) {
        Story story = storyService.oneStory(id);

        if (session.getAttribute("loggedInId") == null) {
            return "redirect:/";
        }

        if (result.hasErrors()) {
            long loggedUserId = (Long) session.getAttribute("loggedInId");
            model.addAttribute("loggedUser", userService.findOneUser(loggedUserId));
            model.addAttribute("comment", new Comment());
            model.addAttribute("story", story);
            return "story-detail.jsp";
        }
        comment.setStory(story);
        commentService.createComment(comment);
        return "redirect:/story/" + id;
    }

}
