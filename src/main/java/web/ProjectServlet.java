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
}
