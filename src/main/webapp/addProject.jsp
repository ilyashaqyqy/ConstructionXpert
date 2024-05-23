<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Project</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

<br>

<div class="max-w-md mx-auto">
    <div class="bg-white shadow-md rounded-lg p-6">
        <form action="ProjectServlet" method="post">
            <div class="mb-6">
                <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom du projet:</label>
                <input type="text" id="nom" name="nom" placeholder="Entrez le nom du projet" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="description" class="block text-gray-700 text-sm font-bold mb-2">Description:</label>
                <textarea id="description" name="description" placeholder="Entrez la description du projet" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></textarea>
            </div>
            <div class="mb-4">
                <label for="dateDebut" class="block text-gray-700 text-sm font-bold mb-2">Date de début:</label>
                <input type="date" id="dateDebut" name="dateDebut" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="dateFin" class="block text-gray-700 text-sm font-bold mb-2">Date de fin:</label>
                <input type="date" id="dateFin" name="dateFin" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="budget" class="block text-gray-700 text-sm font-bold mb-2">Budget:</label>
                <input type="text" id="budget" name="budget" placeholder="Entrez le budget du projet" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="flex items-center justify-end">
                <button type="submit" class="bg-purple-900 hover:bg-purple-700 text-white font-bold py-1 px-4 rounded focus:outline-none focus:shadow-outline">Ajouter</button>
            </div>
        </form>
        
                <a href="ConstructionXperte" class="text-blue-900 mt-4 inline-block" style="font-weight: 700;">
            <i class="fa-solid fa-circle-chevron-left" style="font-size: 26px;"></i>
        </a>
    </div>
    </div>
</div>

</body>
</html>
