<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Modifier un Immeuble</title>
</head>
<body>
<div class="form-container">
    <h2>Modifier un Immeuble</h2>
    <form action="immeuble" method="post" enctype="multipart/form-data">

        <label>Image actuelle :</label><br>
        <c:if test="${not empty immeuble.image}">
            <img src="uploads/${immeuble.image}" width="150" /><br>
        </c:if>

        <label>Changer l’image :</label>
        <input type="file" name="image" accept="image/*" />

        <!-- ID caché pour l’update -->
        <input type="hidden" name="id" value="${immeuble.id}" />

        <!-- Action update -->
        <input type="hidden" name="action" value="update" />

        <label>Nom :</label>
        <input type="text" name="nom" value="${immeuble.nom}" required />

        <label>Adresse :</label>
        <input type="text" name="adresse" value="${immeuble.adresse}" required />

        <label>Nombre d’étages :</label>
        <input type="number" name="nombreEtages" value="${immeuble.nombreEtages}" required />

        <label>Description :</label>
        <textarea name="description">${immeuble.description}</textarea>

        <label>Équipements (séparés par des virgules) :</label>
        <input type="text" name="equipements" value="${equipementsStr}" />


        <label>Propriétaire :</label>
        <select name="proprietaireId" required>
            <option value="" disabled>-- Sélectionner un propriétaire --</option>
            <c:forEach items="${proprietaires}" var="p">
                <option value="${p.id}" ${p.id == immeuble.proprietaire.id ? 'selected' : ''}>
                        ${p.prenom} ${p.nom}
                </option>
            </c:forEach>
        </select>


        <br><br>
        <button type="submit">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>
