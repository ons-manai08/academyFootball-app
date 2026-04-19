package com.project.models;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;

import lombok.NoArgsConstructor;

@Data //bech yebde feme getters w setters ma8er ma naamelhom ani 
@NoArgsConstructor //constructeur sans parametre 
@AllArgsConstructor //constructeur avec parametre 

@Entity
public class MatchSeance {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String dateMatch;
	
	private String heure;
	
	private String lieu;
	
	private String equipeHome;

	private String adversaire;
}
	

