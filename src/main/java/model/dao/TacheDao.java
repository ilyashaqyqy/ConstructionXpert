package model.dao;

import java.sql.Connection;
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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTache(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Tache getTacheById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
