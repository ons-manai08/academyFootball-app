package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.Equipe;
import com.project.repository.EquipeRepository;
@Service
public class EquipeService {
	@Autowired
	EquipeRepository equipeRepo ; 
	
	public void createEquipe(Equipe equipe) {
		equipeRepo.save(equipe) ; 
	}
	
	public List<Equipe> allEquipe() {
		return equipeRepo.findAll();
	}
	
	
	public void editEquipe(Long id,Equipe updateEquipe) {
		Equipe equipe = equipeRepo.getOne(id) ;
		equipe.setName(updateEquipe.getName());
		equipeRepo.save(equipe) ;
	}

	public boolean findById(Long id) {
		// TODO Auto-generated method stub
		
				return equipeRepo.findById(id).isPresent();
	}
	public Equipe getEquipeById(Long id) {
		// TODO Auto-generated method stub
		
				return equipeRepo.findById(id).get();
	}

}
