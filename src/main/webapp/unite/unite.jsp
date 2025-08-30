<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Gestion des unités</title>
</head>
<body>
<h1>Gestion des unités de location</h1>

<!-- Lien pour ajouter une nouvelle unité -->
<a href="?action=add" class="btn-nouveau">+ Nouvelle unité</a>

<h3>Liste des unités</h3>
<table>
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
                <img src="uploads/${u.image}" alt="image immeuble" width="100">
            </td>
            <td>${u.numero}</td>
            <td>${u.nombrePieces}</td>
            <td>${u.superficie}</td>
            <td>${u.loyerMensuel}</td>
            <td>${u.statut}</td>
            <td>${u.immeuble.nom}</td>
            <td>
                <a href="?action=edit&id=${u.id}" class="btn-action">Modifier</a>
                <a href="?action=delete&id=${u.id}" class="btn-action delete"
                   onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette unité ?');">
                    Supprimer
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
