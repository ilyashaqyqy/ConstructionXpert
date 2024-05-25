<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>All Tasks</title>
</head>
<body>
    <h1>All Tasks</h1>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Project ID</th>
            <th>Resource ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Date Start</th>
            <th>Date End</th>
            <th>Status</th>
        </tr>
        <c:forEach var="task" items="${tasks}">
            <tr>
                <td>${task.id_tache}</td>
                <td>${task.id_projet}</td>
                <td>${task.id_ressource}</td>
                <td>${task.nom}</td>
                <td>${task.description}</td>
                <td>${task.dateDebut}</td>
                <td>${task.dateFin}</td>
                <td>${task.status}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
