<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Project</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        function validateForm() {
            var nom = document.getElementById("nom").value;
            var description = document.getElementById("description").value;
            var dateDebut = document.getElementById("dateDebut").value;
            var dateFin = document.getElementById("dateFin").value;
            var budget = document.getElementById("budget").value;

            if (nom.trim() === "") {
                alert("Nom du projet est requis.");
                return false;
            }
            if (description.trim() === "") {
                alert("Description est requise.");
                return false;
            }
            if (dateDebut === "") {
                alert("Date de début est requise.");
                return false;
            }
            if (dateFin === "") {
                alert("Date de fin est requise.");
                return false;
            }
            if (budget === "" || isNaN(budget) || parseFloat(budget) <= 0) {
                alert("Budget doit être un nombre positif.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>


<%
    String id = request.getParameter("id");

%>




<div class="max-w-md mx-auto mt-10">
    <div class="bg-white shadow-md rounded-lg p-6">
        <form action="ProjectServlet?action=update" method="post" onsubmit="return validateForm()">
            <input type="hidden" id="id_project" name="id_project" value="<%= id %>">
            <div class="mb-6">
                <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom du projet:</label>
                <input type="text" id="nom" name="nom" value="${project.nom}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="description" class="block text-gray-700 text-sm font-bold mb-2">Description:</label>
                <textarea id="description" name="description" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">${project.description}</textarea>
            </div>
            <div class="mb-4">
                <label for="dateDebut" class="block text-gray-700 text-sm font-bold mb-2">Date de début:</label>
                <input type="date" id="dateDebut" name="dateDebut" value="${project.dateDebut}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="dateFin" class="block text-gray-700 text-sm font-bold mb-2">Date de fin:</label>
                <input type="date" id="dateFin" name="dateFin" value="${project.dateFin}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="budget" class="block text-gray-700 text-sm font-bold mb-2">Budget:</label>
                <input type="text" id="budget" name="budget" value="${project.budget}" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="flex items-center justify-end">
                <button type="submit" class="bg-blue-900 hover:bg-blue-800 text-white font-bold py-1 px-4 rounded focus:outline-none focus:shadow-outline">Mettre à jour</button>
            </div>
        </form>
        <a href="ConstructionXperte" class="text-blue-900 mt-4 inline-block" style="font-weight: 700;">
            <i class="fa-solid fa-circle-chevron-left" style="font-size: 26px;"></i>
        </a>
    </div>
</div>
</body>
</html>
