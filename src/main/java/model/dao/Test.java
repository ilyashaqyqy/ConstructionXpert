package model.dao;

import java.sql.Date;
import java.util.List;

import model.entities.Project;

public class Test {

    public static void main(String[] args) {
        ProjectDao projectDAO = new ProjectDao();


//        Project project = new Project();
//        project.setNom("New Project");
//        project.setDescription("Description of the new project");
//        project.setDateDebut(new java.sql.Date(new Date(0).getTime()));
//        project.setDateFin(new java.sql.Date(System.currentTimeMillis() + 86400000L)); // 1 day later
//        project.setBudget(10000.00);
//
//
//        Project savedProject = projectDAO.save(project);
//
//
//        if (savedProject != null) {
//            System.out.println("Project saved successfully!");
//
//        } else {
//            System.out.println("Failed to save the project.");
//        }
   
    
//        ProjectDao projectDao = new ProjectDao();
//        List<Project> projects = projectDao.getAllproject();
//        
//        if (projects.isEmpty()) {
//            System.out.println("No projects found.");
//        } else {
//            System.out.println("List of Projects:");
//            for (Project project : projects) {
//                System.out.println("ID: " + project.getId_project());
//                System.out.println("Name: " + project.getNom());
//                System.out.println("Description: " + project.getDescription());
//                System.out.println("Start Date: " + project.getDateDebut());
//                System.out.println("End Date: " + project.getDateFin());
//                System.out.println("Budget: " + project.getBudget());
//                System.out.println("---------------------------");
//            }
//        }
    
        
//        String mc = "New"; // Define the search term here
//
//        ProjectDao projectDao = new ProjectDao();
//        List<Project> projects = projectDao.projectParMc(mc);
//
//        if (projects.isEmpty()) {
//            System.out.println("No projects found for keyword: " + mc);
//        } else {
//            System.out.println("List of Projects matching keyword '" + mc + "':");
//            for (Project project : projects) {
//                System.out.println("ID: " + project.getId_project());
//                System.out.println("Name: " + project.getNom());
//                System.out.println("Description: " + project.getDescription());
//                System.out.println("Start Date: " + project.getDateDebut());
//                System.out.println("End Date: " + project.getDateFin());
//                System.out.println("Budget: " + project.getBudget());
//                System.out.println("---------------------------");
//            }
//        }
        
        
        testDeleteProject(1); // Change the ID as needed for your tests
    }

    public static void testDeleteProject(int id) {
        ProjectDao projectDao = new ProjectDao();
        projectDao.deleteProject(id);
   
    
    }
        
    
    
    
    
    
    }

