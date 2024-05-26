<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <div class="p-4">

            <table class="table-auto w-full mt-4">
                <thead>
                    <tr class="text-center">
                        <th class="px-4 py-2 text-blue-900">ID</th>
                        <th class="px-4 py-2 text-blue-900">Project ID</th>
                        <th class="px-4 py-2 text-blue-900">Resource ID</th>
                        <th class="px-4 py-2 text-blue-900">Name</th>
                        <th class="px-4 py-2 text-blue-900">Description</th>
                        <th class="px-4 py-2 text-blue-900">Date Start</th>
                        <th class="px-4 py-2 text-blue-900">Date End</th>
                        <th class="px-4 py-2 text-blue-900">Status</th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200 text-center">
                    <c:forEach var="task" items="${tasks}">
                        <tr class="hover:bg-gray-50">
                            <td class="px-4 py-2">${task.id_tache}</td>
                            <td class="px-4 py-2">${task.id_projet}</td>
                            <td class="px-4 py-2">${task.id_ressource}</td>
                            <td class="px-4 py-2">${task.nom}</td>
                            <td class="px-4 py-2">${task.description}</td>
                            <td class="px-4 py-2">${task.dateDebut}</td>
                            <td class="px-4 py-2">${task.dateFin}</td>
                            <td class="px-4 py-2">${task.status}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
