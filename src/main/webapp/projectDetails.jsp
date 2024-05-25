<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Project Details</title>
    <!-- Include Tailwind CSS CDN -->
     <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-gray-100">
   
   
 
    <!-- Navbar -->
    <nav class="bg-white shadow-md p-4">
        <div class="container mx-auto flex justify-between items-center">
<!--             <div class="text-blue-900 text-lg font-semibold">Gestion de Projet</div> -->
            <ul class="flex space-x-4 ">
                <li><a href="ConstructionXperte" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Home</a></li>
                <li><a href="tache.jsp" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Tache</a></li>
                <li><a href="ressource.jsp" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Ressource</a></li>
            </ul>
        </div>
    </nav>
   
    <div class="max-w-3xl mx-auto mt-8">
        <div class="bg-white shadow-md rounded-lg p-6">
<!--             <h1 class="text-xl font-semibold mb-4">Détails du projet</h1> -->
                        <!-- Add Project Button -->
            <div class="mb-4 flex justify-between items-center">
                <!-- Add Task Button -->
              <a href="ProjectServlet?action=addTask&projectId=${project.getId_project()}" class="text-white bg-blue-900 shadow-md hover:bg-blue-800 px-3 py-2 ml-2 rounded-full"><i class="fa-solid fa-plus"></i> Ajouter Tache</a>

            </div>
            <c:if test="${project ne null}">
                <table class="min-w-full bg-white">
                    <tbody>
<!--                         <tr class="bg-gray-100"> -->
<!--                             <td class="w-1/3 px-6 py-4 font-semibold">ID</td> -->
<%--                             <td class="px-6 py-4">${project.id_project}</td> --%>
<!--                         </tr> -->
                        <tr>
                            <td class="w-1/3 px-6 py-4 font-semibold">Name</td>
                            <td class="px-6 py-4">${project.nom}</td>
                        </tr>
                        <tr class="bg-gray-100">
                            <td class="w-1/3 px-6 py-4 font-semibold">Description</td>
                            <td class="px-6 py-4">${project.description}</td>
                        </tr>
                        <tr>
                            <td class="w-1/3 px-6 py-4 font-semibold">Date de début</td>
                            <td class="px-6 py-4">${project.dateDebut}</td>
                        </tr>
                        <tr class="bg-gray-100">
                            <td class="w-1/3 px-6 py-4 font-semibold">Date de fin</td>
                            <td class="px-6 py-4">${project.dateFin}</td>
                        </tr>
                        <tr>
                            <td class="w-1/3 px-6 py-4 font-semibold">Budget</td>
                            <td class="px-6 py-4">${project.budget}</td>
                        </tr>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</body>
</html>
