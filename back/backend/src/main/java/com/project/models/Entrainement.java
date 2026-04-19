package com.project.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import javax.validation.constraints.NotBlank;

@Entity
@Table(	name = "entrainement")
public class Entrainement {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id ; 
	
	@NotBlank
	private String date ; 
	@NotBlank
	private String equipe ;
	
	
	@NotBlank
	private String heure ; 
	@NotBlank
	private String lieu ; 
	
	
	
	@NotBlank
	private String type ;
	
	public Entrainement(Long id, @NotBlank String date,@NotBlank String equipe,@NotBlank String heure, @NotBlank String lieu, 
			 @NotBlank String type) {
		super();
		this.id = id;
		this.date = date;
		this.equipe = equipe;
		this.heure = heure;
		this.lieu = lieu;
	
		this.type = type;
	}
	
	

	public Entrainement() {
		super();
	}



	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getLieu() {
		return lieu;
	}

	public void setLieu(String lieu) {
		this.lieu = lieu;
	}

	public String getHeure() {
		return heure;
	}

	public void setHeure(String heure) {
		this.heure = heure;
	}

	public String getEquipe() {
		return equipe;
	}

	public void setEquipe(String equipe) {
		this.equipe = equipe;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	} 
	
	
	

}
