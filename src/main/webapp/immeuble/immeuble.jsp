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
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des Immeubles - Dashboard</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f8fafc;
            color: #2d3748;
            line-height: 1.6;
        }

        /* Sidebar Styles - Répétition nécessaire pour l'intégration complète */
        .sidebar {
            position: fixed;
            left: 0;
            top: 0;
            height: 100vh;
            width: 280px;
            background: linear-gradient(180deg, #1e3c72, #2a5298);
            box-shadow: 2px 0 10px rgba(0,0,0,0.1);
            z-index: 1000;
            overflow-y: auto;
        }

        .sidebar-header {
            padding: 25px 20px;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .sidebar-header .logo {
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .sidebar-header .logo::before {
            content: "🏢";
            font-size: 28px;
        }

        .sidebar-nav {
            padding: 20px 0;
        }

        .sidebar-nav .nav-section {
            margin-bottom: 30px;
        }

        .sidebar-nav .section-title {
            color: rgba(255,255,255,0.6);
            font-size: 12px;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0 20px;
            margin-bottom: 15px;
        }

        .sidebar-nav .nav-item {
            display: block;
            color: rgba(255,255,255,0.9);
            text-decoration: none;
            padding: 12px 20px;
            margin: 2px 10px;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .sidebar-nav .nav-item::before {
            font-size: 18px;
            width: 20px;
            text-align: center;
        }

        .sidebar-nav .nav-item[href*="utilisateur"]::before { content: "👥"; }
        .sidebar-nav .nav-item[href*="locataire"]::before { content: "🏠"; }
        .sidebar-nav .nav-item[href*="immeuble"]::before { content: "🏢"; }
        .sidebar-nav .nav-item[href*="unite"]::before { content: "🚪"; }
        .sidebar-nav .nav-item[href*="contrat"]::before { content: "📋"; }
        .sidebar-nav .nav-item[href*="paiement"]::before { content: "💳"; }
        .sidebar-nav .nav-item[href*="demande"]::before { content: "📝"; }

        .sidebar-nav .nav-item:hover {
            background: rgba(255,255,255,0.1);
            color: #ffd700;
            transform: translateX(5px);
        }

        .sidebar-nav .nav-item.active {
            background: rgba(255,215,0,0.2);
            color: #ffd700;
            border-left: 4px solid #ffd700;
        }

        .sidebar-footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 20px;
            border-top: 1px solid rgba(255,255,255,0.1);
        }

        .logout-btn {
            display: flex;
            align-items: center;
            gap: 10px;
            background: #e74c3c;
            color: white !important;
            padding: 12px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
            transition: all 0.3s ease;
            width: 100%;
            justify-content: center;
        }

        .logout-btn::before {
            content: "🚪";
            font-size: 16px;
        }

        .logout-btn:hover {
            background: #c0392b;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
        }

        /* Main Content */
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

        .page-title {
            font-size: 28px;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 8px;
        }

        .page-subtitle {
            color: #718096;
            font-size: 16px;
        }

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

        .card-title {
            font-size: 20px;
            font-weight: 600;
            color: #2d3748;
        }

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

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(30, 60, 114, 0.4);
        }

        .btn-primary::before {
            content: "➕";
            font-size: 14px;
        }

        /* Table Styles */
        .table-container {
            overflow-x: auto;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table th {
            background: #f7fafc;
            padding: 16px 20px;
            text-align: left;
            font-weight: 600;
            color: #4a5568;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            border-bottom: 2px solid #e2e8f0;
        }

        .data-table td {
            padding: 16px 20px;
            border-bottom: 1px solid #e2e8f0;
            vertical-align: middle;
        }

        .data-table tbody tr {
            transition: background-color 0.2s ease;
        }

        .data-table tbody tr:hover {
            background: #f7fafc;
        }

        .data-table tbody tr:nth-child(even) {
            background: #fafafa;
        }

        .data-table tbody tr:nth-child(even):hover {
            background: #f0f4f8;
        }

        /* Image Styles */
        .immeuble-image {
            width: 80px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }

        .immeuble-image:hover {
            transform: scale(1.1);
            cursor: pointer;
        }

        /* Building Info */
        .building-info {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .building-name {
            font-weight: 600;
            font-size: 16px;
            color: #2d3748;
        }

        .building-address {
            color: #718096;
            font-size: 14px;
        }

        /* Owner Info */
        .owner-info {
            font-weight: 500;
            color: #4a5568;
        }

        /* Equipments */
        .equipments-list {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
            max-width: 200px;
        }

        .equipment-tag {
            background: #edf2f7;
            color: #4a5568;
            padding: 4px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }

        /* Floor Info */
        .floor-info {
            display: flex;
            align-items: center;
            gap: 6px;
            color: #4a5568;
            font-weight: 500;
        }

        .floor-info::before {
            content: "🏗️";
            font-size: 16px;
        }

        /* Action Buttons */
        .actions-cell {
            white-space: nowrap;
        }

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

        .btn-edit {
            background: #e6fffa;
            color: #00796b;
            border: 1px solid #b2dfdb;
        }

        .btn-edit:hover {
            background: #00796b;
            color: white;
            transform: translateY(-1px);
        }

        .btn-delete {
            background: #ffeaea;
            color: #c53030;
            border: 1px solid #fed7d7;
        }

        .btn-delete:hover {
            background: #c53030;
            color: white;
            transform: translateY(-1px);
        }

        .empty-state {
            text-align: center;
            padding: 60px 20px;
            color: #718096;
        }

        .empty-state::before {
            content: "🏢";
            font-size: 48px;
            display: block;
            margin-bottom: 20px;
            opacity: 0.5;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
                transition: width 0.3s ease;
            }

            .sidebar:hover {
                width: 280px;
            }

            .sidebar-header .logo span,
            .sidebar-nav .section-title,
            .sidebar-nav .nav-item span,
            .logout-btn span {
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .sidebar:hover .sidebar-header .logo span,
            .sidebar:hover .sidebar-nav .section-title,
            .sidebar:hover .sidebar-nav .nav-item span,
            .sidebar:hover .logout-btn span {
                opacity: 1;
            }

            .main-content {
                margin-left: 70px;
                padding: 20px;
            }

            .page-header {
                padding: 20px;
                margin: -20px -20px 20px -20px;
            }

            .page-title {
                font-size: 24px;
            }

            .card-header {
                padding: 15px 20px;
                flex-direction: column;
                align-items: flex-start;
                gap: 15px;
            }

            .data-table th,
            .data-table td {
                padding: 12px 10px;
            }

            .equipments-list {
                max-width: 150px;
            }
        }
    </style>
</head>
<body>


<!-- Main Content -->
<div class="main-content">
    <div class="page-header">
        <h1 class="page-title">Gestion des Immeubles</h1>
        <p class="page-subtitle">Gérez votre patrimoine immobilier et ses caractéristiques</p>
    </div>

    <div class="content-card">
        <div class="card-header">
            <h2 class="card-title">Liste des immeubles</h2>
            <a href="?action=add" class="btn-primary">Nouvel immeuble</a>
        </div>

        <div class="table-container">
            <table class="data-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Image</th>
                    <th>Immeuble</th>
                    <th>Étages</th>
                    <th>Propriétaire</th>
                    <th>Équipements</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <c:choose>
                    <c:when test="${not empty immeubles}">
                        <c:forEach items="${immeubles}" var="im">
                            <tr>
                                <td><strong>#${im.id}</strong></td>
                                <td>
                                    <img src="uploads/${im.image}" alt="Image de ${im.nom}" class="immeuble-image">
                                </td>
                                <td>
                                    <div class="building-info">
                                        <span class="building-name">${im.nom}</span>
                                        <span class="building-address">📍 ${im.adresse}</span>
                                    </div>
                                </td>
                                <td>
                                    <div class="floor-info">
                                            ${im.nombreEtages} étages
                                    </div>
                                </td>
                                <td>
                                    <div class="owner-info">${im.proprietaire.nom} ${im.proprietaire.prenom}</div>
                                </td>
                                <td>
                                    <div class="equipments-list">
                                        <c:forEach items="${im.equipements}" var="equipement" varStatus="status">
                                            <span class="equipment-tag">${equipement}</span>
                                        </c:forEach>
                                        <c:if test="${empty im.equipements}">
                                            <span style="color: #a0aec0; font-style: italic;">Aucun équipement</span>
                                        </c:if>
                                    </div>
                                </td>
                                <td class="actions-cell">
                                    <a href="?action=edit&id=${im.id}" class="btn-action btn-edit">
                                        ✏️ Modifier
                                    </a>
                                    <a href="?action=delete&id=${im.id}" class="btn-action btn-delete"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet immeuble ?');">
                                        🗑️ Supprimer
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="7">
                                <div class="empty-state">
                                    <div>Aucun immeuble trouvé</div>
                                    <p style="margin-top: 10px; font-size: 14px;">Ajoutez votre premier immeuble au patrimoine</p>
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