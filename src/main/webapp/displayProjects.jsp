<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Tailwind CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
<!-- Font Awesome CDN -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Gestion de Projet</title>



</head>
<body class="bg-gray-100">


    <!-- Navbar -->
<nav class="bg-white shadow-md p-4">
    <div class="container mx-auto flex justify-between items-center">
        <ul class="flex space-x-4 ">
            <li><a href="ConstructionXperte" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Home</a></li>
                        <li><a href="ProjectServlet?action=listResources" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Ressource</a></li>
            <li><a href="ProjectServlet?action=tache" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Tache</a></li>

        </ul>
    </div>
</nav>


    <!-- Main Content -->
    <div class="container mx-auto mt-10">
        <div class="bg-white shadow-md rounded-lg">
<!--             <div class="bg-blue-900 text-white text-lg px-4 py-2 rounded-t-lg">Liste des projets</div> -->
            
            <div class="p-4">
                <!-- Search Form -->
                <form method="get" action="" class="mb-4">
                    <div class="flex items-center">
                      <input type="text" name="mc" placeholder="Rechercher..." class="bg-white text-blue-900 border  px-8 py-2 rounded-full shadow-md " style="margin-right: -1px;">
                        <button type="submit" class="text-blue-900 bg-white shadow-md hover:bg-gray-100 px-3 py-2 ml-2 rounded-full font-bold"><i class="fa-solid fa-magnifying-glass"></i> </button>
                    </div>
                </form>
                
                <br>
                <!-- Add Project Button -->
                <div class="mb-4">
                    <a href="addProject.jsp" class="text-white bg-blue-900  hover:bg-blue-800 px-3 py-2 ml-2 rounded-full"><i class="fa-solid fa-plus"></i> Ajouter Projet</a>
                </div>
               
           
               
                <table class="table-auto w-full mt-4">
                    <thead>
                        <tr class="text-center">
                            <!-- <th class="px-4 py-2">ID</th> -->
                            <th class="px-4 py-2 text-blue-900">Nom</th>
                            <!-- <th class="px-4 py-2">Description</th> -->
                            <th class="px-4 py-2 text-blue-900">Date de début</th>
                            <th class="px-4 py-2 text-blue-900">Date de fin</th>
                            <th class="px-4 py-2 text-blue-900">Budget</th>
                            <th class="px-4 py-2 text-blue-900">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200 text-center">
                        <c:forEach var="project" items="${projects}">
                            <tr class="hover:bg-gray-50">
                                <!-- <td class="px-4 py-2">${project.id_project}</td> -->
                                <td class="px-4 py-2">${project.nom}</td>
                                <!-- <td class="px-4 py-2">${project.description}</td> -->
                                <td class="px-4 py-2">${project.dateDebut}</td>
                                <td class="px-4 py-2">${project.dateFin}</td>
                                <td class="px-4 py-2">${project.budget}</td>
                                <td class="px-4 py-2">
                                    <a href="ProjectServlet?action=details&id=${project.id_project}" class="text-blue-900 bg-white shadow-md px-3 py-1 rounded-full hover:bg-gray-200"><i class="fa-solid fa-info"></i></a>
                                    <a href="updateProject.jsp?id=${project.id_project}" class="text-blue-900 bg-white shadow-md px-2 py-1 rounded-full hover:bg-gray-200"><i class="fa-solid fa-pen-to-square"></i></a>
                                    <a href="?action=delete&id=${project.id_project}" class="text-blue-900 bg-white shadow-md px-2 py-1 rounded-full hover:bg-gray-200" onclick="return confirm('Êtes-vous sûr ?')"><i class="fa-solid fa-trash"></i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
   
</body>
</html>
