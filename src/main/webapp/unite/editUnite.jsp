<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier une unité</title>
</head>
<body>
<div class="form-container">
    <h2>Modifier une unité de location</h2>
    <form action="unite" method="post" enctype="multipart/form-data">
        <!-- ID caché pour l’update -->
        <input type="hidden" name="id" value="${unite.id}" />


        <!-- Action update -->
        <label>Image actuelle :</label><br>
        <c:if test="${not empty unite.image}">
            <img src="uploads/${unite.image}" width="150" /><br>
        </c:if>

        <label>Changer l’image :</label>
        <input type="file" name="image" accept="image/*" />

        <input type="hidden" name="action" value="update" />

        <label>Numéro :</label>
        <input type="text" name="numero" value="${unite.numero}" required />

        <label>Nombre de pièces :</label>
        <input type="number" name="nombrePieces" value="${unite.nombrePieces}" required />

        <label>Superficie :</label>
        <input type="number" step="0.01" name="superficie" value="${unite.superficie}" required />

        <label>Loyer mensuel :</label>
        <input type="number" step="0.01" name="loyerMensuel" value="${unite.loyerMensuel}" required />

        <label>Statut :</label>
        <select name="statut" required>
            <option value="DISPONIBLE" <c:if test="${unite.statut.name() eq 'DISPONIBLE'}">selected</c:if>>Disponible</option>
            <option value="LOUE" <c:if test="${unite.statut.name() eq 'LOUEE'}">selected</c:if>>Louée</option>
        </select>

        <label>Immeuble :</label>
        <select name="immeubleId" required>
            <option value="" disabled>-- Sélectionner un immeuble --</option>
            <c:forEach items="${immeubles}" var="im">
                <option value="${im.id}" <c:if test="${unite.immeuble.id eq im.id}">selected</c:if>>
                        ${im.nom} (${im.adresse})
                </option>
            </c:forEach>
        </select>

        <br><br>
        <button type="submit">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>
