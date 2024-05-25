package web;

import model.dao.ProjectDao;
import model.dao.RessourceDao;
import model.dao.TacheDao;
import model.entities.Project;
import model.entities.Ressource;
import model.entities.Tache;
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
                
                // Create an instance of TacheDao
                TacheDao tacheDao = new TacheDao();
                
                // Fetch tasks for the project using the instance of TacheDao
                List<Tache> tasks = tacheDao.getTasksByProjectId(detailsId); 
                
                request.setAttribute("project", projectDetails);
                request.setAttribute("tasks", tasks); // Pass tasks to the JSP
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
                
                

            case "addTask": // Handle addTask action
                int projectId = Integer.parseInt(request.getParameter("projectId"));
                List<Ressource> resources = ressourceDao.getAllressource(); // Retrieve all resources
                request.setAttribute("projectId", projectId);
                request.setAttribute("resources", resources); // Pass resources to the addTask.jsp
                request.getRequestDispatcher("addTask.jsp").forward(request, response);
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
        } else if ("addTask".equals(action)) { // Add task functionality
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int resourceId = Integer.parseInt(request.getParameter("resourceId"));
            String nom = request.getParameter("nom");
            String description = request.getParameter("description");
            String dateDebutStr = request.getParameter("dateDebut");
            String dateFinStr = request.getParameter("dateFin");
            String status = request.getParameter("status");

            // Convert date strings to java.sql.Date objects
            java.sql.Date dateDebut = java.sql.Date.valueOf(dateDebutStr);
            java.sql.Date dateFin = java.sql.Date.valueOf(dateFinStr);


            TacheDao tacheDao = new TacheDao();

   
            Tache tache = new Tache(projectId, resourceId, nom, description, dateDebut, dateFin, status);

            // Save the task using TacheDao
            Tache savedTache = tacheDao.save(tache);


            // Redirect back to the project details page
            response.sendRedirect(request.getContextPath() + "/?action=details&id=" + projectId);

        } else if ("changeTaskStatus".equals(action)) { // Add task status change functionality
            String taskIdString = request.getParameter("taskId");
            int taskId = -1; // Default value in case taskIdString is null
            if (taskIdString != null && !taskIdString.isEmpty()) {
                taskId = Integer.parseInt(taskIdString);
            }
            String status = request.getParameter("status");

            // Retrieve projectId from request parameters
            String projectIdString = request.getParameter("projectId");
            int projectId = -1; // Default value in case projectIdString is null
            if (projectIdString != null && !projectIdString.isEmpty()) {
                projectId = Integer.parseInt(projectIdString);
            }

            // Update the status of the task using TacheDao
            TacheDao tacheDao = new TacheDao();
            tacheDao.updateTaskStatus(taskId, status);

            // Redirect back to the project details page
            response.sendRedirect(request.getContextPath() + "/?action=details&id=" + projectId);
        }


           else {
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
