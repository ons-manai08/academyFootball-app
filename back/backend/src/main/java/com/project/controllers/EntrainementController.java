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

import com.project.models.Entrainement;
import com.project.models.Equipe;
import com.project.payload.response.MessageResponse;
import com.project.repository.EntrainementRepository;
import com.project.service.EntrainementService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/entrainement")
public class EntrainementController {
	
	
	@Autowired
	EntrainementRepository entraiRepo ; 
	
	@Autowired
	EntrainementService entraService ; 
	
	
	@GetMapping("/all")
	public List<Entrainement> getAll(){
		 return entraiRepo.findAll() ;
	} 
	
	
	@PostMapping("/add")
	public ResponseEntity<?> addEntrainement(@RequestBody Entrainement entrainement) {
		entraService.add(entrainement);
		return ResponseEntity.ok(new MessageResponse("New Entrainement created !")) ;
	}
	
	
	@PutMapping("/update/")
	public ResponseEntity<?> updateEntrainement(@RequestBody Entrainement entrainement) {
		entraiRepo.save(entrainement);
		return ResponseEntity.ok(new MessageResponse(" entrainement updated seccuss !")) ;
	}
	
	/*@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id") Long id) {
		entraiRepo.deleteById(id) ; 
	}*/
	@GetMapping("/delete/{id}")
	public Entrainement DeleteEntrainById(@PathVariable("id") Long id) {
		return entraService.DeleteEntyrainById(id) ; 
	}

}
