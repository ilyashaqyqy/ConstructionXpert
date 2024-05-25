<!DOCTYPE html>
<html>
<head>
    <title>Ajouter une tâche</title>
    <link href="https://unpkg.com/tailwindcss@^2/dist/tailwind.min.css" rel="stylesheet">
</head>
<body>

<div class="max-w-md mx-auto">
    <div class="bg-white shadow-md rounded-lg p-6">
        <form id="taskForm" action="ProjectServlet" method="post" onsubmit="return validateForm()">
            <input type="hidden" name="action" value="addTask">
            <input type="hidden" name="projectId" value="${projectId}">
            <div class="mb-4">
                <label for="nom" class="block text-gray-700 text-sm font-bold mb-2">Nom de la tâche :</label>
                <input type="text" id="nom" name="nom" placeholder="Entrer le nom de la tâche" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                <p id="nomError" class="text-red-500 text-xs italic hidden">Le nom de la tâche est requis.</p>
            </div>
            <div class="mb-4">
                <label for="description" class="block text-gray-700 text-sm font-bold mb-2">Description :</label>
                <textarea id="description" name="description" placeholder="Entrer la description de la tâche" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"></textarea>
                <p id="descriptionError" class="text-red-500 text-xs italic hidden">La description de la tâche est requise.</p>
            </div>
            <div class="mb-4">
                <label for="dateDebut" class="block text-gray-700 text-sm font-bold mb-2">Date de début :</label>
                <input type="date" id="dateDebut" name="dateDebut" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                <p id="dateDebutError" class="text-red-500 text-xs italic hidden">La date de début est requise.</p>
            </div>
            <div class="mb-4">
                <label for="dateFin" class="block text-gray-700 text-sm font-bold mb-2">Date de fin :</label>
                <input type="date" id="dateFin" name="dateFin" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                <p id="dateFinError" class="text-red-500 text-xs italic hidden">La date de fin est requise.</p>
            </div>
            <div class="mb-4">
                <label for="status" class="block text-gray-700 text-sm font-bold mb-2">Statut :</label>
                <input type="text" id="status" name="status" value="A faire" readonly class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
            </div>
            <div class="mb-4">
                <label for="resourceId" class="block text-gray-700 text-sm font-bold mb-2">Sélectionner la ressource :</label>
                <select id="resourceId" name="resourceId" class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline">
                    <option value="">Sélectionner une ressource...</option>
                    <c:forEach var="resource" items="${resources}">
                        <option value="${resource.id_ressource}">${resource.nom}</option>
                    </c:forEach>
                </select>
                <p id="resourceIdError" class="text-red-500 text-xs italic hidden">La ressource doit être sélectionnée.</p>
            </div>
            <div class="flex items-center justify-end">
                <button type="submit" class="text-white bg-blue-900 hover:bg-blue-800 px-3 py-2 ml-2 rounded-full">Ajouter la tâche</button>
            </div>
        </form>
    </div>
</div>

<script>
    function validateForm() {
        var nom = document.getElementById("nom").value;
        var description = document.getElementById("description").value;
        var dateDebut = document.getElementById("dateDebut").value;
        var dateFin = document.getElementById("dateFin").value;
        var resourceId = document.getElementById("resourceId").value;

        var nomError = document.getElementById("nomError");
        var descriptionError = document.getElementById("descriptionError");
        var dateDebutError = document.getElementById("dateDebutError");
        var dateFinError = document.getElementById("dateFinError");
        var resourceIdError = document.getElementById("resourceIdError");

        var isValid = true;

        if (nom.trim() === "") {
            nomError.classList.remove("hidden");
            isValid = false;
        } else {
            nomError.classList.add("hidden");
        }

        if (description.trim() === "") {
            descriptionError.classList.remove("hidden");
            isValid = false;
        } else {
            descriptionError.classList.add("hidden");
        }

        if (dateDebut.trim() === "") {
            dateDebutError.classList.remove("hidden");
            isValid = false;
        } else {
            dateDebutError.classList.add("hidden");
        }

        if (dateFin.trim() === "") {
            dateFinError.classList.remove("hidden");
            isValid = false;
        } else {
            dateFinError.classList.add("hidden");
        }

        if (resourceId === "") {
            resourceIdError.classList.remove("hidden");
            isValid = false;
        } else {
            resourceIdError.classList.add("hidden");
        }

        return isValid;
    }
</script>

</body>
</html>
