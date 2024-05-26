<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter Ressource</title>
    <!-- Ajoutez les liens vers vos feuilles de style CSS et vos bibliothèques JavaScript ici -->
</head>
<body>
    <h1>Ajouter Ressource</h1>
    <form action="ProjectServlet" method="post">
        <input type="hidden" name="action" value="addResource">
        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" required><br><br>
        <label for="type">Type :</label>
        <input type="text" id="type" name="type" required><br><br>
        <label for="quantite">Quantité :</label>
        <input type="number" id="quantite" name="quantite" required><br><br>
        <label for="infoFournisseur">Info Fournisseur :</label>
        <input type="text" id="infoFournisseur" name="infoFournisseur" required><br><br>
        <button type="submit">Ajouter</button>
    </form>
</body>
</html>
 