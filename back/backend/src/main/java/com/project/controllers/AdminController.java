package com.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.models.Role;
import com.project.models.User;
import com.project.repository.RoleRepository;
import com.project.repository.UserRepository;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/users")
public class AdminController {
	
	@Autowired
	UserRepository userRepository;
	@Autowired
	RoleRepository roleRepository ;
	
	@GetMapping("/all")
	public List<Role> getAllRoles(){
		return roleRepository.findAll();
	} 
	
	@GetMapping("/allusers")
	public List<User> getAllUsers(){
		 return userRepository.findAll();
	} 
	
	@DeleteMapping("/deluser/{id}")
	public void deleteUser(@PathVariable("id") long id){
		 userRepository.deleteById(id);
	} 
	
	@GetMapping("/user/{id}")
	public User getUserById(@PathVariable("id") long id){
		 return userRepository.findById(id).get();
	}
	
	

}
