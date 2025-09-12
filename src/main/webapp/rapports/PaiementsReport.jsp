<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbars/navbarAdmin.jsp"/>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Rapport des Paiements</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { background: #f4f6f9; font-family: 'Segoe UI', sans-serif; }
        .card { border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); margin-bottom: 20px; }
        .card-header { background: #2c3e50; color: white; font-weight: 600; }
        .stat { font-size: 28px; font-weight: bold; }
        table th { background-color: #34495e; color: #fff; }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">📊 Rapport des Paiements</h2>

    <!-- Statistiques globales -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card text-center p-3">
                <div class="stat">${totalPaiements}</div>
                <div class="stat-label">Nombre de paiements</div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card text-center p-3">
                <div class="stat">${totalMontant} Fcfa</div>
                <div class="stat-label">Montant total</div>
            </div>
        </div>
    </div>

    <!-- Tableau des paiements -->
    <div class="card">
        <div class="card-header">Détails des Paiements</div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Contrat</th>
                    <th>Locataire</th>
                    <th>Montant</th>
                    <th>Date</th>
                    <th>Statut</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${paiements}">
                    <tr>
                        <td>${p.id}</td>
                        <td>Contrat n°${p.contratLocation.id}</td>
                        <td>${p.contratLocation.locataire.utilisateur.nom} ${p.contratLocation.locataire.utilisateur.prenom}</td>
                        <td>${p.montant} Fcfa</td>
                        <td>${p.datePaiement}</td>
                        <td>${p.statut}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Graphique Chart.js -->
    <div class="card mt-4">
        <div class="card-header">Graphique des Paiements par Mois</div>
        <div class="card-body">
            <canvas id="paiementsChart" height="150"></canvas>
        </div>
    </div>
</div>

<script>
    const ctx = document.getElementById('paiementsChart').getContext('2d');
    const paiementsParMois = [
        <c:forEach var="m" items="${paiementsParMois}">
        ${m.montant}<c:if test="${!m.last}">,</c:if>
        </c:forEach>
    ];
    const labels = [
        'Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin',
        'Juil', 'Août', 'Sep', 'Oct', 'Nov', 'Déc'
    ];

    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: 'Montant des paiements (Fcfa)',
                data: paiementsParMois,
                backgroundColor: 'rgba(52, 152, 219, 0.7)',
                borderColor: 'rgba(52, 152, 219, 1)',
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: { y: { beginAtZero: true } }
        }
    });
</script>

</body>
</html>
