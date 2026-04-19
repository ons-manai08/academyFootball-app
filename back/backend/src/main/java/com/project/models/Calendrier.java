package com.project.models;

import javax.persistence.*;



//hedhy calendrier emploi de temps  eli bech todhhor f dashbord ta3 parent w admin houwa eli bech yaamelha



@Entity 
@Table(	name = "calendrier")

public class Calendrier {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String theme;
	private String date;
	private String lieu;
	private String heure;
	
	
	public Calendrier() {
		super();
	}
	public Calendrier(long id, String theme, String date, String lieu, String heure) {
		super();
		this.id = id;
		this.theme = theme;
		this.date = date;
		this.lieu = lieu;
		this.heure = heure;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
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
	
	

}
