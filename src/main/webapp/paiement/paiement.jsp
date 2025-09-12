<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

<html>
<head>
  <title>Liste des Paiements</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f5f7fa; color: #333; margin: 20px; }
    h2 { text-align: center; color: #2c3e50; }
    table { width: 100%; border-collapse: collapse; background: #fff; box-shadow: 0 2px 6px rgba(0,0,0,0.1); border-radius: 8px; overflow: hidden; }
    th, td { padding: 12px 15px; text-align: left; border-bottom: 1px solid #ddd; }
    thead { background: #34495e; color: #fff; }
    tbody tr:nth-child(even) { background: #f9f9f9; }
    tbody tr:hover { background: #ecf0f1; }
    .btn { display: inline-block; padding: 6px 10px; margin-right: 5px; border-radius: 4px; text-decoration: none; font-size: 14px; color: #fff; transition: 0.3s; }
    .btn-edit { background: #3498db; }
    .btn-edit:hover { background: #2980b9; }
    .btn-edit.disabled { background: #95a5a6; cursor: not-allowed; pointer-events: none; }
    .btn-delete { background: #e74c3c; }
    .btn-delete:hover { background: #c0392b; }
    select { padding: 4px 8px; border-radius: 4px; }
    input[type="submit"] { padding: 5px 10px; border-radius: 4px; background: #27ae60; color: white; border: none; cursor: pointer; }
    input[type="submit"]:hover { background: #219150; }
    input[type="submit"]:disabled { background: #95a5a6; cursor: not-allowed; }
  </style>
</head>
<body>
<h2>Liste des Paiements</h2>

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
      <td>Contrat n°${p.contratLocation.id}</td>
      <td>${p.contratLocation.locataire.utilisateur.nom} ${p.contratLocation.locataire.utilisateur.prenom}</td>
      <td>${p.contratLocation.unite.numero}</td>
      <td>${p.contratLocation.unite.immeuble.nom}</td>
      <td>${p.datePaiement}</td>
      <td>${p.montant}</td>
      <td>${p.statut}</td>
      <td>
        <!-- Admin / Propriétaire -->
        <c:if test="${(sessionScope.user.role eq 'ADMIN' || sessionScope.user.role eq 'PROPRIETAIRE')}">
          <a href="paiement?action=edit&id=${p.id}"
             class="btn btn-edit ${p.statut eq 'PAYE' ? 'disabled' : ''}">Modifier</a>
          <a href="paiement?action=delete&id=${p.id}"
             class="btn btn-delete"
             onclick="return confirm('Voulez-vous vraiment supprimer ce paiement ?');">Supprimer</a>
        </c:if>

        <c:if test="${sessionScope.userRole eq 'LOCATAIRE'}">
          <c:choose>
            <c:when test="${p.statut eq 'EN_ATTENTE'}">
              <form action="paiement" method="post" style="display:inline;">
                <input type="hidden" name="action" value="updateStatus">
                <input type="hidden" name="id" value="${p.id}">
                <input type="submit" value="Valider">
              </form>
            </c:when>
            <c:otherwise>
              <button disabled>PAYE</button>
            </c:otherwise>
          </c:choose>
        </c:if>
        <c:if test="${p.statut eq 'PAYE'}">
          <a href="${pageContext.request.contextPath}/recu-paiement?id=${p.id}"
             class="btn btn-sm"
             style="background-color:#f39c12; color:white; font-weight:bold;">
            Reçu
          </a>
        </c:if>



      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
</html>
