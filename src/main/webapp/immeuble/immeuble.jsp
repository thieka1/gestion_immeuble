<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbar.jsp" />
<html>
<head>
    <title>Gestion des Immeubles</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background: #f5f7fa;
            color: #333;
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

        thead {
            background: #34495e;
            color: #fff;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
        }

        tbody tr:nth-child(even) {
            background: #f9f9f9;
        }

        tbody tr:hover {
            background: #ecf0f1;
        }

        img {
            border-radius: 6px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
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

        .btn-action:not(.delete) {
            background: #3498db;
            color: white;
        }
    </style>
</head>
<body>
<h1>Gestion des immeubles</h1>
<a href="?action=add" class="btn-nouveau">+ Nouveau immeuble</a>

<h3>Liste des immeubles</h3>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Image</th>
        <th>Nom</th>
        <th>Adresse</th>
        <th>Nombre d’étages</th>
        <th>Propriétaire</th>
        <th>Équipements</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${immeubles}" var="im">
        <tr>
            <td>${im.id}</td>
            <td><img src="uploads/${im.image}" alt="image immeuble" width="100"></td>
            <td>${im.nom}</td>
            <td>${im.adresse}</td>
            <td>${im.nombreEtages}</td>
            <td>${im.proprietaire.nom} ${im.proprietaire.prenom}</td>
            <td>
                <c:forEach items="${im.equipements}" var="equipement" varStatus="status">
                    ${equipement}<c:if test="${!status.last}">, </c:if>
                </c:forEach>
            </td>
            <td>
                <a href="?action=edit&id=${im.id}" class="btn-action">Modifier</a>
                <a href="?action=delete&id=${im.id}" class="btn-action delete"
                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce immeuble ?');">
                    Supprimer
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
