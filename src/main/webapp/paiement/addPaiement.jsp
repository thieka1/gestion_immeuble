<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Ajouter un Paiement</title>
</head>
<body>
<div class="form-container">
    <h2>Ajouter un Paiement</h2>
    <form action="?action=save" method="post">
        <label>Contrat :</label>
        <select name="contratId" required>
            <option value="" disabled selected>-- Sélectionner un contrat --</option>
            <c:forEach items="${contrats}" var="c">
                <option value="${c.id}">
                        ${c.locataire.utilisateur.nom} ${c.locataire.utilisateur.prenom}
                    (Unité: ${c.unite.numero}, Immeuble: ${c.unite.immeuble.nom})
                </option>
            </c:forEach>
        </select>

        <label>Date du paiement :</label>
        <input type="date" name="datePaiement" required />

        <label>Montant :</label>
        <input type="number" step="0.01" name="montant" required />

        <label>Statut :</label>
        <select name="statut" required>
            <option value="EN_ATTENTE">En attente</option>
            <option value="PAYE">Payé</option>
        </select>

        <br><br>
        <button type="submit">Ajouter le paiement</button>
    </form>
</div>
</body>
</html>
