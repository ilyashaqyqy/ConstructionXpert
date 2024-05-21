package model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
  

import model.dao.SingletonConnection;
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
	            
	            ResultSet rs = ps.getGeneratedKeys();
	            if (rs.next()) {
	                p.setId_project(rs.getInt(1));
	            }
	            
	            rs.close();
	            ps.close();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return p;
	    }

	@Override
	public List<Project> getAllproject() {
	
		 Connection cn = SingletonConnection.getConnection();
	        List<Project> projectList = new ArrayList<>();
	        
	        try {
	            PreparedStatement ps = cn.prepareStatement("SELECT * FROM Project");
	            ResultSet rs = ps.executeQuery();
	            
	            while (rs.next()) {
	                Project project = new Project();
	                project.setId_project(rs.getInt("id_project")); 
	                project.setNom(rs.getString("nom"));
	                project.setDescription(rs.getString("description"));
	                project.setDateDebut(rs.getDate("dateDebut"));
	                project.setDateFin(rs.getDate("dateFin"));
	                project.setBudget(rs.getDouble("budget"));
	                
	                projectList.add(project);
	            }
	            
	            rs.close();
	            ps.close();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return projectList;
			
			

	}

	@Override
	public List<Project> projectParMc(String mc) {
        Connection cn = SingletonConnection.getConnection();
        List<Project> projectList = new ArrayList<>();
        
        try {
            PreparedStatement ps = cn.prepareStatement(
                "SELECT * FROM Project WHERE nom LIKE ? OR description LIKE ?"
            );
            String keyword = "%" + mc + "%";
            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Project project = new Project();
                project.setId_project(rs.getInt("id_project"));
                project.setNom(rs.getString("nom"));
                project.setDescription(rs.getString("description"));
                project.setDateDebut(rs.getDate("dateDebut"));
                project.setDateFin(rs.getDate("dateFin"));
                project.setBudget(rs.getDouble("budget"));
                
                projectList.add(project);
            }
            
            rs.close();
            ps.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return projectList;
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
