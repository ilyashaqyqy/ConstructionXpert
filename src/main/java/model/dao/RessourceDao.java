package model.dao;



import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entities.Ressource;

public class RessourceDao implements IResourceDao {
    @Override
    public Ressource save(Ressource r) {
        Connection connection = SingletonConnection.getConnection();
        
        try {
            PreparedStatement ps = connection.prepareStatement(
                "INSERT INTO Ressource (nom, type, quantite, infoFournisseur) VALUES (?, ?, ?, ?)",
                PreparedStatement.RETURN_GENERATED_KEYS
            );
            ps.setString(1, r.getNom());
            ps.setString(2, r.getType());
            ps.setInt(3, r.getQuantite());
            ps.setString(4, r.getInfoFournisseur());
            ps.executeUpdate();
            
            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                r.setId_ressource(rs.getInt(1));
            }
            
            rs.close();
            ps.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return r;
    }

    @Override
    public List<Ressource> getAllressource() {
        Connection cn = SingletonConnection.getConnection();
        List<Ressource> ressourceList = new ArrayList<>();
        
        try {
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM Ressource");
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Ressource ressource = new Ressource();
                ressource.setId_ressource(rs.getInt("id_ressource")); 
                ressource.setNom(rs.getString("nom"));
                ressource.setType(rs.getString("type"));
                ressource.setQuantite(rs.getInt("quantite"));
                ressource.setInfoFournisseur(rs.getString("infoFournisseur"));
                
                ressourceList.add(ressource);
            }
            
            rs.close();
            ps.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return ressourceList;
    }

    
	@Override
	public List<Ressource> getAllressourcetache() {
	       Connection cn = SingletonConnection.getConnection();
	       List<Ressource> ressourceList = new ArrayList<>();
	       try {
	            PreparedStatement ps = cn.prepareStatement("SELECT * FROM Ressource");
	            ResultSet rs = ps.executeQuery();
	            
	            while (rs.next()) {
	                Ressource ressource = new Ressource();
	                ressource.setId_ressource(rs.getInt("id_ressource")); 
	                ressource.setNom(rs.getString("nom"));
	                ressource.setType(rs.getString("type"));
	                ressource.setQuantite(rs.getInt("quantite"));
	                ressource.setInfoFournisseur(rs.getString("infoFournisseur"));
	                
	                ressourceList.add(ressource);
	            }
	            
	            rs.close();
	            ps.close();
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        
	        return ressourceList;
	}
    
    @Override
    public List<Ressource> RessourceParMc(String mc) {
        Connection cn = SingletonConnection.getConnection();
        List<Ressource> ressourceList = new ArrayList<>();
        
        try {
            PreparedStatement ps = cn.prepareStatement(
                "SELECT * FROM Ressource WHERE LOWER(nom) LIKE LOWER(?) OR LOWER(type) LIKE LOWER(?) OR LOWER(infoFournisseur) LIKE LOWER(?)"
            );
            String keyword = "%" + mc + "%";
            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ps.setString(3, keyword);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Ressource ressource = new Ressource();
                ressource.setId_ressource(rs.getInt("id_ressource"));
                ressource.setNom(rs.getString("nom"));
                ressource.setType(rs.getString("type"));
                ressource.setQuantite(rs.getInt("quantite"));
                ressource.setInfoFournisseur(rs.getString("infoFournisseur"));
                
                ressourceList.add(ressource);
            }
            
            rs.close();
            ps.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return ressourceList;
    }

    @Override
    public Ressource update(Ressource r) {
        Connection cn = SingletonConnection.getConnection();
        
        try {
            PreparedStatement ps = cn.prepareStatement(
                "UPDATE Ressource SET nom = ?, type = ?, quantite = ?, infoFournisseur = ? WHERE id_ressource = ?"
            );
            ps.setString(1, r.getNom());
            ps.setString(2, r.getType());
            ps.setInt(3, r.getQuantite());
            ps.setString(4, r.getInfoFournisseur());
            ps.setInt(5, r.getId_ressource());
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Ressource with ID " + r.getId_ressource() + " was updated successfully.");
            } else {
                System.out.println("No ressource found with ID " + r.getId_ressource());
            }
            
            ps.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return r;
    }

    @Override
    public void deleteRessource(int id) {
        Connection cn = SingletonConnection.getConnection();
        
        try {
            PreparedStatement ps = cn.prepareStatement(
                "DELETE FROM Ressource WHERE id_ressource = ?"
            );
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                System.out.println("Ressource with ID " + id + " was deleted successfully.");
            } else {
                System.out.println("No ressource found with ID " + id);
            }
            
            ps.close();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Ressource getRessourceById(int id) {
        Connection cn = SingletonConnection.getConnection();
        Ressource ressource = null;

        try {
            PreparedStatement ps = cn.prepareStatement("SELECT * FROM Ressource WHERE id_ressource = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                ressource = new Ressource();
                ressource.setId_ressource(rs.getInt("id_ressource"));
                ressource.setNom(rs.getString("nom"));
                ressource.setType(rs.getString("type"));
                ressource.setQuantite(rs.getInt("quantite"));
                ressource.setInfoFournisseur(rs.getString("infoFournisseur"));
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return ressource;
    }


}

