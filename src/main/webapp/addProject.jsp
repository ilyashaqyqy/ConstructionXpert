<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Project</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        function validateForm() {
            const nom = document.getElementById('nom').value.trim();
            const description = document.getElementById('description').value.trim();
            const dateDebut = document.getElementById('dateDebut').value;
            const dateFin = document.getElementById('dateFin').value;
            const budget = document.getElementById('budget').value.trim();

            if (!nom) {
                alert("Le nom du projet est requis.");
                return false;
            }
            if (!description) {
                alert("La description du projet est requise.");
                return false;
            }
            if (!dateDebut) {
                alert("La date de début est requise.");
                return false;
            }
            if (!dateFin) {
                alert("La date de fin est requise.");
                return false;
            }
            if (new Date(dateDebut) >= new Date(dateFin)) {
                alert("La date de début doit être antérieure à la date de fin.");
                return false;
            }
            if (!budget || isNaN(budget) || budget <= 0) {
                alert("Le budget est requis et doit être un nombre positif.");
                return false;
            }

            return true; 
        }
    </script>
</head>
<body>

<br>

<div class="max-w-md mx-auto">
    <div class="bg-white shadow-md rounded-lg p-6">
        <form action="ProjectServlet" method="post" onsubmit="return validateForm()">
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
                <button type="submit" class="text-white bg-blue-900 hover:bg-blue-800 px-3 py-2 ml-2 rounded-full">Enregistrer</button>
            </div>
        </form>
        
        <a href="ConstructionXperte" class="text-blue-900 px-3 font-bold" style="font-weight: 700;">
            <i class="fa-solid fa-circle-chevron-left" style="font-size: 26px;"></i>
        </a>
    </div>
</div>

</body>
</html>
