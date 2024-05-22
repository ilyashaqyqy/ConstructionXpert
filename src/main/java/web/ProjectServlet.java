//package web;
//
//import model.dao.ProjectDao;
//import model.entities.Project;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.util.List;
//
//@WebServlet("/")
//public class ProjectServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//    private ProjectDao projectDao;
//
//    @Override
//    public void init() {
//        projectDao = new ProjectDao();
//    }
//
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        List<Project> projects = projectDao.getAllproject();
//        request.setAttribute("projects", projects);
//        request.getRequestDispatcher("displayProjects.jsp").forward(request, response);
//    }
//}



package web;

import model.dao.ProjectDao;
import model.entities.Project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/")
public class ProjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProjectDao projectDao;

    @Override
    public void init() {
        projectDao = new ProjectDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("delete")) {
            // Handle delete action
            int id = Integer.parseInt(request.getParameter("id"));
            projectDao.deleteProject(id);
            response.sendRedirect(request.getContextPath() + "/");
        } else if (action != null && action.equals("add")) {
            // Forward to add project page
            request.getRequestDispatcher("addProject.jsp").forward(request, response);
        } else {
            // Handle display and search actions
            String mc = request.getParameter("mc");
            List<Project> projects;

            if (mc != null && !mc.isEmpty()) {
                projects = projectDao.projectParMc(mc);
            } else {
                projects = projectDao.getAllproject();
            }

            request.setAttribute("projects", projects);
            request.getRequestDispatcher("displayProjects.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handling form submission for adding a project
        String nom = request.getParameter("nom");
        String description = request.getParameter("description");
        String dateDebutStr = request.getParameter("dateDebut");
        String dateFinStr = request.getParameter("dateFin");
        String budgetStr = request.getParameter("budget");

        // Convert date strings to Date objects
        // (You can add validation and error handling here)
        java.sql.Date dateDebut = java.sql.Date.valueOf(dateDebutStr);
        java.sql.Date dateFin = java.sql.Date.valueOf(dateFinStr);

        // Convert budget string to double
        double budget = Double.parseDouble(budgetStr);

        // Create the Project object
        Project project = new Project(nom, description, dateDebut, dateFin, budget);

        // Save the project using the DAO
        projectDao.save(project);

   
        // Redirect back to the main project list page
        response.sendRedirect(request.getContextPath() + "/");
    }
}
