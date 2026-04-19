package com.project.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder 
@Entity
@Table(	name = "joueur")
public class Joueur {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id ;
	
	@NotBlank
	private String name ; 
	
	@NotBlank
	private String email ; 
	
	@NotBlank
	private String poste ;
	
	
	
	@NotBlank
	private String phone  ;
	
	@NotNull
	private int age;

	// Many to one relationship
	@ManyToOne
	@JoinColumn(name = "equipe_id")
	Equipe equipe ;

	
	/*
	 	public Joueur() {
		super();
	} 
	  public Joueur(Long id, @NotBlank String name, @NotBlank String email, @NotBlank String poste,
			@NotBlank String phone, @NotNull int age, Equipe equipe) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.poste = poste;
		this.phone = phone;
		this.age = age;
		this.equipe = equipe;
	}

	


		public Long getId() {
			return id;
		}



		public void setId(Long id) {
			this.id = id;
		}



		public String getName() {
			return name;
		}



		public void setName(String name) {
			this.name = name;
		}



		public String getEmail() {
			return email;
		}



		public void setEmail(String email) {
			this.email = email;
		}



		public String getPoste() {
			return poste;
		}



		public void setPoste(String poste) {
			this.poste = poste;
		}



		public String getPhone() {
			return phone;
		}



		public void setPhone(String phone) {
			this.phone = phone;
		}



		public int getAge() {
			return age;
		}



		public void setAge(int age) {
			this.age = age;
		}



		public Equipe getEquipe() {
			return equipe;
		}



		public void setEquipe(Equipe equipe) {
			this.equipe = equipe;
		} 
	
	*/

	
}
