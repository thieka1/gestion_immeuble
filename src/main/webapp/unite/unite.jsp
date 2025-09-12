<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.userRole eq 'ADMIN'}">
        <jsp:include page="/navbars/navbarAdmin.jsp"/>
    </c:when>
    <c:when test="${sessionScope.userRole eq 'PROPRIETAIRE'}">
        <jsp:include page="/navbars/navbarProprietaire.jsp"/>
    </c:when>
    <c:when test="${sessionScope.userRole eq 'LOCATAIRE'}">
        <jsp:include page="/navbars/navbarLocataire.jsp"/>
    </c:when>
</c:choose>
<html>
<head>
    <title>Gestion des unités</title>
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

<table class="main-table">
    <tr>
        <td>
            <h1>Gestion des unités de location</h1>

            <!-- Lien pour ajouter une nouvelle unité -->
            <a href="?action=add" class="btn-nouveau">+ Nouvelle unité</a>

            <h3>Liste des unités</h3>
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Numéro</th>
                    <th>Nombre de pièces</th>
                    <th>Superficie (m²)</th>
                    <th>Loyer mensuel</th>
                    <th>Statut</th>
                    <th>Immeuble</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${unites}" var="u">
                    <tr>
                        <td>${u.id}</td>
                        <td>
                            <img src="uploads/${u.image}" alt="image unité" width="100">
                        </td>
                        <td>${u.numero}</td>
                        <td>${u.nombrePieces}</td>
                        <td>${u.superficie}</td>
                        <td>${u.loyerMensuel}</td>
                        <td>${u.statut}</td>
                        <td>${u.immeuble.nom}</td>
                        <td>
                            <a href="?action=edit&id=${u.id}" class="btn-action edit">Modifier</a>
                            <a href="?action=delete&id=${u.id}" class="btn-action delete"
                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette unité ?');">
                                Supprimer
                            </a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </td>
    </tr>
</table>

</body>
</html>
