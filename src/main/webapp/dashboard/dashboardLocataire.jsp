<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/navbar.jsp" />
<html>
<head>
  <title>Dashboard Locataire</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
      min-height: 100vh;
      margin: 0;
      padding: 20px;
    }

    .container {
      max-width: 1400px;
      margin: 0 auto;
    }

    .welcome-header {
      text-align: center;
      color: white;
      margin-bottom: 40px;
    }

    .welcome-header h1 {
      font-size: 2.5em;
      margin-bottom: 10px;
      text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
    }

    .welcome-header p {
      font-size: 1.2em;
      opacity: 0.9;
    }

    .dashboard-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 25px;
      margin-bottom: 30px;
    }

    .info-card {
      background: white;
      border-radius: 20px;
      padding: 30px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
    }

    .info-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    }

    .card-header {
      display: flex;
      align-items: center;
      margin-bottom: 20px;
    }

    .card-icon {
      font-size: 2.5em;
      margin-right: 15px;
    }

    .card-title {
      font-size: 1.3em;
      font-weight: bold;
      color: #2c3e50;
      margin: 0;
    }

    .rental-info {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 15px;
    }

    .info-item {
      text-align: center;
      padding: 15px;
      background: #f8f9fa;
      border-radius: 10px;
    }

    .info-label {
      font-size: 0.9em;
      color: #7f8c8d;
      font-weight: 600;
      margin-bottom: 5px;
    }

    .info-value {
      font-size: 1.2em;
      font-weight: bold;
      color: #2c3e50;
    }

    .payment-status {
      padding: 8px 16px;
      border-radius: 20px;
      font-weight: bold;
      font-size: 0.9em;
    }

    .status-paid {
      background: #d5f4e6;
      color: #27ae60;
    }

    .status-pending {
      background: #ffeaa7;
      color: #f39c12;
    }

    .status-overdue {
      background: #fab1a0;
      color: #e74c3c;
    }

    .actions-section {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
      margin-bottom: 30px;
    }

    .action-card {
      background: white;
      border-radius: 15px;
      padding: 25px;
      text-align: center;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
      transition: all 0.3s ease;
      cursor: pointer;
      text-decoration: none;
      color: inherit;
    }

    .action-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    }

    .action-icon {
      font-size: 3em;
      margin-bottom: 15px;
    }

    .action-title {
      font-size: 1.1em;
      font-weight: bold;
      color: #2c3e50;
      margin-bottom: 8px;
    }

    .action-desc {
      font-size: 0.9em;
      color: #7f8c8d;
    }

    .recent-activity {
      background: white;
      border-radius: 20px;
      padding: 30px;
      box-shadow: 0 10px 30px rgba(0,0,0,0.1);
    }

    .activity-header {
      display: flex;
      align-items: center;
      margin-bottom: 25px;
    }

    .activity-list {
      list-style: none;
      padding: 0;
      margin: 0;
    }

    .activity-item {
      display: flex;
      align-items: center;
      padding: 15px 0;
      border-bottom: 1px solid #f1f2f6;
    }

    .activity-item:last-child {
      border-bottom: none;
    }

    .activity-icon {
      font-size: 1.5em;
      margin-right: 15px;
      width: 40px;
      text-align: center;
    }

    .activity-content {
      flex: 1;
    }

    .activity-title {
      font-weight: 600;
      color: #2c3e50;
      margin-bottom: 3px;
    }

    .activity-date {
      font-size: 0.8em;
      color: #7f8c8d;
    }

    @media (max-width: 768px) {
      .dashboard-grid {
        grid-template-columns: 1fr;
      }

      .rental-info {
        grid-template-columns: 1fr;
      }

      .actions-section {
        grid-template-columns: 1fr;
      }

      .container {
        padding: 0 10px;
      }
    }
  </style>
</head>
<body>

