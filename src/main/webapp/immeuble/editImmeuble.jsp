<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<html>
<head>
    <title>Modifier un Immeuble</title>
=======

<html>
<head>
    <title>Modifier un Immeuble</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .form-container {
            max-width: 600px;
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
        input[type="text"], input[type="number"], input[type="file"], select, textarea {
            width: 100%;
            padding: 8px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        textarea {
            resize: vertical;
        }
        img {
            margin-top: 5px;
            margin-bottom: 10px;
            border-radius: 5px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.1);
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
    </style>
>>>>>>> 0249102 (design de l'application)
</head>
<body>
<div class="form-container">
    <h2>Modifier un Immeuble</h2>
    <form action="immeuble" method="post" enctype="multipart/form-data">

<<<<<<< HEAD
        <label>Image actuelle :</label><br>
=======
        <label>Image actuelle :</label>
>>>>>>> 0249102 (design de l'application)
        <c:if test="${not empty immeuble.image}">
            <img src="uploads/${immeuble.image}" width="150" /><br>
        </c:if>

        <label>Changer l’image :</label>
        <input type="file" name="image" accept="image/*" />

        <!-- ID caché pour l’update -->
        <input type="hidden" name="id" value="${immeuble.id}" />
<<<<<<< HEAD

        <!-- Action update -->
=======
>>>>>>> 0249102 (design de l'application)
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

<<<<<<< HEAD

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
=======
        <!-- Champ propriétaire seulement pour l'admin -->
        <c:if test="${sessionScope.user.role eq 'ADMIN'}">
            <label>Propriétaire :</label>
            <select name="proprietaireId" required>
                <option value="" disabled>-- Sélectionner un propriétaire --</option>
                <c:forEach items="${proprietaires}" var="p">
                    <option value="${p.id}" ${p.id == immeuble.proprietaire.id ? 'selected' : ''}>
                            ${p.prenom} ${p.nom}
                    </option>
                </c:forEach>
            </select>
        </c:if>

        <button type="submit">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>
