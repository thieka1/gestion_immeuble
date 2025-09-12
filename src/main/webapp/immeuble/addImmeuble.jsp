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
  <title>Ajouter un Immeuble</title>
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
    h3 {
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
</head>
<body>
<div class="form-container">
  <h3>Ajouter un Immeuble</h3>
  <form action="immeuble?action=save" method="post" enctype="multipart/form-data">

    <label for="image">Image :</label>
    <input type="file" id="image" name="image" accept="image/*">

    <label for="nom">Nom :</label>
    <input type="text" id="nom" name="nom" placeholder="Nom de l’immeuble" required>

    <label for="adresse">Adresse :</label>
    <input type="text" id="adresse" name="adresse" placeholder="Adresse" required>

    <label for="nombreEtages">Nombre d’étages :</label>
    <input type="number" id="nombreEtages" name="nombreEtages" placeholder="Ex: 5" required>

    <label for="description">Description :</label>
    <textarea id="description" name="description" placeholder="Description de l’immeuble"></textarea>

    <label for="equipements">Équipements (séparés par des virgules) :</label>
    <input type="text" id="equipements" name="equipements" placeholder="Ex: Ascenseur, Parking, Sécurité">

    <!-- Champ propriétaire seulement pour l'admin -->
    <c:if test="${sessionScope.user.role eq 'ADMIN'}">
      <label for="proprietaire">Propriétaire :</label>
      <select id="proprietaire" name="proprietaireId" required>
        <option value="" disabled selected>-- Sélectionner un propriétaire --</option>
        <c:forEach items="${proprietaires}" var="p">
          <option value="${p.id}">${p.prenom} ${p.nom}</option>
        </c:forEach>
      </select>
    </c:if>

    <button type="submit">Ajouter</button>
  </form>
</div>
</body>
</html>
