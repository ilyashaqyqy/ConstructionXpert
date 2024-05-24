package model.dao;



import java.util.List;
import model.entities.Ressource;

public class ResourceDaoTest {
    public static void main(String[] args) {
        IResourceDao resourceDao = new RessourceDao();

        // Test save method
        Ressource newRessource = new Ressource();
        newRessource.setNom("Test Resource");
        newRessource.setType("Type A");
        newRessource.setQuantite(100);
        newRessource.setInfoFournisseur("Supplier Info");
        Ressource savedRessource = resourceDao.save(newRessource);
        System.out.println("Saved Resource: " + savedRessource.getId_ressource());

        // Test getAllressource method
        List<Ressource> allResources = resourceDao.getAllressource();
        System.out.println("All Resources:");
        for (Ressource ressource : allResources) {
            System.out.println(ressource.getId_ressource() + " - " + ressource.getNom());
        }

        // Test RessourceParMc method
        List<Ressource> searchResults = resourceDao.RessourceParMc("Test");
        System.out.println("Search Results:");
        for (Ressource ressource : searchResults) {
            System.out.println(ressource.getId_ressource() + " - " + ressource.getNom());
        }

        // Test update method
        if (savedRessource != null) {
            savedRessource.setNom("Updated Resource Name");
            Ressource updatedRessource = resourceDao.update(savedRessource);
            System.out.println("Updated Resource: " + updatedRessource.getNom());
        }

        // Test getRessourceById method
        if (savedRessource != null) {
            Ressource retrievedRessource = resourceDao.getRessourceById(savedRessource.getId_ressource());
            System.out.println("Retrieved Resource: " + retrievedRessource.getNom());
        }

        // Test deleteRessource method
//        if (savedRessource != null) {
//            resourceDao.deleteRessource(savedRessource.getId_ressource());
//            System.out.println("Deleted Resource with ID: " + savedRessource.getId_ressource());
//        }
//
//        // Verify deletion
//        Ressource deletedRessource = resourceDao.getRessourceById(savedRessource.getId_ressource());
//        if (deletedRessource == null) {
//            System.out.println("Resource successfully deleted.");
//        } else {
//            System.out.println("Resource not deleted.");
//        }
    }
}
