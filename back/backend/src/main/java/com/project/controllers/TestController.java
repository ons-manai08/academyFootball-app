package com.project.controllers;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/api/test")
public class TestController {
	@GetMapping("/all")
	public String allAccess() {
		return "Public Content";
	}
	
	@GetMapping("/joueur")
	@PreAuthorize("hasRole('JOUEUR') or hasRole('PARENT') or hasRole('ADMIN') or hasRole('COACH')")
	public String joeurAccess() {
		return "joueur Content";
	}

	@GetMapping("/parent")
	@PreAuthorize("hasRole('PARENT')")
	public String parentAccess() {
		return "parent Board";
	}
	
	@GetMapping("/coach")
	@PreAuthorize("hasRole('COACH')")
	public String coachAccess() {
		return "coach Board";
	}

	@GetMapping("/admin")
	@PreAuthorize("hasRole('ADMIN')")
	public String adminAccess() {
		return "Admin Board ";
	}
}
