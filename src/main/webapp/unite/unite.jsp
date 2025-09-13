<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.userRole eq 'ADMIN'}">
        <jsp:include page="/navbars/navbarAdmin.jsp"/>
    </c:when>
    <c:when test="${sessionScope.userRole eq 'PROPRIETAIRE'}">
        <jsp:include page="/navbars/navbarProprietaire.jsp"/>
    </c:when>
    <c:when test="${sessionScope.userRole eq 'LOCATAIRE'}">
        <jsp:include page="/navbars/navbarLocataire.jsp"/>
    </c:when>
</c:choose>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Unités - Dashboard</title>
    <style>
        /* Réutilisation des styles d’immeuble.jsp */
        * {margin: 0; padding: 0; box-sizing: border-box;}
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
            transition: margin-left 0.3s ease;
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
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
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
            display: inline-flex; align-items: center; gap: 8px;
            padding: 12px 20px;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white; text-decoration: none;
            border-radius: 8px; font-weight: 600;
            transition: all 0.3s ease; border: none; cursor: pointer;
        }
        .btn-primary:hover {transform: translateY(-2px);  box-shadow: 0 8px 25px rgba(30, 60, 114, 0.4);
        }
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

        .unit-image {
            width: 80px; height: 60px; object-fit: cover;
            border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }
        .unit-image:hover {transform: scale(1.1); cursor: pointer;}

        .actions-cell {white-space: nowrap;}
        .btn-action {
            display: inline-flex; align-items: center; gap: 6px;
            padding: 8px 12px; margin-right: 8px;
            border-radius: 6px; text-decoration: none;
            font-size: 13px; font-weight: 500;
            transition: all 0.2s ease; border: none; cursor: pointer;
        }
        .btn-edit {background: #e6fffa; color: #00796b; border: 1px solid #b2dfdb;}
        .btn-edit:hover {background: #00796b; color: white; transform: translateY(-1px);}
        .btn-delete {background: #ffeaea; color: #c53030; border: 1px solid #fed7d7;}
        .btn-delete:hover {background: #c53030; color: white; transform: translateY(-1px);}

        .empty-state {text-align: center; padding: 60px 20px; color: #718096;}
        .empty-state::before {content: "🚪"; font-size: 48px; display: block; margin-bottom: 20px; opacity: 0.5;}
    </style>
</head>
<body>

<div class="main-content">
    <div class="page-header">
        <h1 class="page-title">Gestion des Unités</h1>
        <p class="page-subtitle">Administrez les unités de location et leurs détails</p>
    </div>

    <div class="content-card">
        <div class="card-header">
            <h2 class="card-title">Liste des unités</h2>
            <a href="?action=add" class="btn-primary">Nouvelle unité</a>
        </div>

        <div class="table-container">
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Numéro</th>
                    <th>Pièces</th>
                    <th>Superficie</th>
                    <th>Loyer (€)</th>
                    <th>Statut</th>
                    <th>Immeuble</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty unites}">
                        <c:forEach items="${unites}" var="u">
                            <tr>
                                <td><strong>#${u.id}</strong></td>
                                <td><img src="uploads/${u.image}" alt="Unité ${u.numero}" class="unit-image"></td>
                                <td>${u.numero}</td>
                                <td>${u.nombrePieces}</td>
                                <td>${u.superficie} m²</td>
                                <td>${u.loyerMensuel} €</td>
                                <td>${u.statut}</td>
                                <td>${u.immeuble.nom}</td>
                                <td class="actions-cell">
                                    <a href="?action=edit&id=${u.id}" class="btn-action btn-edit">✏️ Modifier</a>
                                    <a href="?action=delete&id=${u.id}" class="btn-action btn-delete"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cette unité ?');">
                                        🗑️ Supprimer
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="9">
                                <div class="empty-state">
                                    <div>Aucune unité trouvée</div>
                                    <p style="margin-top: 10px; font-size: 14px;">Ajoutez votre première unité de location</p>
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
