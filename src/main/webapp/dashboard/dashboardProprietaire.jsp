<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbars/navbarProprietaire.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Propriétaire</title>

    <!-- Bootstrap + FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">

    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', sans-serif; }
        .dashboard-title { color: #2c3e50; margin-bottom: 20px; }
        .card-custom { border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); margin-bottom: 20px; }
        .card-header { background: #2c3e50; color: white; font-weight: 600; }
        .btn-accept { background: #27ae60; color:white; }
        .btn-reject { background: #e74c3c; color:white; }
    </style>
</head>
<body>

<div class="container mt-4">
    <h2 class="dashboard-title">👋 Bienvenue Propriétaire</h2>

    <!-- Section Immeubles -->
    <div class="card card-custom">
        <div class="card-header"><i class="fas fa-building"></i> Mes Immeubles</div>
        <div class="card-body">
            <c:if test="${empty immeubles}">
                <p class="text-muted">Aucun immeuble trouvé.</p>
            </c:if>
            <c:forEach var="im" items="${immeubles}">
                <div class="mb-2">
                    <strong>${im.nom}</strong> – ${im.adresse}
                    <span class="badge bg-secondary">${im.nombreEtages} étages</span>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Section Unités -->
    <div class="card card-custom">
        <div class="card-header"><i class="fas fa-door-open"></i> Unités de Location</div>
        <div class="card-body">
            <c:if test="${empty unites}">
                <p class="text-muted">Aucune unité disponible.</p>
            </c:if>
            <c:forEach var="u" items="${unites}">
                <div class="mb-2">
                    Unité <strong>${u.numero}</strong> –
                    <c:choose>
                        <c:when test="${u.statut eq 'LOUE'}">
                            <span class="badge bg-danger">LOUÉE</span>
                        </c:when>
                        <c:when test="${u.statut eq 'DISPONIBLE'}">
                            <span class="badge bg-success">DISPONIBLE</span>
                        </c:when>
                    </c:choose>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Section Contrats -->
    <div class="card card-custom">
        <div class="card-header"><i class="fas fa-file-contract"></i> Contrats en cours</div>
        <div class="card-body">
            <c:if test="${empty contrats}">
                <p class="text-muted">Aucun contrat actif.</p>
            </c:if>
            <c:forEach var="c" items="${contrats}">
                <c:if test="${not empty c.locataire and not empty c.locataire.utilisateur}">
                    <div class="mb-2">
                        <strong>${c.locataire.utilisateur.nom} ${c.locataire.utilisateur.prenom}</strong>
                        <span class="text-muted">(${c.dateDebut} → ${c.dateFin})</span>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

    <!-- Section Paiements -->
    <div class="card card-custom">
        <div class="card-header"><i class="fas fa-money-bill-wave"></i> Paiements Reçus</div>
        <div class="card-body">
            <c:if test="${empty paiements}">
                <p class="text-muted">Aucun paiement enregistré.</p>
            </c:if>
            <c:forEach var="p" items="${paiements}">
                <div class="mb-2">
                    💰 ${p.montant} Fcfa – ${p.datePaiement} –
                    <span class="badge ${p.statut eq 'PAYE' ? 'bg-success' : 'bg-warning'}">${p.statut}</span>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Section Demandes Acceptées -->
    <div class="card card-custom mt-3">
        <div class="card-header"><i class="fas fa-check-circle"></i> Demandes Acceptées</div>
        <div class="card-body">
            <c:choose>
                <c:when test="${empty demandes}">
                    <p class="text-muted">Aucune demande acceptée.</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="d" items="${demandes}">
                        <c:if test="${d.statut eq 'ACCEPTEE'}">
                            <div class="mb-2">
                                <strong>${d.locataire.utilisateur.nom} ${d.locataire.utilisateur.prenom}</strong>
                                pour l’unité <strong>${d.unite.numero}</strong> –
                                <span class="badge bg-success">ACCEPTÉE</span>
                            </div>
                        </c:if>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>
    </div>



    <!-- Section Demandes -->
    <div class="card card-custom">
        <div class="card-header"><i class="fas fa-envelope-open-text"></i> Demandes en attente</div>
        <div class="card-body">
            <c:if test="${empty demandes}">
                <p class="text-muted">Aucune demande en attente.</p>
            </c:if>
            <c:forEach var="d" items="${demandes}">
                <c:if test="${not empty d.locataire and not empty d.locataire.utilisateur}">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                    <span>
                        Demande de <strong>${d.locataire.utilisateur.nom} ${d.locataire.utilisateur.prenom}</strong>
                        pour l’unité ${d.unite.numero}
                    </span>
                        <span>
                        <!-- Affiche les boutons uniquement si la demande est en attente -->
                        <c:if test="${d.statut eq 'EN_ATTENTE'}">
                            <a href="${pageContext.request.contextPath}/demande?action=accept&id=${d.id}" class="btn btn-sm btn-accept">Accepter</a>
                            <a href="${pageContext.request.contextPath}/demande?action=reject&id=${d.id}" class="btn btn-sm btn-reject">Refuser</a>
                        </c:if>
                            <!-- Si déjà acceptée ou refusée, affiche seulement le statut -->
                        <c:if test="${d.statut eq 'ACCEPTEE'}">
                            <span class="badge bg-success">ACCEPTÉE</span>
                        </c:if>
                        <c:if test="${d.statut eq 'REFUSEE'}">
                            <span class="badge bg-danger">REFUSÉE</span>
                        </c:if>
                    </span>
                    </div>
                </c:if>
            </c:forEach>
        </div>
    </div>

</div>
</body>
</html>
