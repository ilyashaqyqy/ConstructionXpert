package model.dao;

import java.sql.Date;

import model.entities.Project;

public class Test {

    public static void main(String[] args) {
        ProjectDao projectDAO = new ProjectDao();


        Project project = new Project();
        project.setNom("New Project");
        project.setDescription("Description of the new project");
        project.setDateDebut(new java.sql.Date(new Date(0).getTime()));
        project.setDateFin(new java.sql.Date(System.currentTimeMillis() + 86400000L)); // 1 day later
        project.setBudget(10000.00);


        Project savedProject = projectDAO.save(project);


        if (savedProject != null) {
            System.out.println("Project saved successfully!");

        } else {
            System.out.println("Failed to save the project.");
        }
    }
}