<div class="container">
  <div class="welcome-header">
    <h1>🏠 Bienvenue, ${sessionScope.user.prenom}!</h1>
    <p>Voici un aperçu de votre location</p>
  </div>

  <div class="dashboard-grid">
    <!-- Informations sur la location -->
    <div class="info-card">
      <div class="card-header">
        <div class="card-icon">🏡</div>
        <h2 class="card-title">Ma Location</h2>
      </div>
      <div class="rental-info">
        <div class="info-item">
          <div class="info-label">Unité</div>
          <div class="info-value">${currentRental.unite.numero}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Immeuble</div>
          <div class="info-value">${currentRental.unite.immeuble.nom}</div>
        </div>
        <div class="info-item">
          <div class="info-label">Loyer</div>
          <div class="info-value">${currentRental.unite.loyerMensuel}€</div>
        </div>
        <div class="info-item">
          <div class="info-label">Début bail</div>
          <div class="info-value">
            <fmt:formatDate value="${currentRental.dateDebut}" pattern="dd/MM/yyyy"/>
          </div>
        </div>
      </div>
    </div>

    <!-- Statut des paiements -->
    <div class="info-card">
      <div class="card-header">
        <div class="card-icon">💳</div>
        <h2 class="card-title">Paiements</h2>
      </div>
      <div class="rental-info">
        <div class="info-item">
          <div class="info-label">Ce mois</div>
          <div class="info-value">
                        <span class="payment-status ${currentPayment.statut == 'PAYE' ? 'status-paid' : (currentPayment.statut == 'EN_ATTENTE' ? 'status-pending' : 'status-overdue')}">
                          ${currentPayment.statut}
                        </span>
          </div>
        </div>
        <div class="info-item">
          <div class="info-label">Échéance</div>
          <div class="info-value">
            <fmt:formatDate value="${currentPayment.dateEcheance}" pattern="dd/MM"/>
          </div>
        </div>
        <div class="info-item">
          <div class="info-label">Montant</div>
          <div class="info-value">${currentPayment.montant}€</div>
        </div>
        <div class="info-item">
          <div class="info-label">Solde</div>
          <div class="info-value" style="color: ${accountBalance >= 0 ? '#27ae60' : '#e74c3c'}">
            ${accountBalance}€
          </div>
        </div>
      </div>
    </div>
  </div>

  <!-- Actions rapides -->
  <div class="actions-section">
    <a href="payments.jsp" class="action-card">
      <div class="action-icon">💰</div>
      <div class="action-title">Effectuer un paiement</div>
      <div class="action-desc">Payez votre loyer en ligne</div>
    </a>

    <a href="maintenance.jsp" class="action-card">
      <div class="action-icon">🔧</div>
      <div class="action-title">Demande de maintenance</div>
      <div class="action-desc">Signalez un problème</div>
    </a>

    <a href="documents.jsp" class="action-card">
      <div class="action-icon">📄</div>
      <div class="action-title">Mes documents</div>
      <div class="action-desc">Contrats et reçus</div>
    </a>

    <a href="contact.jsp" class="action-card">
      <div class="action-icon">📞</div>
      <div class="action-title">Contact</div>
      <div class="action-desc">Contactez la gestion</div>
    </a>
  </div>

  <!-- Activité récente -->
  <div class="recent-activity">
    <div class="activity-header">
      <div class="card-icon">📋</div>
      <h2 class="card-title">Activité récente</h2>
    </div>
    <ul class="activity-list">
      <c:forEach items="${recentActivities}" var="activity">
        <li class="activity-item">
          <div class="activity-icon">
            <c:choose>
              <c:when test="${activity.type == 'PAYMENT'}">💳</c:when>
              <c:when test="${activity.type == 'MAINTENANCE'}">🔧</c:when>
              <c:when test="${activity.type == 'DOCUMENT'}">📄</c:when>
              <c:otherwise>📋</c:otherwise>
            </c:choose>
          </div>
          <div class="activity-content">
            <div class="activity-title">${activity.description}</div>
            <div class="activity-date">
              <fmt:formatDate value="${activity.date}" pattern="dd/MM/yyyy à HH:mm"/>
            </div>
          </div>
        </li>
      </c:forEach>
    </ul>
  </div>
</div>

</body>
</html>