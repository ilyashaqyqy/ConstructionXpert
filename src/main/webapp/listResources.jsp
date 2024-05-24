<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>List of Resources</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mx-auto mt-10">
        <h1 class="text-3xl font-bold mb-6">List of Resources</h1>
        <table class="min-w-full bg-white border border-gray-200">
            <thead>
                <tr>
                    <th class="py-2 px-4 border-b">ID</th>
                    <th class="py-2 px-4 border-b">Name</th>
                    <th class="py-2 px-4 border-b">Type</th>
                    <th class="py-2 px-4 border-b">Quantity</th>
                    <th class="py-2 px-4 border-b">Supplier Info</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="resource" items="${resources}">
                    <tr>
                        <td class="py-2 px-4 border-b">${resource.id_ressource}</td>
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
