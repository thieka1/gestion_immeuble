<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Liste des Contrats</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 20px;
      background: #f5f7fa;
      color: #333;
    }

    h2 {
      color: #2c3e50;
    }

    a.btn-nouveau {
      display: inline-block;
      padding: 10px 15px;
      margin-bottom: 20px;
      background: #27ae60;
      color: #fff;
      text-decoration: none;
      border-radius: 5px;
      transition: 0.3s;
    }

    a.btn-nouveau:hover {
      background: #219150;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
      border-radius: 8px;
      overflow: hidden;
    }

    thead {
      background: #34495e;
      color: #fff;
    }

    th, td {
      padding: 12px 15px;
      text-align: left;
    }

    tbody tr:nth-child(even) {
      background: #f9f9f9;
    }

    tbody tr:hover {
      background: #ecf0f1;
    }

    .btn-action {
      display: inline-block;
      padding: 6px 10px;
      margin-right: 5px;
      border-radius: 4px;
      text-decoration: none;
      font-size: 14px;
      transition: 0.3s;
    }

    .btn-action:hover {
      opacity: 0.8;
    }

    .btn-action.delete {
      background: #e74c3c;
      color: white;
    }

    .btn-action.edit {
      background: #3498db;
      color: white;
    }
  </style>
</head>
<body>
<h2>Liste des Contrats de Location</h2>
<a href="contrat?action=add" class="btn-nouveau">+ Nouveau Contrat</a>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Locataire</th>
    <th>Unité</th>
    <th>Date début</th>
    <th>Date fin</th>
    <th>Statut</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${contrats}" var="c">
    <tr>
      <td>${c.id}</td>
      <td>${c.locataire.utilisateur.nom} ${c.locataire.utilisateur.prenom}</td>
      <td>${c.unite.numero}</td>
      <td>${c.dateDebut}</td>
      <td>${c.dateFin}</td>
      <td>${c.statut}</td>
      <td>
        <a href="contrat?action=edit&id=${c.id}" class="btn-action edit">Modifier</a>
        <a href="contrat?action=delete&id=${c.id}" class="btn-action delete"
           onclick="return confirm('Supprimer ce contrat ?');">Supprimer</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
