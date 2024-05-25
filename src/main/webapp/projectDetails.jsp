<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Détails du Projet</title>
    <!-- Include Tailwind CSS CDN -->
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-gray-100">
    <!-- Navbar -->
    <nav class="bg-white shadow-md p-4">
        <div class="container mx-auto flex justify-between items-center">
            <ul class="flex space-x-4">
                <li><a href="ConstructionXperte" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Accueil</a></li>
                <li><a href="tache.jsp" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Tâches</a></li>
                <li><a href="ressource.jsp" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Ressources</a></li>
            </ul>
        </div>
    </nav>

    <div class="max-w-7xl mx-auto mt-8 flex space-x-4">
        <!-- Project Details Card -->
        <div class="bg-white p-6 rounded-lg shadow-lg w-1/2">
            <h2 class="text-2xl font-bold mb-4 text-gray-800">Détails du Projet</h2>
            <c:if test="${project ne null}">
                <div class="mb-6 border-b border-gray-200 pb-4">
                    <div class="mb-4">
                        <h3 class="text-lg font-semibold text-gray-700">Nom</h3>
                        <p class="text-gray-600">${project.nom}</p>
                    </div>
                    <div class="mb-4">
                        <h3 class="text-lg font-semibold text-gray-700">Description</h3>
                        <p class="text-gray-600">${project.description}</p>
                    </div>
                    <div class="flex justify-between mb-4">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Date de Début</h3>
                            <p class="text-gray-600">${project.dateDebut}</p>
                        </div>
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Date de Fin</h3>
                            <p class="text-gray-600">${project.dateFin}</p>
                        </div>
                    </div>
                    <div>
                        <h3 class="text-lg font-semibold text-gray-700">Budget</h3>
                        <p class="text-gray-600">${project.budget}</p>
                    </div>
                </div>
            </c:if>
            <!-- Add Task Button -->
            <div class="flex justify-end">
                <a href="ProjectServlet?action=addTask&projectId=${project.getId_project()}" class="text-white bg-blue-900 shadow-md hover:bg-blue-800 px-3 py-2 rounded-full"><i class="fa-solid fa-plus"></i> Ajouter Tâche</a>
            </div>
        </div>

        <!-- Task Details Card -->
        <div class="bg-white p-6 rounded-lg shadow-lg w-1/2">
            <h2 class="text-2xl font-bold mb-4 text-gray-800">Détails des Tâches</h2>
            <c:forEach var="task" items="${tasks}">
                <div class="mb-6 border-b border-gray-200 pb-4">
                    <div class="flex items-center justify-between mb-2">
                        <h3 class="text-lg font-semibold text-gray-700">${task.nom}</h3>
                        <span class="px-3 py-1 rounded-full text-sm font-semibold
                            <c:choose>
                                <c:when test="${task.status == 'A faire'}">bg-red-200 text-red-800</c:when>
                                <c:when test="${task.status == 'En cours'}">bg-yellow-200 text-yellow-800</c:when>
                                <c:otherwise>bg-green-200 text-green-800</c:otherwise>
                            </c:choose>
                        ">${task.status}</span>
                    </div>
                    <p class="text-gray-600">${task.description}</p>
                    <div class="flex justify-between mt-2">
                        <div>
                            <span class="text-gray-500">Date de Début:</span>
                            <span class="text-gray-700 font-semibold">${task.dateDebut}</span>
                        </div>
                        <div>
                            <span class="text-gray-500">Date de Fin:</span>
                            <span class="text-gray-700 font-semibold">${task.dateFin}</span>
                        </div>
                    </div>
                    <form action="ProjectServlet" method="post" class="mt-2">
                        <input type="hidden" name="action" value="changeTaskStatus">
                        <input type="hidden" name="taskId" value="${task.id_tache != null ? task.id_tache : ''}">
                        <input type="hidden" name="projectId" value="${project.id_project != null ? project.id_project : ''}">
                        <select name="status" onchange="this.form.submit()" class="mt-2 px-2 py-1 border border-gray-300 rounded">
                            <option value="A faire" ${task.status == 'A faire' ? 'selected' : ''}>À faire</option>
                            <option value="En cours" ${task.status == 'En cours' ? 'selected' : ''}>En cours</option>
                            <option value="Terminé" ${task.status == 'Terminé' ? 'selected' : ''}>Terminé</option>
                        </select>
                    </form>
                </div>
            </c:forEach>
        </div>
    </div>
</body>
</html>
