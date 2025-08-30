<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Nouvelle demande de location</title>
</head>
<body>
<h2>Nouvelle demande de location</h2>

<form action="demande?action=save" method="post">

    <label for="locataire">Locataire :</label>
    <select name="locataireId" id="locataire" required>
        <c:forEach var="loc" items="${locataires}">
            <option value="${loc.id}">
                    ${loc.utilisateur.nom} ${loc.utilisateur.prenom}
            </option>
        </c:forEach>
    </select>

    <br><br>

    <label for="unite">Unité :</label>
    <select name="uniteId" id="unite" required>
        <c:forEach var="u" items="${unites}">
            <option value="${u.id}">
                Unité ${u.numero} - ${u.loyerMensuel} F CFA
            </option>
        </c:forEach>
    </select>


    <button type="submit">Envoyer la demande</button>
</form>

<c:if test="${not empty error}">
    <p style="color: red">${error}</p>
</c:if>

</body>
</html>
