package com.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.project.models.MatchSeance;

public interface MatchRepository  extends JpaRepository<MatchSeance, Long>{

}
