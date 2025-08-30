<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier une demande</title>
</head>
<body>
<h2>Modifier une demande de location</h2>

<form action="demande?action=update" method="post">
    <!-- ID caché -->
    <input type="hidden" name="id" value="${demande.id}" />

    <!-- Locataire -->
    <label for="locataire">Locataire :</label>
    <select name="locataireId" id="locataire" required>
        <c:forEach var="loc" items="${locataires}">
            <option value="${loc.id}"
                    <c:if test="${loc.id == demande.locataire.id}">selected</c:if>>
                    ${loc.utilisateur.nom} ${loc.utilisateur.prenom}
            </option>
        </c:forEach>
    </select>
    <br><br>

    <!-- Unité -->
    <label for="unite">Unité :</label>
    <select name="uniteId" id="unite" required>
        <c:forEach var="u" items="${unites}">
            <option value="${u.id}"
                    <c:if test="${u.id == demande.unite.id}">selected</c:if>>
                Unité ${u.numero} - ${u.loyerMensuel} F CFA
            </option>
        </c:forEach>
    </select>
    <br><br>

    <!-- Date Demande -->
    <label for="dateDemande">Date Demande :</label>
    <input type="date" id="dateDemande" name="dateDemande"
           value="${demande.dateDemande}" required />
    <br><br>

    <!-- Statut -->
    <label for="statut">Statut :</label>
        <select name="statut" required>
            <option value="EN_ATTENTE" <c:if test="${demande.statut.name() eq 'EN_ATTENTE'}">selected</c:if>>EN ATTENTE</option>
            <option value="ACCEPTEE" <c:if test="${demande.statut.name() eq 'ACCEPTEE'}">selected</c:if>>ACCEPTEE</option>
            <option value="REFUSEE" <c:if test="${demande.statut.name() eq 'REFUSEE'}">selected</c:if>>REFUSEE</option>
        </select>


    <br><br>

    <button type="submit">Enregistrer</button>
    <a href="demande?action=list">Annuler</a>
</form>

</body>
</html>
