<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<jsp:include page="/navbar.jsp" />

<html>
<head>
  <title>Dashboard Immeubles</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;600&display=swap" rel="stylesheet">
=======
<jsp:include page="/navbars/navbarLocataire.jsp" />

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard Immeubles - Locataire</title>
>>>>>>> 0249102 (design de l'application)
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
<<<<<<< HEAD
      font-family: 'Roboto', sans-serif;
      background-color: #f5f5f5;
      color: #333;
      line-height: 1.6;
    }

    .container {
      max-width: 1400px;
      margin: 0 auto;
      padding: 0 20px;
    }

    /* Header */
    .header {
      background: #fff;
      border-bottom: 1px solid #e0e0e0;
      padding: 25px 0;
      margin-bottom: 30px;
    }

    .header-content {
      display: flex;
      justify-content: space-between;
      align-items: center;
=======
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
>>>>>>> 0249102 (design de l'application)
    }

    .page-title {
      font-size: 28px;
<<<<<<< HEAD
      font-weight: 500;
      color: #2c3e50;
    }

    .btn-add {
      background: #3498db;
      color: #fff;
      padding: 12px 24px;
      text-decoration: none;
      border-radius: 4px;
      font-weight: 500;
      transition: background-color 0.2s;
      border: none;
      cursor: pointer;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }

    .btn-add:hover {
      background: #2980b9;
    }

    /* Grid */
    .properties-grid {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 20px;
      margin-bottom: 40px;
=======
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
>>>>>>> 0249102 (design de l'application)
    }

    /* Property Card */
    .property-card {
      background: #fff;
<<<<<<< HEAD
      border: 1px solid #e0e0e0;
      border-radius: 6px;
      overflow: hidden;
      transition: box-shadow 0.2s, transform 0.2s;
    }

    .property-card:hover {
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
      transform: translateY(-2px);
    }

    .property-image {
      height: 160px;
      overflow: hidden;
      position: relative;
=======
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
>>>>>>> 0249102 (design de l'application)
    }

    .property-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
<<<<<<< HEAD
    }

    .property-body {
      padding: 16px;
    }

    .property-name {
      font-size: 16px;
      font-weight: 500;
      color: #2c3e50;
      margin-bottom: 12px;
=======
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
>>>>>>> 0249102 (design de l'application)
      line-height: 1.3;
    }

    .property-info {
<<<<<<< HEAD
      margin-bottom: 8px;
      font-size: 14px;
      color: #666;
      display: flex;
      align-items: center;
      gap: 8px;
    }

    .property-info .icon {
      font-size: 12px;
      width: 14px;
      text-align: center;
      color: #3498db;
    }

    .equipments {
      margin-top: 12px;
=======
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
>>>>>>> 0249102 (design de l'application)
    }

    .equipment-list {
      display: flex;
      flex-wrap: wrap;
<<<<<<< HEAD
      gap: 4px;
    }

    .equipment-tag {
      background: #ecf0f1;
      color: #7f8c8d;
      padding: 2px 8px;
      border-radius: 3px;
      font-size: 11px;
      font-weight: 500;
    }

    .property-actions {
      padding: 12px 16px;
      border-top: 1px solid #f0f0f0;
      background: #fafafa;
      display: flex;
      gap: 8px;
    }

    .btn-action {
      padding: 6px 12px;
      border-radius: 3px;
      text-decoration: none;
      font-size: 12px;
      font-weight: 500;
      transition: all 0.2s;
      border: 1px solid;
      cursor: pointer;
      flex: 1;
      text-align: center;
    }

    .btn-edit {
      background: #fff;
      color: #3498db;
      border-color: #3498db;
    }

    .btn-edit:hover {
      background: #3498db;
      color: #fff;
    }

    .btn-delete {
      background: #fff;
      color: #e74c3c;
      border-color: #e74c3c;
    }

    .btn-delete:hover {
      background: #e74c3c;
      color: #fff;
    }

    /* Empty state */
    .empty-state {
      text-align: center;
      padding: 60px 20px;
      background: #fff;
      border: 1px solid #e0e0e0;
      border-radius: 6px;
    }

    .empty-state .icon {
      font-size: 48px;
      color: #bdc3c7;
      margin-bottom: 16px;
    }

    .empty-state h3 {
      font-size: 18px;
      font-weight: 400;
      color: #7f8c8d;
      margin-bottom: 8px;
    }

    .empty-state p {
      color: #95a5a6;
      margin-bottom: 24px;
    }

    /* Responsive */
    @media (max-width: 1400px) {
      .properties-grid {
        grid-template-columns: repeat(4, 1fr);
      }
    }

    @media (max-width: 1100px) {
      .properties-grid {
        grid-template-columns: repeat(3, 1fr);
      }
    }

    @media (max-width: 800px) {
      .properties-grid {
        grid-template-columns: repeat(2, 1fr);
      }
    }

    @media (max-width: 500px) {
      .properties-grid {
        grid-template-columns: 1fr;
      }

      .container {
        padding: 0 15px;
      }

      .header-content {
        flex-direction: column;
        gap: 16px;
        align-items: stretch;
      }

      .btn-add {
        text-align: center;
        justify-content: center;
      }
    }
    .btn-request {
      background: #27ae60;       /* vert pour la demande */
      color: #fff;
      border-color: #27ae60;
    }

    .btn-request:hover {
      background: #1e8449;
      color: #fff;
    }


    /* Simple icons using CSS */
    .icon-location::before { content: "📍"; }
    .icon-building::before { content: "🏢"; }
    .icon-user::before { content: "👤"; }
    .icon-tools::before { content: "⚙️"; }
    .icon-plus::before { content: "+"; }
    .icon-empty::before { content: "🏢"; }
  </style>
</head>
<body>

<div class="header">
  <div class="container">
    <div class="header-content">
      <h1 class="page-title">Gestion des Immeubles</h1>

    </div>
  </div>
</div>

<div class="container">
  <c:choose>
    <c:when test="${not empty immeubles}">
      <div class="properties-grid">
        <c:forEach items="${immeubles}" var="im">
          <div class="property-card">
            <div class="property-image">
              <img src="uploads/${im.image}" alt="Image de ${im.nom}">
            </div>

            <div class="property-body">
              <div class="property-name">${im.nom}</div>

              <div class="property-info">
                <span class="icon icon-location"></span>
                <span>${im.adresse}</span>
              </div>

              <div class="property-info">
                <span class="icon icon-building"></span>
                <span>${im.nombreEtages} étages</span>
              </div>

              <div class="property-info">
                <span class="icon icon-user"></span>
                <span>${im.proprietaire.nom} ${im.proprietaire.prenom}</span>
              </div>

              <c:if test="${not empty im.equipements}">
                <div class="equipments">
                  <div class="property-info">
                    <span class="icon icon-tools"></span>
=======
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

    /* Stats Cards */
    .stats-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
      margin-bottom: 30px;
    }

    .stat-card {
      background: white;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 2px 4px rgba(0,0,0,0.05);
      border: 1px solid #e2e8f0;
    }

    .stat-value {
      font-size: 28px;
      font-weight: 700;
      color: #2d3748;
      margin-bottom: 4px;
    }

    .stat-label {
      color: #718096;
      font-size: 14px;
      font-weight: 500;
    }

    .stat-icon {
      float: right;
      font-size: 24px;
      opacity: 0.7;
    }

    /* Responsive Design */
    @media (max-width: 1200px) {
      .properties-grid {
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 20px;
        padding: 20px;
      }
    }

    @media (max-width: 768px) {
      .page-header {
        padding: 20px;
        margin: -20px -20px 20px -20px;
      }

      .page-title {
        font-size: 24px;
      }

      .properties-grid {
        grid-template-columns: 1fr;
        gap: 16px;
        padding: 16px;
      }

      .section-header {
        padding: 16px 20px;
      }

      .property-body {
        padding: 16px;
      }

      .property-actions {
        padding: 16px;
      }
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
>>>>>>> 0249102 (design de l'application)
                    <div class="equipment-list">
                      <c:forEach items="${im.equipements}" var="equipement" varStatus="status">
                        <span class="equipment-tag">${equipement}</span>
                      </c:forEach>
                    </div>
                  </div>
<<<<<<< HEAD
                </div>
              </c:if>
            </div>

            <div class="property-actions">
              <a href="?action=add&id=${im.id}" class="btn-action btn-request">Faire une demande</a>
            </div>

          </div>
        </c:forEach>
=======
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
>>>>>>> 0249102 (design de l'application)
      </div>
    </c:when>
    <c:otherwise>
      <div class="empty-state">
<<<<<<< HEAD
        <div class="icon icon-empty"></div>
        <h3>Aucun immeuble</h3>
        <p>Commencez par ajouter votre premier immeuble.</p>
        <a href="?action=add" class="btn-add">
          <span class="icon-plus"></span>
          Ajouter un immeuble
        </a>
=======
        <div class="empty-icon">🏢</div>
        <h3 class="empty-title">Aucun immeuble disponible</h3>
        <p class="empty-description">
          Il n'y a actuellement aucun immeuble disponible à la location.<br>
          Revenez plus tard pour découvrir de nouvelles opportunités.
        </p>
>>>>>>> 0249102 (design de l'application)
      </div>
    </c:otherwise>
  </c:choose>
</div>

<<<<<<< HEAD
=======
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
>>>>>>> 0249102 (design de l'application)
</body>
</html>