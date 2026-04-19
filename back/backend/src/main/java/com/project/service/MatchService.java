package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.MatchSeance;
import com.project.repository.MatchRepository;

@Service
public class MatchService {
	
	@Autowired
	MatchRepository matchRepo ; 
	
	public void add(MatchSeance match) {
		matchRepo.save(match) ; 
	}
	
	public List <MatchSeance> allMatch() {
		return matchRepo.findAll();
	}
	
	
	public void editSpeciality(Long id,MatchSeance updateMatch) {
		MatchSeance match = matchRepo.getOne(id) ;
		match.setDateMatch(updateMatch.getDateMatch());
		match.setAdversaire(updateMatch.getAdversaire());
		match.setEquipeHome(updateMatch.getEquipeHome());
		match.setHeure(updateMatch.getHeure());
		match.setHeure(updateMatch.getHeure());



		
		matchRepo.save(match) ;
	}

	public boolean findById(Long id) {
		// TODO Auto-generated method stub
		return matchRepo.findById(id).isPresent();
	}

}


