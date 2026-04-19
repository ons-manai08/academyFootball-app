package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.Entrainement;
import com.project.models.Equipe;
import com.project.repository.EntrainementRepository;

@Service
public class EntrainementService {
	
	@Autowired
	EntrainementRepository entraiRepo ; 
	
	public void add(Entrainement entrainement) {
		entraiRepo.save(entrainement) ; 
	}
	
	public List <Entrainement> allEntrainement() {
		return entraiRepo.findAll();
	}
	
	
	public void editEntrainement(Long id,Entrainement updateEntrainement) {
		Entrainement entrainement = entraiRepo.getOne(id) ;
		entrainement.setDate(updateEntrainement.getDate());
		entrainement.setEquipe(updateEntrainement.getEquipe());
		entrainement.setHeure(updateEntrainement.getHeure());
		entrainement.setLieu(updateEntrainement.getLieu());
		entrainement.setType(updateEntrainement.getType());

		entraiRepo.save(entrainement) ;
	}

	public boolean findById(Long id) {
		// TODO Auto-generated method stub
		return entraiRepo.findById(id).isPresent();
	}
	public Entrainement DeleteEntyrainById(Long id) {
		// TODO Auto-generated method stub
		
				return entraiRepo.findById(id).get();
	}

}
