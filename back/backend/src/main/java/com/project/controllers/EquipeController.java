package com.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.models.Equipe;
import com.project.payload.response.MessageResponse;
import com.project.repository.EquipeRepository;
import com.project.service.EquipeService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/equipe")
public class EquipeController {
	@Autowired
	EquipeService equipeService ; 
	
	@Autowired
	EquipeRepository equipeRepo ; 
	
	
	@PostMapping("/create")
	public ResponseEntity<?> createCategory(@RequestBody Equipe equipe) {
		equipeService.createEquipe(equipe);
		return ResponseEntity.ok(new MessageResponse("New equipe created !")) ;
	}
	
	@GetMapping("/all")
	public List <Equipe>allCategory() {
		return equipeService.allEquipe();
		
	}
	
	@PostMapping("/update/{id}")
	public ResponseEntity<?> updateEquipe(@PathVariable("id") Long id,@RequestBody Equipe equipe) {
		if(!equipeService.findById(id)) {
			return ResponseEntity.ok(new MessageResponse(" equipe does not exists !")) ;
		}
		equipeService.editEquipe(id, equipe);
		return ResponseEntity.ok(new MessageResponse(" equipe updated seccuss !")) ;
	}
	
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id") Long id) {
		equipeRepo.deleteById(id) ; 
	}
	@GetMapping("/{id}")
	public Equipe getEquipeById(@PathVariable("id") Long id) {
		return equipeService.getEquipeById(id) ; 
	}

}
