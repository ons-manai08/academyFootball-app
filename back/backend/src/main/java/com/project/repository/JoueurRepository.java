package com.project.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.models.Equipe;
import com.project.models.Joueur;

@Repository
public interface JoueurRepository extends JpaRepository<Joueur, Long>{
	
	 List<Joueur> findByEquipeId(Long equipeId);
	 Joueur findByEmail(String email);


}
