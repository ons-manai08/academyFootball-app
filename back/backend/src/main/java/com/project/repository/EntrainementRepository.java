package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.models.Entrainement;


public interface EntrainementRepository extends JpaRepository<Entrainement, Long> {

}
