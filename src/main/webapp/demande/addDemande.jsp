<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Nouvelle demande de location</title>
</head>
<body>
<h2>Nouvelle demande de location</h2>

<form action="demande?action=save" method="post">

    <c:choose>
        <c:when test="${not empty locataire}">
            <%-- Locataire connecté --%>
            <input type="hidden" name="locataireId" value="${locataire.id}">
            <p>Demande de : ${locataire.utilisateur.nom} ${locataire.utilisateur.prenom}</p>
        </c:when>

        <c:otherwise>
            <%-- Admin --%>
            <label for="locataire">Locataire :</label>
            <select name="locataireId" id="locataire" required>
                <c:forEach var="loc" items="${locataires}">
                    <option value="${loc.id}">
                            ${loc.utilisateur.nom} ${loc.utilisateur.prenom}
                    </option>
                </c:forEach>
            </select>
        </c:otherwise>
    </c:choose>

    <br><br>

    <label for="unite">Unité :</label>
    <select name="uniteId" id="unite" required>
        <c:forEach var="u" items="${unites}">
            <option value="${u.id}">
                Unité ${u.numero} - ${u.loyerMensuel} F CFA
            </option>
        </c:forEach>
    </select>

    <br><br>
    <button type="submit">Envoyer la demande</button>
</form>

<c:if test="${not empty error}">
    <p style="color: red">${error}</p>
</c:if>

</body>
</html>
