<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/navbars/navbarLocataire.jsp" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard Immeubles - Locataire</title>
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

        /* Main Content Adaptation */
        .main-content {
            margin-left: 280px;
            padding: 30px;
            min-height: 100vh;
            transition: margin-left 0.3s ease;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 70px;
                padding: 20px;
            }
        }

        /* Page Header */
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

        /* Properties Grid */
        .properties-section {
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            margin-bottom: 30px;
        }

        .section-header {
            padding: 20px 30px;
            border-bottom: 1px solid #e2e8f0;
        }

        .section-title {
            font-size: 20px;
            font-weight: 600;
            color: #2d3748;
        }

        .properties-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 24px;
            padding: 30px;
        }

        /* Property Card */
        .property-card {
            background: #fff;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }

        .property-card:hover {
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            transform: translateY(-4px);
            border-color: #cbd5e0;
        }

        .property-image {
            height: 200px;
            overflow: hidden;
            position: relative;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        }

        .property-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .property-card:hover .property-image img {
            transform: scale(1.05);
        }

        .property-badge {
            position: absolute;
            top: 12px;
            right: 12px;
            background: rgba(255,255,255,0.95);
            color: #4a5568;
            padding: 4px 8px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            backdrop-filter: blur(4px);
        }

        .property-body {
            padding: 20px;
        }

        .property-name {
            font-size: 18px;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 16px;
            line-height: 1.3;
        }

        .property-info {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 12px;
            font-size: 14px;
            color: #718096;
        }

        .property-info-icon {
            width: 18px;
            height: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            color: #4a5568;
        }

        .property-owner {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px;
            background: #f7fafc;
            border-radius: 8px;
            margin-top: 16px;
        }

        .owner-avatar {
            width: 32px;
            height: 32px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            font-size: 14px;
        }

        .owner-info {
            flex: 1;
        }

        .owner-name {
            font-weight: 600;
            color: #2d3748;
            font-size: 14px;
        }

        .owner-role {
            color: #718096;
            font-size: 12px;
        }

        /* Equipments */
        .equipments {
            margin-top: 16px;
        }

        .equipments-title {
            font-size: 13px;
            font-weight: 600;
            color: #4a5568;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .equipment-list {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }

        .equipment-tag {
            background: #edf2f7;
            color: #4a5568;
            padding: 4px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
        }

        /* Actions */
        .property-actions {
            padding: 20px;
            border-top: 1px solid #f0f4f8;
            background: #fafbfc;
        }

        .btn-request {
            width: 100%;
            background: linear-gradient(135deg, #48bb78 0%, #38a169 100%);
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            font-size: 14px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            transition: all 0.3s ease;
        }

        .btn-request:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(72, 187, 120, 0.4);
        }

        .btn-request::before {
            content: "📝";
            font-size: 16px;
        }

        /* Empty State */
        .empty-state {
            text-align: center;
            padding: 80px 40px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
        }

        .empty-icon {
            font-size: 64px;
            margin-bottom: 24px;
            opacity: 0.5;
        }

        .empty-title {
            font-size: 24px;
            font-weight: 600;
            color: #2d3748;
            margin-bottom: 12px;
        }

        .empty-description {
            color: #718096;
            font-size: 16px;
            margin-bottom: 32px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
<!-- Main Content -->
<div class="main-content">
    <div class="page-header">
        <h1 class="page-title">Immeubles Disponibles</h1>
        <p class="page-subtitle">Découvrez les propriétés disponibles à la location</p>
    </div>

    <c:choose>
        <c:when test="${not empty immeubles}">
            <div class="properties-section">
                <div class="section-header">
                    <h2 class="section-title">Propriétés disponibles</h2>
                </div>

                <div class="properties-grid">
                    <c:forEach items="${immeubles}" var="im">
                        <div class="property-card">
                            <div class="property-image">
                                <img src="${pageContext.request.contextPath}/uploads/${im.image}"
                                     alt="Image de ${im.nom}"
                                     onerror="this.style.display='none'; this.parentElement.style.background='linear-gradient(135deg, #667eea 0%, #764ba2 100%)';">
                                <div class="property-badge">${im.nombreEtages} étages</div>
                            </div>

                            <div class="property-body">
                                <h3 class="property-name">${im.nom}</h3>

                                <div class="property-info">
                                    <span class="property-info-icon">📍</span>
                                    <span>${im.adresse}</span>
                                </div>

                                <div class="property-info">
                                    <span class="property-info-icon">🏗️</span>
                                    <span>${im.nombreEtages} étages</span>
                                </div>

                                <div class="property-owner">
                                    <div class="owner-avatar">
                                            ${fn:substring(im.proprietaire.nom, 0, 1)}${fn:substring(im.proprietaire.prenom, 0, 1)}
                                    </div>
                                    <div class="owner-info">
                                        <div class="owner-name">${im.proprietaire.nom} ${im.proprietaire.prenom}</div>
                                        <div class="owner-role">Propriétaire</div>
                                    </div>
                                </div>

                                <c:if test="${not empty im.equipements}">
                                    <div class="equipments">
                                        <div class="equipments-title">
                                            ⚙️ Équipements
                                        </div>
                                        <div class="equipment-list">
                                            <c:forEach items="${im.equipements}" var="equipement" varStatus="status">
                                                <span class="equipment-tag">${equipement}</span>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>
                            </div>

                            <div class="property-actions">
                                <a href="?action=add&id=${im.id}" class="btn-request">
                                    Faire une demande
                                </a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="empty-state">
                <div class="empty-icon">🏢</div>
                <h3 class="empty-title">Aucun immeuble disponible</h3>
                <p class="empty-description">
                    Il n'y a actuellement aucun immeuble disponible à la location.<br>
                    Revenez plus tard pour découvrir de nouvelles opportunités.
                </p>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
