package com.jonathan.group_project.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jonathan.group_project.models.User;
import com.jonathan.group_project.services.UserService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import org.springframework.web.bind.annotation.PutMapping;

@Controller
@RequestMapping("/profile")
public class ProfileController {

    @Autowired
    UserService userService;

    @GetMapping("")
    public String getUserProfile(HttpSession session, Model model) {
        if (session.getAttribute("loggedInId") == null) {

            return "redirect:/";
        }
        long loggedUserId = (Long) session.getAttribute("loggedInId");

        User loggedUser = userService.findOneUser(loggedUserId);
        model.addAttribute("loggedUser", loggedUser);
        return "profile.jsp";

    }

    @PutMapping("/edit")
    public String editProfile(@Valid @ModelAttribute("loggedUser") User user, BindingResult result) {

        if (result.hasErrors()) {
            System.out.println(result.toString());

            return "redirect:/profile";
        }
        // for some reasons, i'm having abug when trying to save object. I will
        // investigate later
        /*
         * 
         * org.springframework.transaction.TransactionSystemException: Could not commit
         * JPA transaction] with root cause
         * 
         * jakarta.validation.ConstraintViolationException: Validation failed for
         * classes [com.jonathan.group_project.models.User] during update time for
         * groups [jakarta.validation.groups.Default, ]
         * List of constraint violations:[
         * ConstraintViolationImpl{interpolatedMessage='Confirm Password is required!',
         * propertyPath=confirm, rootBeanClass=class
         * com.jonathan.group_project.models.User, messageTemplate='Confirm Password is
         * required!'}
         */
        // userService.updateUser(user);
        return "redirect:/profile";
    }

}
