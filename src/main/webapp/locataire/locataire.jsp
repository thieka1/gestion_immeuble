<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Gestion des Locataires</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            color: #333;
            margin: 20px;
        }

        h1 {
            color: #2c3e50;
        }

        a.btn-nouveau {
            display: inline-block;
            padding: 10px 15px;
            margin-bottom: 20px;
            background: #27ae60;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            transition: 0.3s;
        }

        a.btn-nouveau:hover {
            background: #219150;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        thead {
            background: #34495e;
            color: #fff;
        }

        tbody tr:nth-child(even) {
            background: #f9f9f9;
        }

        tbody tr:hover {
            background: #ecf0f1;
        }

        .btn-action {
            display: inline-block;
            padding: 6px 10px;
            margin-right: 5px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .btn-action:hover {
            opacity: 0.8;
        }

        .btn-action.delete {
            background: #e74c3c;
            color: white;
        }

        .btn-action.edit {
            background: #3498db;
            color: white;
        }
    </style>
</head>
<body>
<h1>Gestion des Locataires</h1>
<a href="?action=add" class="btn-nouveau">+ Nouveau Locataire</a>

<h3>Liste des locataires</h3>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Profession</th>
        <th>Adresse</th>
        <th>Utilisateur (Nom Prénom)</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${not empty locataires}">
            <c:forEach items="${locataires}" var="l">
                <tr>
                    <td>${l.id}</td>
                    <td>${l.profession}</td>
                    <td>${l.adresse}</td>
                    <td>${l.utilisateur.nom} ${l.utilisateur.prenom}</td>
                    <td>
                        <a href="?action=edit&id=${l.id}" class="btn-action edit">Modifier</a>
                        <a href="?action=delete&id=${l.id}" class="btn-action delete"
                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce locataire ?');">
                            Supprimer
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="5">Aucun locataire trouvé.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
</body>
</html>
