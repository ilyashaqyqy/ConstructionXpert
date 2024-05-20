package model.entities;

public class Ressource {

    public int id_ressource;
    public String nom;
    public String type;
    public int quantite;
    public String infoFournisseur;
	
    
    
    public Ressource() {

	}



	public Ressource(int id_ressource, String nom, String type, int quantite, String infoFournisseur) {
		super();
		this.id_ressource = id_ressource;
		this.nom = nom;
		this.type = type;
		this.quantite = quantite;
		this.infoFournisseur = infoFournisseur;
	}



	public Ressource(String nom, String type, int quantite, String infoFournisseur) {
		super();
		this.nom = nom;
		this.type = type;
		this.quantite = quantite;
		this.infoFournisseur = infoFournisseur;
	}



	public int getId_ressource() {
		return id_ressource;
	}



	public void setId_ressource(int id_ressource) {
		this.id_ressource = id_ressource;
	}



	public String getNom() {
		return nom;
	}



	public void setNom(String nom) {
		this.nom = nom;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public int getQuantite() {
		return quantite;
	}



	public void setQuantite(int quantite) {
		this.quantite = quantite;
	}



	public String getInfoFournisseur() {
		return infoFournisseur;
	}



	public void setInfoFournisseur(String infoFournisseur) {
		this.infoFournisseur = infoFournisseur;
	}



	@Override
	public String toString() {
		return "Ressource [id_ressource=" + id_ressource + ", nom=" + nom + ", type=" + type + ", quantite=" + quantite
				+ ", infoFournisseur=" + infoFournisseur + "]";
	}
    
    
    
}
