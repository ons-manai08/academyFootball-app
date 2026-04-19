package com.project.dto;

import javax.validation.constraints.NotNull;

public class JoueurDto {
	//for create if can be optional
		// for update we need the id

		private Long id ;

		@NotNull
		private String name ; 
		
		@NotNull
		private String email ; 
		
		@NotNull
		private String poste ;
		

		
		@NotNull
		private String phone  ;
		
		@NotNull
		private Long equipeId ;
		
		@NotNull
		private int age ;
		

		public JoueurDto(Long id, @NotNull String name, @NotNull String email, @NotNull String poste,
				@NotNull String phone, @NotNull Long equipeId, @NotNull int age) {
			super();
			this.id = id;
			this.name = name;
			this.email = email;
			this.poste = poste;
			this.phone = phone;
			this.equipeId = equipeId;
			this.age = age;
		}

		public int getAge() {
			return age;
		}

		public void setAge(int age) {
			this.age = age;
		}

		public JoueurDto() {
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

		public Long getEquipeId() {
			return equipeId;
		}

		public void setEquipeId(Long equipeId) {
			this.equipeId = equipeId;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		} 

}
