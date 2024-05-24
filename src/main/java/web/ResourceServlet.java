package web;

import model.dao.RessourceDao;
import model.entities.Ressource;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/resources")
public class ResourceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private RessourceDao ressourceDao;

    @Override
    public void init() {
        ressourceDao = new RessourceDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "list"; // Default action
        }

        switch (action) {
            case "list":
            default:
                List<Ressource> resources = ressourceDao.getAllressource();
                request.setAttribute("resources", resources);
                request.getRequestDispatcher("listResources.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}
