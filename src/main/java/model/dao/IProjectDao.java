package model.dao;

import java.util.List;


import model.entities.Project;

public interface IProjectDao {

	public Project save(Project p);
	public List <Project> getAllproject();
	public List <Project> projectParMc(String mc);
	public Project update (Project p);
	public void deleteProject(int id);
	
}
