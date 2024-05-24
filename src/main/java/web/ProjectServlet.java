package web;

import model.dao.ProjectDao;
import model.dao.RessourceDao;
import model.entities.Project;
import model.entities.Ressource;

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
    private RessourceDao ressourceDao;

    @Override
    public void init() {
        projectDao = new ProjectDao();
        ressourceDao = new RessourceDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // Default action
        }

        switch (action) {
            case "delete":
                int deleteId = Integer.parseInt(request.getParameter("id"));
                projectDao.deleteProject(deleteId);
                response.sendRedirect(request.getContextPath() + "/");
                break;

            case "add":
                request.getRequestDispatcher("addProject.jsp").forward(request, response);
                break;

            case "edit":
                int editId = Integer.parseInt(request.getParameter("id"));
                Project project = projectDao.getProjectById(editId);
                request.setAttribute("project", project);
                request.getRequestDispatcher("updateProject.jsp").forward(request, response);
                break;

            case "details":
                int detailsId = Integer.parseInt(request.getParameter("id"));
                Project projectDetails = projectDao.getProjectById(detailsId);
                request.setAttribute("project", projectDetails);
                request.getRequestDispatcher("projectDetails.jsp").forward(request, response);
                break;

            case "list":
            default:
                String mc = request.getParameter("mc");
                List<Project> projects;
                if (mc != null && !mc.isEmpty()) {
                    projects = projectDao.projectParMc(mc);
                } else {
                    projects = projectDao.getAllproject();
                }
                request.setAttribute("projects", projects);
                request.getRequestDispatcher("displayProjects.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
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
