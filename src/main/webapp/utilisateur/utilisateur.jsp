<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbar.jsp" />
<html>
<head>
    <title>Gestion des Utilisateurs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 20px;
            color: #333;
        }

        h1 {
            text-align: center;
            color: #2c3e50;
        }

        a.btn-nouveau {
            display: inline-block;
            padding: 10px 15px;
            margin: 20px 0;
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
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            text-align: left;
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
            border-radius: 4px;
            text-decoration: none;
            font-size: 14px;
            color: #fff;
            margin-right: 5px;
        }

        .btn-action.edit {
            background: #3498db;
        }

        .btn-action.edit:hover {
            background: #2980b9;
        }

        .btn-action.delete {
            background: #e74c3c;
        }

        .btn-action.delete:hover {
            background: #c0392b;
        }
    </style>
</head>
<body>

<h1>Gestion des Utilisateurs</h1>
<a href="?action=add" class="btn-nouveau">+ Nouvel utilisateur</a>

<h3>Liste des utilisateurs</h3>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prénom</th>
        <th>Email</th>
        <th>Téléphone</th>
        <th>Role</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${not empty utilisateurs}">
            <c:forEach items="${utilisateurs}" var="u">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.nom}</td>
                    <td>${u.prenom}</td>
                    <td>${u.email}</td>
                    <td>${u.telephone}</td>
                    <td>${u.role}</td>
                    <td>
                        <a href="?action=edit&id=${u.id}" class="btn-action edit">Modifier</a>
                        <a href="?action=delete&id=${u.id}" class="btn-action delete"
                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?');">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="7" style="text-align: center;">Aucun utilisateur trouvé.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

</body>
</html>
