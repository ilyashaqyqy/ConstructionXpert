package model.dao;

import model.entities.Tache;

import java.util.List;

public class TacheDaoTest {

    public static void main(String[] args) {
        TacheDao tacheDao = new TacheDao();

        // Test save method
        Tache tache1 = new Tache(7, 2, "Tache 1", "Description Tache 1", java.sql.Date.valueOf("2024-05-25"), java.sql.Date.valueOf("2024-05-30"), "En cours");
        Tache savedTache1 = tacheDao.save(tache1);
        System.out.println("Saved Tache: " + savedTache1);

        // Test getAllTasks method
        List<Tache> allTasks = tacheDao.getAllTasks();
        System.out.println("All Tasks: " + allTasks);

        // Test update method
        savedTache1.setStatus("Terminée");
        tacheDao.update(savedTache1);
        System.out.println("Updated Tache: " + savedTache1);

        // Test delete method
//        tacheDao.delete(savedTache1.getId_tache());
//        System.out.println("Deleted Tache with ID " + savedTache1.getId_tache());
    }
}
