<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une tâche</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>

<div class="max-w-md mx-auto">
    <div class="bg-white shadow-md rounded-lg p-6">
        <form action="ProjectServlet" method="post">
            <input type="hidden" name="action" value="addTask">
            <input type="hidden" name="projectId" value="${projectId}">
            <div class="mb-4">
                <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom de la tâche :</label>
                <input type="text" id="nom" name="nom" placeholder="Entrer le nom de la tâche" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="description" class="block text-gray-700 text-sm font-bold mb-2">Description :</label>
                <textarea id="description" name="description" placeholder="Entrer la description de la tâche" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></textarea>
            </div>
            <div class="mb-4">
                <label for="dateDebut" class="block text-gray-700 text-sm font-bold mb-2">Date de début :</label>
                <input type="date" id="dateDebut" name="dateDebut" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="dateFin" class="block text-gray-700 text-sm font-bold mb-2">Date de fin :</label>
                <input type="date" id="dateFin" name="dateFin" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="status" class="block text-gray-700 text-sm font-bold mb-2">Statut :</label>
    <input type="text" id="status" name="status" value="A faire" readonly class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">

            </div>
            <div class="mb-4">
                <label for="resourceId" class="block text-gray-700 text-sm font-bold mb-2">Sélectionner la ressource :</label>
                <select id="resourceId" name="resourceId" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="">Sélectionner une ressource...</option>
                    <c:forEach var="resource" items="${resources}">
                        <option value="${resource.id_ressource}">${resource.nom}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="flex items-center justify-end">
                <button type="submit" class="text-white bg-blue-900  hover:bg-blue-800 px-3 py-2 ml-2 rounded-full">Ajouter la tâche</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
