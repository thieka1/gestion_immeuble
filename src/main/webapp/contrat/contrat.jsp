<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<jsp:include page="/navbar.jsp" />

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
=======

<c:choose>
  <c:when test="${sessionScope.user.role eq 'ADMIN'}">
    <jsp:include page="/navbars/navbarAdmin.jsp"/>
  </c:when>
  <c:when test="${sessionScope.user.role eq 'PROPRIETAIRE'}">
    <jsp:include page="/navbars/navbarProprietaire.jsp"/>
  </c:when>
  <c:otherwise>
    <jsp:include page="/navbars/navbarLocataire.jsp"/>
  </c:otherwise>
</c:choose>

<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Gestion des Contrats - Dashboard</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: #f8fafc;
      color: #2d3748;
      line-height: 1.6;
    }

    .main-content {
      margin-left: 280px;
      padding: 30px;
      min-height: 100vh;
    }

    .page-header {
      background: white;
      padding: 25px 30px;
      margin: -30px -30px 30px -30px;
      border-bottom: 1px solid #e2e8f0;
      box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    }

    .page-title {font-size: 28px; font-weight: 700; color: #1a202c; margin-bottom: 8px;}
    .page-subtitle {color: #718096; font-size: 16px;}

    .content-card {
      background: white;
      border-radius: 12px;
      box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      margin-bottom: 30px;
    }

    .card-header {
      padding: 20px 30px;
      border-bottom: 1px solid #e2e8f0;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .card-title {font-size: 20px; font-weight: 600; color: #2d3748;}

    .btn-primary {
      display: inline-flex;
      align-items: center;
      gap: 8px;
      padding: 12px 20px;
      background: linear-gradient(135deg, #1e3c72, #2a5298);
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-weight: 600;
      transition: all 0.3s ease;
      border: none;
      cursor: pointer;
    }
    .btn-primary:hover {transform: translateY(-2px); box-shadow: 0 8px 25px rgba(30, 60, 114, 0.4);}
    .btn-primary::before {content: "➕"; font-size: 14px;}

    .table-container {overflow-x: auto;}
    .data-table {width: 100%; border-collapse: collapse;}
    .data-table th {
      background: #f7fafc; padding: 16px 20px; text-align: left;
      font-weight: 600; color: #4a5568; font-size: 14px;
      text-transform: uppercase; letter-spacing: 0.5px;
      border-bottom: 2px solid #e2e8f0;
    }
    .data-table td {padding: 16px 20px; border-bottom: 1px solid #e2e8f0; vertical-align: middle;}
    .data-table tbody tr:hover {background: #f7fafc;}
    .data-table tbody tr:nth-child(even) {background: #fafafa;}
    .data-table tbody tr:nth-child(even):hover {background: #f0f4f8;}

    .actions-cell {white-space: nowrap;}
    .btn-action {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      padding: 8px 12px;
      margin-right: 8px;
      border-radius: 6px;
      text-decoration: none;
      font-size: 13px;
      font-weight: 500;
      transition: all 0.2s ease;
      border: none;
      cursor: pointer;
    }
    .btn-edit {background: #e6fffa; color: #00796b; border: 1px solid #b2dfdb;}
    .btn-edit:hover {background: #00796b; color: white; transform: translateY(-1px);}
    .btn-delete {background: #ffeaea; color: #c53030; border: 1px solid #fed7d7;}
    .btn-delete:hover {background: #c53030; color: white; transform: translateY(-1px);}

    .empty-state {
      text-align: center;
      padding: 60px 20px;
      color: #718096;
    }
    .empty-state::before {
      content: "📋";
      font-size: 48px;
      display: block;
      margin-bottom: 20px;
      opacity: 0.5;
>>>>>>> 0249102 (design de l'application)
    }
  </style>
</head>
<body>
<<<<<<< HEAD
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
=======

<div class="main-content">
  <div class="page-header">
    <h1 class="page-title">Gestion des Contrats</h1>
    <p class="page-subtitle">Suivez et administrez vos contrats de location</p>
  </div>

  <div class="content-card">
    <div class="card-header">
      <h2 class="card-title">Liste des contrats</h2>
      <c:if test="${sessionScope.user.role eq 'ADMIN' || sessionScope.user.role eq 'PROPRIETAIRE'}">
        <a href="contrat?action=add" class="btn-primary">Nouveau contrat</a>
      </c:if>
    </div>

    <div class="table-container">
      <table class="data-table">
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
        <c:choose>
          <c:when test="${not empty contrats}">
            <c:forEach items="${contrats}" var="c">
              <tr>
                <td><strong>#${c.id}</strong></td>
                <td>${c.locataire.utilisateur.nom} ${c.locataire.utilisateur.prenom}</td>
                <td>${c.unite.numero}</td>
                <td>${c.dateDebut}</td>
                <td>${c.dateFin}</td>
                <td>${c.statut}</td>
                <td class="actions-cell">
                  <c:if test="${sessionScope.user.role eq 'ADMIN' || sessionScope.user.role eq 'PROPRIETAIRE'}">
                    <a href="contrat?action=edit&id=${c.id}" class="btn-action btn-edit">✏️ Modifier</a>
                    <a href="contrat?action=delete&id=${c.id}" class="btn-action btn-delete"
                       onclick="return confirm('Supprimer ce contrat ?');">🗑️ Supprimer</a>
                  </c:if>
                  <c:if test="${sessionScope.user.role eq 'LOCATAIRE'}">
                    <span style="color:#718096; font-style: italic;">Lecture seule</span>
                  </c:if>
                </td>
              </tr>
            </c:forEach>
          </c:when>
          <c:otherwise>
            <tr>
              <td colspan="7">
                <div class="empty-state">
                  <div>Aucun contrat trouvé</div>
                  <p style="margin-top: 10px; font-size: 14px;">Ajoutez votre premier contrat de location</p>
                </div>
              </td>
            </tr>
          </c:otherwise>
        </c:choose>
        </tbody>
      </table>
    </div>
  </div>
</div>

</body>
</html>
