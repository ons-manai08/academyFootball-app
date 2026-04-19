package com.project.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;


import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder 
@Entity
@Table(name= "equipe")//categories lekbira
public class Equipe {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Long id ; 
		
		@NotBlank
		private String name ; 
		
		@NotBlank
		private String description ; 
		@OneToMany(mappedBy = "equipe",fetch = FetchType.LAZY,orphanRemoval = true)
		@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
		private List<Joueur> joueurList = new ArrayList<Joueur>();
	
		

}
