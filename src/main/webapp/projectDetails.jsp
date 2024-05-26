<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails du Projet</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body class="bg-gray-100">
    <!-- Navbar -->
    <nav class="bg-white shadow-md p-4">
        <div class="container mx-auto flex justify-between items-center">
            <ul class="flex space-x-4">
                <li><a href="ConstructionXperte" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Home</a></li>
                <li><a href="ProjectServlet?action=tache" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Tâche</a></li>
                <li><a href="ProjectServlet?action=listResources" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Ressource</a></li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mx-auto mt-8">
        <!-- Project Details Card -->
        <div class="flex flex-col md:flex-row gap-4">
            <div class="bg-white p-6 rounded-lg shadow-lg w-full md:w-2/2">
                <h2 class="text-2xl font-bold mb-4 text-gray-800">Détails du Projet</h2>
                <!-- Project details content -->
                <c:if test="${project ne null}">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Nom</h3>
                            <p class="text-gray-600">${project.nom}</p>
                        </div>
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Description</h3>
                            <p class="text-gray-600">${project.description}</p>
                        </div>
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Date de Début</h3>
                            <p class="text-gray-600">${project.dateDebut}</p>
                        </div>
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Date de Fin</h3>
                            <p class="text-gray-600">${project.dateFin}</p>
                        </div>
                        <div>
                            <h3 class="text-lg font-semibold text-gray-700">Budget</h3>
                            <p class="text-gray-600">${project.budget}</p>
                        </div>
                    </div>
                </c:if>
                <!-- Add Task Button -->
                <div class="flex justify-end mt-6">
                    <a href="ProjectServlet?action=addTask&projectId=${project.getId_project()}" class="text-white bg-blue-900 shadow-md hover:bg-blue-800 px-3 py-2 rounded-full">
                        <i class="fa-solid fa-plus"></i> Ajouter Tâche
                    </a>
                </div>
            </div>
        </div>

       <!-- Task Details Card -->
<div class="flex flex-col md:flex-row gap-4 mt-8">
    <div class="bg-white p-6 rounded-lg shadow-lg w-full md:w-2/2">
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
                <div class="flex flex-col md:flex-row justify-between mt-2">
                    <div>
                        <span class="text-gray-500">Date de Début:</span>
                        <span class="text-gray-700 font-semibold">${task.dateDebut}</span>
                    </div>
                    <div>
                        <span class="text-gray-500">Date de Fin:</span>
                        <span class="text-gray-700 font-semibold">${task.dateFin}</span>
                    </div>
                </div>
                <div class="flex justify-between mt-4">
<form id="deleteTaskForm_${task.id_tache}" action="ProjectServlet" method="post" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette tâche ?');">
    <input type="hidden" name="action" value="deleteTask">
    <input type="hidden" name="taskId" value="${task.id_tache}">
    <button type="submit" class="text-white bg-red-400 shadow-md hover:bg-red-500 px-3 py-1 rounded-full">
        Supprimer
    </button>
</form>



<%--                     <form id="editTaskForm_${task.id_tache}" action="<c:url value='ProjectServlet'/>" method="post"> --%>
<!--                         <input type="hidden" name="action" value="editTask"> -->
<%--                         <input type="hidden" name="taskId" value="${task.id_tache}"> --%>
<%--                         <button type="button" onclick="editTask(${task.id_tache});" class="text-white bg-blue-400 shadow-md hover:bg-blue-500 px-3 py-1 rounded-full"> --%>
<!--                             Modifier -->
<!--                         </button> -->
<!--                     </form> -->
                </div>
            </div>
        </c:forEach>
    </div>
</div>

    </div>
</body>
</html>
                                
