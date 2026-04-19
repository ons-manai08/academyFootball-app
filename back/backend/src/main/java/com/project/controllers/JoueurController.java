package com.project.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.dto.JoueurDto;
import com.project.models.Equipe;
import com.project.models.Joueur;
import com.project.payload.response.MessageResponse;
import com.project.repository.EquipeRepository;
import com.project.repository.JoueurRepository;
import com.project.service.JoueurService;

@CrossOrigin(origins = "*", maxAge = 3600)
@RestController
@RequestMapping("/admin/joueur")
public class JoueurController {

	@Autowired
	JoueurService joueurService ;
	
	@Autowired
	EquipeRepository equipeRepo ; 
	@Autowired
	JoueurRepository joueurRepo ; 
	
	
	@PostMapping("/add")
	public ResponseEntity<?> createJoueur(@RequestBody JoueurDto joueurDto){
		// tout d'abord tester si specialityId existe 
		 Optional<Equipe> optionalEquipe = equipeRepo.findById(joueurDto.getEquipeId());
		 if(!optionalEquipe.isPresent()) {
				return ResponseEntity.ok(new MessageResponse("equipe does not exists !"));
		 }
		joueurService.createJoueur(joueurDto, optionalEquipe.get()) ;
		return ResponseEntity.ok(new MessageResponse("joueur has been added !"));
	}
	
	@GetMapping("/all")
	public List<Joueur> getAllJoueur() {
		return joueurService.getAlljoueur() ;
	}
	
	@GetMapping("/byEquipe/{equipeId}")
    public List<Joueur> getEmployeByEquipeId(@PathVariable Long equipeId) {
        return joueurService.getJoueurByEquipeId(equipeId);
    }

	@PostMapping("/update/{id}")
	public ResponseEntity<?> updateJOueur(@PathVariable("id") Long id, @RequestBody JoueurDto joueurDto) throws Exception{
	 Optional<Equipe> optionalEquipe = equipeRepo.findById(joueurDto.getEquipeId());
	 if(!optionalEquipe.isPresent()) {
			return ResponseEntity.ok(new MessageResponse("Equipe does not exists !"));
	 }
	 joueurService.updateJoueur(joueurDto, id) ;
	return ResponseEntity.ok(new MessageResponse("Joueur has been updated !"));

	}
	@GetMapping("/delete/{id}")
	public ResponseEntity<?> delete(@PathVariable("id") Long id) {
		joueurRepo.deleteById(id) ; 
		return ResponseEntity.ok(new MessageResponse("Joueur has been deleted !"));
	}
}
