<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter Ressource</title>
    <!-- Ajoutez les liens vers vos feuilles de style CSS et vos bibliothèques JavaScript ici -->
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
    <!-- Font Awesome CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        function validateResourceForm() {
            const nom = document.getElementById('nom').value.trim();
            const type = document.getElementById('type').value.trim();
            const quantite = document.getElementById('quantite').value;
            const infoFournisseur = document.getElementById('infoFournisseur').value.trim();

            if (!nom) {
                alert("Le nom de la ressource est requis.");
                return false;
            }
            if (!type) {
                alert("Le type de la ressource est requis.");
                return false;
            }
            if (!quantite || isNaN(quantite) || quantite <= 0) {
                alert("La quantité est requise et doit être un nombre positif.");
                return false;
            }
            if (!infoFournisseur) {
                alert("Les informations du fournisseur sont requises.");
                return false;
            }

            return true; 
        }
    </script>
</head>
<body class="bg-gray-100 h-screen flex items-center justify-center">

<div class="mx-auto" style="width: 400px;">
    <div class="max-w-xl mx-auto">
        <div class="bg-white shadow-md rounded-lg p-6">
            <form action="ProjectServlet" method="post" onsubmit="return validateResourceForm()">
                <input type="hidden" name="action" value="addResource">
                <div class="mb-6">
                    <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom :</label>
                    <input type="text" id="nom" name="nom"  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                <div class="mb-4">
                    <label for="type" class="block text-gray-700 text-sm font-bold mb-2">Type :</label>
                    <input type="text" id="type" name="type"  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                <div class="mb-4">
                    <label for="quantite" class="block text-gray-700 text-sm font-bold mb-2">Quantité :</label>
                    <input type="number" id="quantite" name="quantite"  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                <div class="mb-4">
                    <label for="infoFournisseur" class="block text-gray-700 text-sm font-bold mb-2">Info Fournisseur :</label>
                    <input type="text" id="infoFournisseur" name="infoFournisseur"  class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                </div>
                <div class="flex items-center justify-end">
                    <button type="submit" class="text-white bg-blue-900 hover:bg-blue-800 px-3 py-2 ml-2 rounded-full">Ajouter</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
