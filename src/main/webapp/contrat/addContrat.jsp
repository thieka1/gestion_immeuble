<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Ajouter un Contrat</title>
</head>
<body>
<div class="form-container">
  <h2>Ajouter un Contrat de Location</h2>
  <form action="contrat?action=save" method="post">

    <label>Locataire :</label>
    <select name="locataireId" required>
      <option value="" disabled selected>-- Sélectionner un locataire --</option>
      <c:forEach items="${locataires}" var="l">
        <!-- On n'affiche que le nom et prénom de l'utilisateur associé -->
        <option value="${l.id}">${l.utilisateur.nom} ${l.utilisateur.prenom}</option>
      </c:forEach>
    </select>

    <label>Unité :</label>
    <select name="uniteId" required>
      <option value="" disabled selected>-- Sélectionner une unité --</option>
      <c:forEach items="${unites}" var="u">
        <!-- On n'affiche que le numéro et le nom de l'immeuble -->
        <option value="${u.id}">${u.numero} (Immeuble: ${u.immeuble.nom})</option>
      </c:forEach>
    </select>

    <label>Date début :</label>
    <input type="date" name="dateDebut" required />

    <label>Date fin :</label>
    <input type="date" name="dateFin" required />

    <label>Statut :</label>
    <select name="statut" required>
      <option value="EN_COURS">En cours</option>
      <option value="TERMINE">Terminé</option>
    </select>

    <button type="submit">Ajouter le contrat</button>
  </form>
</div>
</body>
</html>
