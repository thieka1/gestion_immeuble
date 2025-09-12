<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbars/navbarAdmin.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', sans-serif; }
        .card-custom { border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.08); margin-bottom: 20px; }
        .card-header { background: #2c3e50; color: white; font-weight: 600; }
        .stat { font-size: 28px; font-weight: bold; }
        .stat-label { font-size: 14px; color: #7f8c8d; }
        .table-actions a { margin-right: 5px; }
    </style>
</head>
<body>
<div class="container mt-4">
    <h2 class="mb-4">👋 Bienvenue Admin</h2>
    <!-- Statistiques globales -->
    <div class="row mb-4">
        <div class="col-md-2">
            <div class="card card-custom text-center p-3">
                <div class="stat">${totalImmeubles}</div>
                <div class="stat-label">Immeubles</div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card card-custom text-center p-3">
                <div class="stat">${totalUnites}</div>
                <div class="stat-label">Unités</div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card card-custom text-center p-3">
                <div class="stat">${totalContratsActifs}</div>
                <div class="stat-label">Contrats actifs</div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card card-custom text-center p-3">
                <div class="stat">${totalLocataires}</div>
                <div class="stat-label">Locataires</div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card card-custom text-center p-3">
                <div class="stat">${totalProprietaires}</div>
                <div class="stat-label">Propriétaires</div>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card card-custom text-center p-3">
                <div class="stat">${totalAdmins}</div>
                <div class="stat-label">Admins</div>
            </div>
        </div>
    </div>
    <form action="${pageContext.request.contextPath}/rapport/demandes" method="get" target="_blank">
        <button type="submit" class="btn btn-success">
            Générer le rapport PDF
        </button>
        <button type="submit" class="btn btn-success">
            Générer le rapport PDF
        </button>
    </form>
    <br><br>



    <!-- Gestion des utilisateurs -->
    <div class="card card-custom">
        <div class="card-header"><i class="fas fa-users"></i> Gestion des utilisateurs</div>
        <div class="card-body">
            <a href="utilisateur?action=add" class="btn btn-primary mb-3">+ Ajouter un utilisateur</a>
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Email</th>
                    <th>Rôle</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="u" items="${utilisateurs}">
                    <tr>
                        <td>${u.id}</td>
                        <td>${u.nom} ${u.prenom}</td>
                        <td>${u.email}</td>
                        <td>${u.role}</td>
                        <td class="table-actions">
                            <a href="utilisateur?action=edit&id=${u.id}" class="btn btn-sm btn-info">Modifier</a>
                            <a href="utilisateur?action=delete&id=${u.id}" class="btn btn-sm btn-danger"
                               onclick="return confirm('Supprimer cet utilisateur ?')">Supprimer</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Suivi des paiements -->
    <div class="card card-custom mt-4">
        <div class="card-header"><i class="fas fa-money-bill-wave"></i> Suivi des paiements</div>
        <div class="card-body">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Contrat</th>
                    <th>Montant</th>
                    <th>Date Paiement</th>
                    <th>Statut</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="p" items="${paiements}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.contratLocation.id}</td>
                        <td>${p.montant} Fcfa</td>
                        <td>${p.datePaiement}</td>
                        <td>
                            <span class="badge ${p.statut eq 'PAYE' ? 'bg-success' : (p.statut eq 'EN_ATTENTE' ? 'bg-warning' : 'bg-danger')}">
                                    ${p.statut}
                            </span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>
