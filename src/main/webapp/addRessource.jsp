<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Ressource</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
<div class="max-w-md mx-auto mt-10">
    <div class="bg-white shadow-md rounded-lg p-6">
        <form action="ProjectServlet?action=addRessource" method="post">
            <div class="mb-6">
                <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom:</label>
                <input type="text" id="nom" name="nom" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-6">
                <label for="type" class="block text-gray-700 text-sm font-bold mb-2">Type:</label>
                <input type="text" id="type" name="type" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-6">
                <label for="quantite" class="block text-gray-700 text-sm font-bold mb-2">Quantité:</label>
                <input type="number" id="quantite" name="quantite" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-6">
                <label for="infoFournisseur" class="block text-gray-700 text-sm font-bold mb-2">Info Fournisseur:</label>
                <input type="text" id="infoFournisseur" name="infoFournisseur" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="flex items-center justify-between">
                <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">Add Ressource</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
