<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>List of Tasks</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto mt-10">
        <h1 class="text-3xl font-bold mb-6">List of Tasks</h1>
        <table class="min-w-full bg-white border border-gray-200">
            <thead>
                <tr>
                    <th class="py-2 px-4 border-b">ID</th>
                    <th class="py-2 px-4 border-b">Project ID</th>
                    <th class="py-2 px-4 border-b">Resource ID</th>
                    <th class="py-2 px-4 border-b">Name</th>
                    <th class="py-2 px-4 border-b">Description</th>
                    <th class="py-2 px-4 border-b">Date Start</th>
                    <th class="py-2 px-4 border-b">Date End</th>
                    <th class="py-2 px-4 border-b">Status</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="task" items="${tasks}">
                    <tr>
                        <td class="py-2 px-4 border-b">${task.id_tache}</td>
                        <td class="py-2 px-4 border-b">${task.id_projet}</td>
                        <td class="py-2 px-4 border-b">${task.id_ressource}</td>
                        <td class="py-2 px-4 border-b">${task.nom}</td>
                        <td class="py-2 px-4 border-b">${task.description}</td>
                        <td class="py-2 px-4 border-b">${task.dateDebut}</td>
                        <td class="py-2 px-4 border-b">${task.dateFin}</td>
                        <td class="py-2 px-4 border-b">${task.status}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
