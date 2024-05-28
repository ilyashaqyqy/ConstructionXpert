package model.dao;

import java.util.List;

import model.entities.Project;
import model.entities.Ressource;

public interface IResourceDao {

	public Ressource save (Ressource r);
	public List <Ressource> getAllressource();
	public List <Ressource> RessourceParMc(String mc);
	public Ressource update (Ressource r);
	public void deleteRessource(int id);
	public Ressource getRessourceById(int id);
	public List <Ressource> getAllressourcetache();
	
	
}
