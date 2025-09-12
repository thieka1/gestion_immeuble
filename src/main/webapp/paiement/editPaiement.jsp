<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Modifier un Paiement</title>
</head>
<body>
<div class="form-container">
  <h2>Modifier un Paiement</h2>
  <form action="?action=update" method="post">
    <!-- Champ caché pour l’ID -->
    <input type="hidden" name="id" value="${paiement.id}" />

    <label>Contrat :</label>
    <select name="contratId" required>
      <c:forEach items="${contrats}" var="c">
        <option value="${c.id}"
                <c:if test="${paiement.contratLocation.id == c.id}">selected</c:if>>
            ${c.locataire.utilisateur.nom} ${c.locataire.utilisateur.prenom}
          (Unité: ${c.unite.numero}, Immeuble: ${c.unite.immeuble.nom})
        </option>
      </c:forEach>
    </select>

    <label>Date du paiement :</label>
    <input type="date" name="datePaiement" value="${paiement.datePaiement}" required />

    <label>Montant :</label>
    <input type="number" step="0.01" name="montant" value="${paiement.montant}" required />

    <label>Statut :</label>
    <select name="statut" required>
      <option value="EN_ATTENTE" <c:if test="${paiement.statut == 'EN_ATTENTE'}">selected</c:if>>En attente</option>
      <option value="PAYE" <c:if test="${paiement.statut == 'PAYE'}">selected</c:if>>Payé</option>
    </select>

    <br><br>
    <button type="submit">Enregistrer les modifications</button>
  </form>
</div>
</body>
</html>
