<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Project</title>
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
                <button type="submit" class="bg-purple-900 hover:bg-purple-700 text-white font-bold py-1 px-4 rounded focus:outline-none focus:shadow-outline">Ajouter</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
