<%--
  Created by IntelliJ IDEA.
  User: sowth
  Date: 23/08/2025
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <div class="form-container">
        <h3>Ajouter un locataire</h3>
        <form action="?action=save" method="post">

            <label for="profession">Profession :</label>
            <input type="text" id="profession" name="profession" placeholder="Profession" required>

            <label for="adresse">Adresse :</label>
            <input type="text" id="adresse" name="adresse" placeholder="Adresse" required>

            <label for="id_utilisateur">Utilisateur associé :</label>
            <select id="id_utilisateur" name="id_utilisateur" required>
                <option value="" disabled selected>Sélectionner</option>
                <c:forEach items="${utilisateurs}" var="u">
                    <option value="${u.id}">${u.prenom} ${u.nom}</option>
                </c:forEach>
            </select>

            <button type="submit">Ajouter</button>
        </form>
    </div>
</head>
<body>

</body>
</html>
