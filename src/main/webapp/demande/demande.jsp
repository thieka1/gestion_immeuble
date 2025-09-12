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
    <title>Liste des demandes de location</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f7fa; color: #333; }
        h2 { color: #2c3e50; }
        a.btn-nouveau { display: inline-block; padding: 10px 15px; margin-bottom: 20px; background: #27ae60; color: #fff; text-decoration: none; border-radius: 5px; transition: 0.3s; }
        a.btn-nouveau:hover { background: #219150; }
        table { width: 100%; border-collapse: collapse; background: #fff; box-shadow: 0 2px 6px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; }
        th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
        thead { background: #34495e; color: #fff; }
        tbody tr:nth-child(even) { background: #f9f9f9; }
        tbody tr:hover { background: #ecf0f1; }
        .btn-action { display: inline-block; padding: 6px 10px; margin-right: 5px; border-radius: 4px; text-decoration: none; font-size: 14px; transition: 0.3s; }
        .btn-action:hover { opacity: 0.8; }
        .btn-action.delete { background: #e74c3c; color: white; }
        .btn-action.edit { background: #3498db; color: white; }
        .btn-action.accept { background: #27ae60; color: white; }
        .btn-action.reject { background: #e67e22; color: white; }
    </style>
</head>
<body>
<h2>Liste des demandes de location</h2>

<c:if test="${sessionScope.userRole ne 'PROPRIETAIRE'}">
    <a href="<c:url value='/demande?action=add'/>" class="btn-nouveau">+ Nouvelle demande</a>

</c:if>

<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Locataire</th>
        <th>Unité</th>
        <th>Date Demande</th>
        <th>Statut</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="d" items="${demandes}">
        <tr>
            <td>${d.id}</td>
            <td>${d.locataire.utilisateur.nom} ${d.locataire.utilisateur.prenom}</td>
            <td>${d.unite.numero}</td>
            <td>${d.dateDemande}</td>
            <td>${d.statut}</td>
            <td>
                <c:choose>
                    <c:when test="${d.statut eq 'EN_ATTENTE' && sessionScope.userRole eq 'PROPRIETAIRE'}">
                        <a href="${pageContext.request.contextPath}/demande?action=accept&id=${d.id}" class="btn-action accept">Accepter</a>
                        <a href="${pageContext.request.contextPath}/demande?action=reject&id=${d.id}" class="btn-action reject">Refuser</a>
                    </c:when>
                    <c:when test="${d.statut eq 'ACCEPTEE'}">
                        <span class="badge bg-success">ACCEPTÉE</span>
                    </c:when>
                    <c:when test="${d.statut eq 'REFUSEE'}">
                        <span class="badge bg-danger">REFUSÉE</span>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${sessionScope.userRole eq 'ADMIN'}">
                            <a href="${pageContext.request.contextPath}/demande?action=delete&id=${d.id}" class="btn-action delete"
                               onclick="return confirm('Êtes-vous sûr ?');">Supprimer</a>
                        </c:if>

                        <c:if test="${sessionScope.userRole eq 'LOCATAIRE'}">
                            <a href="${pageContext.request.contextPath}/demande?action=edit&id=${d.id}" class="btn-action edit">Modifier</a>
                            <a href="${pageContext.request.contextPath}/demande?action=delete&id=${d.id}" class="btn-action delete"
                               onclick="return confirm('Êtes-vous sûr ?');">Supprimer</a>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </td>

        </tr>
    </c:forEach>

    </tbody>
</table>
</body>
</html>
