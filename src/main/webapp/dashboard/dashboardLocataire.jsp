<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbar.jsp" />

<html>
<head>
  <title>Dashboard Immeubles</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;600&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
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
    }

    .page-title {
      font-size: 28px;
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
    }

    /* Property Card */
    .property-card {
      background: #fff;
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
    }

    .property-image img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .property-body {
      padding: 16px;
    }

    .property-name {
      font-size: 16px;
      font-weight: 500;
      color: #2c3e50;
      margin-bottom: 12px;
      line-height: 1.3;
    }

    .property-info {
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
    }

    .equipment-list {
      display: flex;
      flex-wrap: wrap;
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
                    <div class="equipment-list">
                      <c:forEach items="${im.equipements}" var="equipement" varStatus="status">
                        <span class="equipment-tag">${equipement}</span>
                      </c:forEach>
                    </div>
                  </div>
                </div>
              </c:if>
            </div>

            <div class="property-actions">
              <a href="?action=add&id=${im.id}" class="btn-action btn-request">Faire une demande</a>
            </div>

          </div>
        </c:forEach>
      </div>
    </c:when>
    <c:otherwise>
      <div class="empty-state">
        <div class="icon icon-empty"></div>
        <h3>Aucun immeuble</h3>
        <p>Commencez par ajouter votre premier immeuble.</p>
        <a href="?action=add" class="btn-add">
          <span class="icon-plus"></span>
          Ajouter un immeuble
        </a>
      </div>
    </c:otherwise>
  </c:choose>
</div>

</body>
</html>