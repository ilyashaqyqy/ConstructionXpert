package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import model.entities.Project;

public class ProjectDao implements IProjectDao {

	
	
	
	@Override
	public Project save(Project p) {
	        Connection connection = SingletonConnection.getConnection();
	        
	        try {
	            PreparedStatement ps = connection.prepareStatement(
	                "INSERT INTO Project (nom, description, dateDebut, dateFin, budget) VALUES (?, ?, ?, ?, ?)"
	            );
	            ps.setString(1, p.getNom());
	            ps.setString(2, p.getDescription());
	            ps.setDate(3, new java.sql.Date(p.getDateDebut().getTime()));
	            ps.setDate(4, new java.sql.Date(p.getDateFin().getTime()));
	            ps.setDouble(5, p.getBudget());
	            ps.executeUpdate();
	            
	            ps.close(); 
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return p;
	    }

	@Override
	public List<Project> getAllproject() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Project> projectParMc(String mc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Project update(Project p) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteProject(int id) {
		// TODO Auto-generated method stub
		
	}

}
