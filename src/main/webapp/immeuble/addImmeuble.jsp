<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Ajouter un Immeuble</title>
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



    <select id="proprietaire" name="proprietaireId" required>
      <option value="" disabled selected>-- Sélectionner un propriétaire --</option>
      <c:forEach items="${proprietaires}" var="p">
        <option value="${p.id}">${p.prenom} ${p.nom}</option>
      </c:forEach>
    </select>



    <br><br>
    <button type="submit">Ajouter</button>
  </form>
</div>
</body>
</html>
