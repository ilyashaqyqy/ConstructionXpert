package model.entities;

import java.sql.Date;

public class Project {

    public int id_project;
    public String nom;
    public String description;
    public Date dateDebut;
    public Date dateFin;
    public double budget;
	
    
    public Project() {
	
		
	}


	public Project(int id_project, String nom, String description, Date dateDebut, Date dateFin, double budget) {
		super();
		this.id_project = id_project;
		this.nom = nom;
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.budget = budget;
	}


	public Project(String nom, String description, Date dateDebut, Date dateFin, double budget) {
		super();
		this.nom = nom;
		this.description = description;
		this.dateDebut = dateDebut;
		this.dateFin = dateFin;
		this.budget = budget;
	}


	public int getId_project() {
		return id_project;
	}


	public void setId_project(int id_project) {
		this.id_project = id_project;
	}


	public String getNom() {
		return nom;
	}


	public void setNom(String nom) {
		this.nom = nom;
	}


	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public Date getDateDebut() {
		return dateDebut;
	}


	public void setDateDebut(Date dateDebut) {
		this.dateDebut = dateDebut;
	}


	public Date getDateFin() {
		return dateFin;
	}


	public void setDateFin(Date dateFin) {
		this.dateFin = dateFin;
	}


	public double getBudget() {
		return budget;
	}


	public void setBudget(double budget) {
		this.budget = budget;
	}


	@Override
	public String toString() {
		return "Project [id_project=" + id_project + ", nom=" + nom + ", description=" + description + ", dateDebut="
				+ dateDebut + ", dateFin=" + dateFin + ", budget=" + budget + "]";
	}
    
    
	
}
