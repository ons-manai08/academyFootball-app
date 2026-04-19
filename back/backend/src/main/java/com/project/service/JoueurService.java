package com.project.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dto.JoueurDto;
import com.project.models.Equipe;
import com.project.models.Joueur;
import com.project.repository.JoueurRepository;

@Service
public class JoueurService {
	
	

	@Autowired
	JoueurRepository joueurRepo ;
	
	
	public List<Joueur> getJoueurByEquipeId(Long equipeId) {
        return joueurRepo.findByEquipeId(equipeId);
    }
	

	public void createJoueur(JoueurDto joueurDto, Equipe equipe) {
		Joueur joueur = new Joueur();
		joueur.setName(joueurDto.getName());
		joueur.setEmail(joueurDto.getEmail());
		joueur.setPoste(joueurDto.getPoste());
		joueur.setAge(joueurDto.getAge());
		joueur.setPhone(joueurDto.getPhone());
		joueur.setEquipe(equipe);
		joueurRepo.save(joueur) ;
	}
	
	public Joueur addJoueur(Joueur joueur) {
		return joueurRepo.save(joueur) ;
	}
	
	// cette methode pour transferer de employe -> employeDtp
	public JoueurDto  getJOueurDto(Joueur joueur) {
		JoueurDto joueurDto = new JoueurDto();
		joueurDto.setName(joueur.getName());
		joueurDto.setEmail(joueur.getEmail());
		joueurDto.setPoste(joueur.getPoste());
		joueurDto.setPhone(joueur.getPhone());
		joueurDto.setEquipeId(joueur.getEquipe().getId());
		joueurDto.setId(joueur.getId());
		return joueurDto ;
	}

	public List<Joueur> getAlljoueur() {
		List <Joueur> allJoueur = joueurRepo.findAll() ;

		return allJoueur;
	}

	public void updateJoueur(JoueurDto joueurDto, Long id) throws Exception {
		Optional<Joueur> optionalJoueur = joueurRepo.findById(id);
		//throw an exception if product does not exists
		if (!optionalJoueur.isPresent()) {
			throw new Exception("joueur not present") ; 
		}
		Joueur joueur = optionalJoueur.get() ;
		joueur.setName(joueurDto.getName());
		joueur.setEmail(joueurDto.getEmail());
		joueur.setPoste(joueurDto.getPoste());
		joueur.setPhone(joueurDto.getPhone());
		joueurRepo.save(joueur) ;
	} 
	
	

}
