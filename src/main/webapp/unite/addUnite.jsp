<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ajouter une Unité de Location</title>
</head>
<body>
<div class="form-container">
    <h2>Ajouter une Unité de Location</h2>
    <form action="unite" method="post" enctype="multipart/form-data">
        <input type="hidden" name="action" value="save" />
        <label for="image">Image :</label>
        <input type="file" id="image" name="image" accept="image/*">

        <label>Numéro :</label>
        <input type="text" name="numero" placeholder="Ex: A101" required />

        <label>Nombre de pièces :</label>
        <input type="number" name="nombrePieces" placeholder="Ex: 3" required />

        <label>Superficie (m²) :</label>
        <input type="number" step="0.01" name="superficie" placeholder="Ex: 75.5" required />

        <label>Loyer mensuel :</label>
        <input type="number" step="0.01" name="loyerMensuel" placeholder="Ex: 500" required />

        <label>Statut :</label>
        <select name="statut" required>
            <option value="" disabled selected>-- Sélectionner --</option>
            <option value="DISPONIBLE">DISPONIBLE</option>
            <option value="LOUE">LOUEE</option>
        </select>

        <label>Immeuble :</label>
        <select name="immeubleId" required>
            <option value="" disabled selected>-- Sélectionner un immeuble --</option>
            <c:forEach items="${immeubles}" var="im">
                <option value="${im.id}">${im.nom}</option>
            </c:forEach>
        </select>

        <br><br>
        <button type="submit">Ajouter l'unité</button>
    </form>
</div>
</body>
</html>
