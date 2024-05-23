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

        if (action != null) {
            if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                projectDao.deleteProject(id);
                response.sendRedirect(request.getContextPath() + "/");
            } else if (action.equals("add")) {
                request.getRequestDispatcher("addProject.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Project project = projectDao.getProjectById(id);
                request.setAttribute("project", project);
                request.getRequestDispatcher("updateProject.jsp").forward(request, response);
            } else if (action.equals("details")) { // Add this condition for showing project details
                int id = Integer.parseInt(request.getParameter("id"));
                Project project = projectDao.getProjectById(id);
                request.setAttribute("project", project);
                request.getRequestDispatcher("projectDetails.jsp").forward(request, response);
                return; // Stop further processing
            }
        } else {
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
        String action = request.getParameter("action");

        if (action != null && action.equals("update")) {
        
        	
            int id = Integer.parseInt(request.getParameter("id_project"));
            String nom = request.getParameter("nom");
            String description = request.getParameter("description");
            String dateDebutStr = request.getParameter("dateDebut");
            String dateFinStr = request.getParameter("dateFin");
            String budgetStr = request.getParameter("budget");

            java.sql.Date dateDebut = java.sql.Date.valueOf(dateDebutStr);
            java.sql.Date dateFin = java.sql.Date.valueOf(dateFinStr);
            double budget = Double.parseDouble(budgetStr);

            Project project = new Project(id, nom, description, dateDebut, dateFin, budget);
            projectDao.update(project);

            response.sendRedirect(request.getContextPath() + "/");
        } else {
           
        	
            String nom = request.getParameter("nom");
            String description = request.getParameter("description");
            String dateDebutStr = request.getParameter("dateDebut");
            String dateFinStr = request.getParameter("dateFin");
            String budgetStr = request.getParameter("budget");

            java.sql.Date dateDebut = java.sql.Date.valueOf(dateDebutStr);
            java.sql.Date dateFin = java.sql.Date.valueOf(dateFinStr);
            double budget = Double.parseDouble(budgetStr);

            Project project = new Project(nom, description, dateDebut, dateFin, budget);
            projectDao.save(project);

            response.sendRedirect(request.getContextPath() + "/");
        }
    }
}
