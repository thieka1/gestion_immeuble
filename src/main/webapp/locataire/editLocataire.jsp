<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier un Locataire</title>
</head>
<body>
<div class="form-container">
    <h2>Modifier un Locataire</h2>
    <form action="locataire" method="post">
        <!-- ID caché pour update -->
        <input type="hidden" name="id" value="${locataire.id}" />

        <!-- Action update -->
        <input type="hidden" name="action" value="update" />

        <label>Profession :</label>
        <input type="text" name="profession" value="${locataire.profession}" required /><br/><br/>

        <label>Adresse :</label>
        <input type="text" name="adresse" value="${locataire.adresse}" required /><br/><br/>

        <label>Utilisateur :</label>
        <select name="id_utilisateur" required>
            <c:forEach var="user" items="${utilisateurs}">
                <option value="${user.id}"
                        <c:if test="${locataire.utilisateur.id == user.id}">selected</c:if>>
                        ${user.nom} ${user.prenom}
                </option>
            </c:forEach>
        </select><br/><br/>

        <button type="submit">Mettre à jour</button>
    </form>
</div>
</body>
</html>
