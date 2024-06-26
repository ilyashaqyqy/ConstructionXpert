package model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entities.Tache;

public class TacheDao implements ITacheDao {

	@Override
	 public Tache save(Tache tache) {
        Connection connection = SingletonConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(
                    "INSERT INTO Tache (id_projet, id_ressource, nom, description, dateDebut, dateFin, status) VALUES (?, ?, ?, ?, ?, ?, ?)",
                    PreparedStatement.RETURN_GENERATED_KEYS
            );
            ps.setInt(1, tache.getId_projet());
            ps.setInt(2, tache.getId_ressource());
            ps.setString(3, tache.getNom());
            ps.setString(4, tache.getDescription());
            ps.setDate(5, tache.getDateDebut());
            ps.setDate(6, tache.getDateFin());
            ps.setString(7, tache.getStatus());

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    tache.setId_tache(generatedKeys.getInt(1));
                }
            }

            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return tache;

	}

	@Override
	public List<Tache> getAllTasks() {
        Connection connection = SingletonConnection.getConnection();
        List<Tache> tasks = new ArrayList<>();

        try {
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM Tache");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Tache task = new Tache();
                task.setId_tache(rs.getInt("id_tache"));
                task.setId_projet(rs.getInt("id_projet"));
                task.setId_ressource(rs.getInt("id_ressource"));
                task.setNom(rs.getString("nom"));
                task.setDescription(rs.getString("description"));
                task.setDateDebut(rs.getDate("dateDebut"));
                task.setDateFin(rs.getDate("dateFin"));
                task.setStatus(rs.getString("status"));

                tasks.add(task);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tasks;
    }


	@Override
	public List<Tache> tachesParMc(String mc) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
    public void update(Tache tache) {
        Connection connection = SingletonConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement(
                    "UPDATE Tache SET id_projet = ?, id_ressource = ?, nom = ?, description = ?, dateDebut = ?, dateFin = ?, status = ? WHERE id_tache = ?"
            );
            ps.setInt(1, tache.getId_projet());
            ps.setInt(2, tache.getId_ressource());
            ps.setString(3, tache.getNom());
            ps.setString(4, tache.getDescription());
            ps.setDate(5, tache.getDateDebut());
            ps.setDate(6, tache.getDateFin());
            ps.setString(7, tache.getStatus());
            ps.setInt(8, tache.getId_tache());

            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	@Override
	public void delete(int id_tache) {
        Connection connection = SingletonConnection.getConnection();

        try {
            PreparedStatement ps = connection.prepareStatement("DELETE FROM Tache WHERE id_tache = ?");
            ps.setInt(1, id_tache);
            ps.executeUpdate();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
	
	public void updateTaskStatus(int taskId, String status) {
	    Connection connection = SingletonConnection.getConnection();
	    try {
	        PreparedStatement ps = connection.prepareStatement("UPDATE Tache SET status = ? WHERE id_tache = ?");
	        ps.setString(1, status);
	        ps.setInt(2, taskId);
	        ps.executeUpdate();
	        ps.close();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
	public List<Tache> getTasksByProjectId(int projectId) {
	    List<Tache> tasks = new ArrayList<>();
	    String query = "SELECT * FROM tache WHERE id_projet = ?";
	    Connection connection = SingletonConnection.getConnection();

	    try (PreparedStatement statement = connection.prepareStatement(query)) {
	        statement.setInt(1, projectId);
	        try (ResultSet resultSet = statement.executeQuery()) {
	            while (resultSet.next()) {
	                int id = resultSet.getInt("id_tache");
	                int idProjet = resultSet.getInt("id_projet");
	                int idRessource = resultSet.getInt("id_ressource");
	                String nom = resultSet.getString("nom");
	                String description = resultSet.getString("description");
	                Date dateDebut = resultSet.getDate("dateDebut");
	                Date dateFin = resultSet.getDate("dateFin");
	                String status = resultSet.getString("status");
	                
	                // Create a Tache object and add it to the list
	                Tache task = new Tache(id, idProjet, idRessource, nom, description, dateDebut, dateFin, status);
	                tasks.add(task);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return tasks;
	}

	@Override
	public Tache getTacheById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
