<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier un Contrat</title>
</head>
<body>
<div class="form-container">
    <h2>Modifier un Contrat de Location</h2>
    <form action="contrat" method="post">
        <!-- ID caché pour l’update -->
        <input type="hidden" name="id" value="${contrat.id}" />

        <!-- Action update -->
        <input type="hidden" name="action" value="update" />

        <!-- Locataire -->
        <label>Locataire :</label>
        <select name="locataireId" required>
            <option value="" disabled>-- Sélectionner un locataire --</option>
            <c:forEach items="${locataires}" var="l">
                <option value="${l.id}"
                        <c:if test="${contrat.locataire.id eq l.id}">selected</c:if>>
                        ${l.utilisateur.nom} ${l.utilisateur.prenom}
                </option>
            </c:forEach>
        </select>

        <!-- Unité -->
        <label>Unité :</label>
        <select name="uniteId" required>
            <option value="" disabled>-- Sélectionner une unité --</option>
            <c:forEach items="${unites}" var="u">
                <option value="${u.id}"
                        <c:if test="${contrat.unite.id eq u.id}">selected</c:if>>
                        ${u.numero} (Immeuble: ${u.immeuble.nom})
                </option>
            </c:forEach>
        </select>

        <!-- Dates -->
        <label>Date début :</label>
        <input type="date" name="dateDebut" value="${contrat.dateDebut}" required />

        <label>Date fin :</label>
        <input type="date" name="dateFin" value="${contrat.dateFin}" required />

        <!-- Statut -->
        <label>Statut :</label>
        <select name="statut" required>
            <option value="EN_COURS" <c:if test="${contrat.statut.name() eq 'EN_COURS'}">selected</c:if>>En cours</option>
            <option value="TERMINE" <c:if test="${contrat.statut.name() eq 'TERMINE'}">selected</c:if>>Terminé</option>
        </select>

        <br><br>
        <button type="submit">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>
