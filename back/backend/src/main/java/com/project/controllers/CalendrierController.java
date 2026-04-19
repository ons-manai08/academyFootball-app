package com.project.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.models.Calendrier;

import com.project.payload.response.MessageResponse;
import com.project.repository.CalendrierRepository;
import com.project.service.CalendrierService;



@CrossOrigin(origins = "*", maxAge = 3600)
@RestController

@RequestMapping("/calendrier")
public class CalendrierController {
	
	@Autowired
	CalendrierRepository calendrierRepo ; 
	
	@Autowired
	CalendrierService calendrierService ; 
	
	//créer des évenements 
	@PostMapping("/add")
	public ResponseEntity<?> addEvent(@RequestBody Calendrier calendrier) {
		calendrierService.add(calendrier);
		return ResponseEntity.ok(new MessageResponse("New Event created !")) ;
	}
	
	
	//récupérer tous les évenements
	
	@GetMapping("/all")
	public List<Calendrier> getAll(){
		 return calendrierRepo.findAll() ;
	} 
	//modifier les évenements
	
	@PostMapping("/update/{id}")
	public ResponseEntity<?> updateEvent(@PathVariable("id") Long id,@RequestBody Calendrier calendrier) {
		if(!calendrierService.findById(id)) {
			return ResponseEntity.ok(new MessageResponse(" Event does not exists !")) ;
		}
		calendrierService.editSpeciality(id, calendrier);
		return ResponseEntity.ok(new MessageResponse(" event updated seccuss !")) ;
	}
	
	//supprimer event 
	@DeleteMapping("/delete/{id}")
	public void delete(@PathVariable("id") Long id) {
		calendrierRepo.deleteById(id) ; 
	}
}
