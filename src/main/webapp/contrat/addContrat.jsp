<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Ajouter un Contrat</title>
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
    input[type="text"], input[type="date"], select {
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
  </style>
</head>
<body>
<div class="form-container">
  <h2>Ajouter un Contrat de Location</h2>
  <form action="contrat?action=save" method="post">

    <label>Locataire :</label>
    <select name="locataireId" required>
      <option value="" disabled selected>-- Sélectionner un locataire --</option>
      <c:forEach items="${locataires}" var="l">
        <option value="${l.id}">${l.utilisateur.nom} ${l.utilisateur.prenom}</option>
      </c:forEach>
    </select>

    <label>Unité :</label>
    <select name="uniteId" required>
      <option value="" disabled selected>-- Sélectionner une unité --</option>
      <c:forEach items="${unites}" var="u">
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
