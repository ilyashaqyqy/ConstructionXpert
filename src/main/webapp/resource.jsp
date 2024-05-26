<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Liste des Ressources</title>
    <!-- Tailwind CSS CDN -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!-- Navbar -->
    <nav class="bg-white shadow-md p-4">
        <div class="container mx-auto flex justify-between items-center">
            <ul class="flex space-x-4">
            <li><a href="ConstructionXperte" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Home</a></li>
            <li><a href="ProjectServlet?action=tache" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Tache</a></li>
            <li><a href="ProjectServlet?action=listResources" class="text-blue-900 bg-white shadow-md hover:bg-gray-200 px-3 py-2 rounded-full">Ressource</a></li>
            </ul>
        </div>
    </nav>


<a href="ProjectServlet?action=addResource" class="text-white bg-green-400 shadow-md hover:bg-green-500 px-3 py-1 rounded-full">
    Ajouter Ressource
</a>


    <div class="container mx-auto mt-10">
        <h1 class="text-3xl font-bold mb-6">Liste des Ressources</h1>
        <table class="min-w-full bg-white border border-gray-200">
            <thead>
                <tr>
<!--                     <th class="py-2 px-4 border-b">ID</th> -->
                    <th class="py-2 px-4 border-b">Name</th>
                    <th class="py-2 px-4 border-b">Type</th>
                    <th class="py-2 px-4 border-b">Quantity</th>
                    <th class="py-2 px-4 border-b">Supplier Info</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="resource" items="${resources}">
                    <tr>
<%--                         <td class="py-2 px-4 border-b">${resource.id_ressource}</td> --%>
                        <td class="py-2 px-4 border-b">${resource.nom}</td>
                        <td class="py-2 px-4 border-b">${resource.type}</td>
                        <td class="py-2 px-4 border-b">${resource.quantite}</td>
                        <td class="py-2 px-4 border-b">${resource.infoFournisseur}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
