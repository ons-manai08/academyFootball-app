package com.project.controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.models.ERole;
import com.project.models.Role;
import com.project.models.User;
import com.project.repository.JoueurRepository;
import com.project.repository.UserRepository;


@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/user")
public class UserController {
	@Autowired
	UserRepository userRepository;
	@Autowired
	JoueurRepository joueurRepository;
	
	@GetMapping("/all")
	public List<User> getAllusers() {
		return userRepository.findAll() ;
	}
	@GetMapping("/allJoueurNotExist/")
	public List<User> getAllUserByRole() {
	    List<User> allJoueurNotExist = new ArrayList<>();
	    List<User> allJoueur = userRepository.findAll();
	    Role role = new Role();
	    role.setId(1);
	    role.setName(ERole.ROLE_JOUEUR);
	    Set<Role> roleSet = new HashSet<>(); // Initialize roleSet
	    roleSet.add(role);

	    allJoueur.forEach(j -> {
	        if (joueurRepository.findByEmail(j.getEmail()) == null&& j.getRoles().equals(roleSet)) {
	            allJoueurNotExist.add(j);
	        }
	    });

	    return allJoueurNotExist;
	}
	

}
