<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbar.jsp" />
<html>
<head>
  <title>Liste des Paiements</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f5f7fa;
      color: #333;
      margin: 20px;
    }

    h2 {
      text-align: center;
      color: #2c3e50;
    }

    a.btn-nouveau {
      display: inline-block;
      padding: 10px 15px;
      margin: 20px 0;
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

    th, td {
      padding: 12px 15px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }

    thead {
      background: #34495e;
      color: #fff;
    }

    tbody tr:nth-child(even) {
      background: #f9f9f9;
    }

    tbody tr:hover {
      background: #ecf0f1;
    }

    .btn {
      display: inline-block;
      padding: 6px 10px;
      margin-right: 5px;
      border-radius: 4px;
      text-decoration: none;
      font-size: 14px;
      color: #fff;
      transition: 0.3s;
    }

    .btn-edit {
      background: #3498db;
    }

    .btn-edit:hover {
      background: #2980b9;
    }

    .btn-delete {
      background: #e74c3c;
    }

    .btn-delete:hover {
      background: #c0392b;
    }
  </style>
</head>
<body>
<h2>Liste des Paiements</h2>
<a href="?action=add" class="btn-nouveau">+ Nouveau paiement</a>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Contrat</th>
    <th>Locataire</th>
    <th>Unité</th>
    <th>Immeuble</th>
    <th>Date Paiement</th>
    <th>Montant</th>
    <th>Statut</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${paiements}" var="p">
    <tr>
      <td>${p.id}</td>
      <td>
        Contrat n°${p.contratLocation.id}<br>
        Locataire: ${p.contratLocation.locataire.utilisateur.nom} ${p.contratLocation.locataire.utilisateur.prenom}<br>
        Immeuble: ${p.contratLocation.unite.immeuble.nom}, Unité: ${p.contratLocation.unite.numero}<br>
        [${p.contratLocation.dateDebut} → ${p.contratLocation.dateFin}] <br> ${p.contratLocation.statut}
      </td>
      <td>${p.contratLocation.locataire.utilisateur.nom} ${p.contratLocation.locataire.utilisateur.prenom}</td>
      <td>${p.contratLocation.unite.numero}</td>
      <td>${p.contratLocation.unite.immeuble.nom}</td>
      <td>${p.datePaiement}</td>
      <td>${p.montant}</td>
      <td>${p.statut}</td>
      <td>
        <a href="paiement?action=edit&id=${p.id}" class="btn btn-edit">Modifier</a>
        <a href="paiement?action=delete&id=${p.id}" class="btn btn-delete"
           onclick="return confirm('Voulez-vous vraiment supprimer ce paiement ?');">Supprimer</a>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
