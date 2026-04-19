package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.project.models.Equipe;

@Repository
public interface EquipeRepository extends JpaRepository<Equipe, Long>{

}


