package com.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import com.project.models.MatchSeance;
import com.project.payload.response.MessageResponse;
import com.project.repository.MatchRepository;
import com.project.service.MatchService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/match")
public class MatchController {

	@Autowired
	MatchRepository matchRepo ; 
	
	@Autowired
	MatchService matchService ; 
	
	
	@GetMapping("/all")
	public List<MatchSeance> getAll(){
		 return matchRepo.findAll() ;
	} 
	
	
	@PostMapping("/add")
	public ResponseEntity<?> addMatch(@RequestBody MatchSeance match) {
		matchService.add(match);
		return ResponseEntity.ok(new MessageResponse("New match created !")) ;
	}
	
	
	@PutMapping("/update/{id}")
	public ResponseEntity<?> updateMatch(@PathVariable("id") Long id,@RequestBody MatchSeance match) {
		if(!matchService.findById(id)) {
			return ResponseEntity.ok(new MessageResponse(" Match does not exists !")) ;
		}
		matchService.editSpeciality(id, match);
		return ResponseEntity.ok(new MessageResponse("Match updated seccuss !")) ;
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id") Long id) {
		matchRepo.deleteById(id) ; 
	}

}
