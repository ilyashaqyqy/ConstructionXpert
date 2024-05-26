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
            action = "list"; 
        }

        
        TacheDao tacheDao = new TacheDao();

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
                
      
                List<Tache> tasks = tacheDao.getTasksByProjectId(detailsId); 
                
                request.setAttribute("project", projectDetails);
                request.setAttribute("tasks", tasks); 
                request.getRequestDispatcher("projectDetails.jsp").forward(request, response);
                break;


                
            case "tache":
              
                List<Tache> allTasks = tacheDao.getAllTasks();
                
             
                request.setAttribute("tasks", allTasks);
                request.getRequestDispatcher("tache.jsp").forward(request, response);
                break;

            case "addTask": 
                int projectId = Integer.parseInt(request.getParameter("projectId"));
                List<Ressource> resources = ressourceDao.getAllressource(); 
                request.setAttribute("projectId", projectId);
                request.setAttribute("resources", resources); 
                request.getRequestDispatcher("addTask.jsp").forward(request, response);
                break;
                
            case "listResources":
               
                List<Ressource> allResources = ressourceDao.getAllressource();
                
               
                request.setAttribute("resources", allResources);
                request.getRequestDispatcher("resource.jsp").forward(request, response);
                break;

                
            case "addResource":
                request.getRequestDispatcher("addResource.jsp").forward(request, response);
                break;

                
            case "deleteResource":
                int resourceId = Integer.parseInt(request.getParameter("resourceId"));
                ressourceDao.deleteRessource(resourceId);
                response.sendRedirect(request.getContextPath() + "/ProjectServlet?action=listResources");
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
        } else if ("addTask".equals(action)) { 
            int projectId = Integer.parseInt(request.getParameter("projectId"));
            int resourceId = Integer.parseInt(request.getParameter("resourceId"));
            String nom = request.getParameter("nom");
            String description = request.getParameter("description");
            String dateDebutStr = request.getParameter("dateDebut");
            String dateFinStr = request.getParameter("dateFin");
            String status = request.getParameter("status");

          
            java.sql.Date dateDebut = java.sql.Date.valueOf(dateDebutStr);
            java.sql.Date dateFin = java.sql.Date.valueOf(dateFinStr);


            TacheDao tacheDao = new TacheDao();

   
            Tache tache = new Tache(projectId, resourceId, nom, description, dateDebut, dateFin, status);

           
            Tache savedTache = tacheDao.save(tache);


            
            response.sendRedirect(request.getContextPath() + "/?action=details&id=" + projectId);

        } else if ("changeTaskStatus".equals(action)) { 
            String taskIdString = request.getParameter("taskId");
            int taskId = -1; 
            if (taskIdString != null && !taskIdString.isEmpty()) {
                taskId = Integer.parseInt(taskIdString);
            }
            String status = request.getParameter("status");

            
            String projectIdString = request.getParameter("projectId");
            int projectId = -1; 
            if (projectIdString != null && !projectIdString.isEmpty()) {
                projectId = Integer.parseInt(projectIdString);
            }

           
            TacheDao tacheDao = new TacheDao();
            tacheDao.updateTaskStatus(taskId, status);

           
            response.sendRedirect(request.getContextPath() + "/?action=details&id=" + projectId);
        }
        
        else if ("deleteTask".equals(action)) {
            String taskIdString = request.getParameter("taskId");
            if (taskIdString != null && !taskIdString.isEmpty()) {
                int taskId = Integer.parseInt(taskIdString);
                TacheDao tacheDao = new TacheDao();
                tacheDao.delete(taskId);
                
                String projectIdString = request.getParameter("projectId");
                int projectId = -1; // Default value in case projectIdString is null
                if (projectIdString != null && !projectIdString.isEmpty()) {
                    projectId = Integer.parseInt(projectIdString);
                }
                response.sendRedirect(request.getHeader("referer"));
            }
        }
        
        else if ("addResource".equals(action)) {
            String nom = request.getParameter("nom");
            String type = request.getParameter("type");
            int quantite = Integer.parseInt(request.getParameter("quantite"));
            String infoFournisseur = request.getParameter("infoFournisseur");

            Ressource newResource = new Ressource(nom, type, quantite, infoFournisseur);
            ressourceDao.save(newResource);

            response.sendRedirect(request.getContextPath() + "/ProjectServlet?action=listResources");
        }
        
        
        else if ("deleteResource".equals(action)) {
            int resourceId = Integer.parseInt(request.getParameter("resourceId"));
            ressourceDao.deleteRessource(resourceId);
            response.sendRedirect(request.getContextPath() + "/ProjectServlet?action=listResources");
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
