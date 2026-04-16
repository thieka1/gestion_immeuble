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
    <title>Modifier une unité</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
            color: #34495e;
        }
        input[type="text"], input[type="number"], select, input[type="file"] {
            width: 100%;
            padding: 8px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #27ae60;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background-color: #219150;
        }
        img {
            margin-top: 10px;
            border-radius: 5px;
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Modifier une unité de location</h2>
    <form action="unite" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${unite.id}" />
        <input type="hidden" name="action" value="update" />

        <label>Image actuelle :</label>
        <c:if test="${not empty unite.image}">
            <img src="uploads/${unite.image}" alt="Image de l'unité" /><br>
        </c:if>

        <label>Changer l’image :</label>
        <input type="file" name="image" accept="image/*" />

        <label>Numéro :</label>
        <input type="text" name="numero" value="${unite.numero}" required />

        <label>Nombre de pièces :</label>
        <input type="number" name="nombrePieces" value="${unite.nombrePieces}" required />

        <label>Superficie (m²) :</label>
        <input type="number" step="0.01" name="superficie" value="${unite.superficie}" required />

        <label>Loyer mensuel :</label>
        <input type="number" step="0.01" name="loyerMensuel" value="${unite.loyerMensuel}" required />

        <label>Statut :</label>
        <select name="statut" required>
            <option value="DISPONIBLE" <c:if test="${unite.statut.name() eq 'DISPONIBLE'}">selected</c:if>>Disponible</option>
            <option value="LOUE" <c:if test="${unite.statut.name() eq 'LOUE'}">selected</c:if>>Louée</option>
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

        <button type="submit">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>
