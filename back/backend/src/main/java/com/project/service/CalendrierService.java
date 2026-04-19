package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.models.Calendrier;
import com.project.repository.CalendrierRepository;


@Service
public class CalendrierService {
	@Autowired
	CalendrierRepository calendrierRepo ; 
	
	public void add(Calendrier calendrier) {
		calendrierRepo.save(calendrier) ; 
	}
	
	public List <Calendrier> allEvent() {
		return calendrierRepo.findAll();
	}
	
	
	public void editSpeciality(Long id,Calendrier updateEvent) {
		Calendrier calendrier = calendrierRepo.getOne(id) ;
		calendrier.setDate(updateEvent.getDate());
		calendrier.setHeure(updateEvent.getHeure());
		calendrier.setLieu(updateEvent.getLieu());
		calendrier.setTheme(updateEvent.getTheme());
		calendrierRepo.save(calendrier) ;
	}

	public boolean findById(Long id) {
		// TODO Auto-generated method stub
		return calendrierRepo.findById(id).isPresent();
	}

}



