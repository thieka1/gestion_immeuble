<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<html>
<head>
  <title>Ajouter un Contrat</title>
</head>
<body>
<div class="form-container">
  <h2>Ajouter un Contrat de Location</h2>
  <form action="contrat?action=save" method="post">

    <label>Locataire :</label>
    <select name="locataireId" required>
      <option value="" disabled selected>-- Sélectionner un locataire --</option>
      <c:forEach items="${locataires}" var="l">
        <!-- On n'affiche que le nom et prénom de l'utilisateur associé -->
        <option value="${l.id}">${l.utilisateur.nom} ${l.utilisateur.prenom}</option>
      </c:forEach>
    </select>

    <label>Unité :</label>
    <select name="uniteId" required>
      <option value="" disabled selected>-- Sélectionner une unité --</option>
      <c:forEach items="${unites}" var="u">
        <!-- On n'affiche que le numéro et le nom de l'immeuble -->
        <option value="${u.id}">${u.numero} (Immeuble: ${u.immeuble.nom})</option>
      </c:forEach>
    </select>

    <label>Date début :</label>
    <input type="date" name="dateDebut" required />

    <label>Date fin :</label>
    <input type="date" name="dateFin" required />

    <label>Statut :</label>
    <select name="statut" required>
      <option value="EN_COURS">En cours</option>
      <option value="TERMINE">Terminé</option>
    </select>

    <button type="submit">Ajouter le contrat</button>
  </form>
</div>
</body>
</html>
=======
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
  <title>Ajouter un Contrat - Gestion Locative</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
      min-height: 100vh;
      padding: 20px 0;
    }

    .main-content {
      margin-left: 280px;
      padding: 40px 20px;
      transition: margin-left 0.3s ease;
    }

    @media (max-width: 768px) {
      .main-content {
        margin-left: 70px;
      }
    }

    .page-header {
      text-align: center;
      margin-bottom: 40px;
    }

    .page-title {
      font-size: 2.5rem;
      font-weight: 700;
      color: #1e3c72;
      margin-bottom: 10px;
    }

    .page-subtitle {
      color: #666;
      font-size: 1.1rem;
    }

    .breadcrumb {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 30px;
      font-size: 14px;
      color: #666;
    }

    .breadcrumb a {
      color: #2a5298;
      text-decoration: none;
      transition: color 0.3s ease;
    }

    .breadcrumb a:hover {
      color: #1e3c72;
    }

    .form-container {
      max-width: 700px;
      margin: 0 auto;
      background: rgba(255, 255, 255, 0.95);
      backdrop-filter: blur(10px);
      padding: 40px;
      border-radius: 24px;
      box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
      border: 1px solid rgba(255, 255, 255, 0.2);
      position: relative;
      overflow: hidden;
    }

    .form-container::before {
      content: '';
      position: absolute;
      top: 0;
      left: 0;
      right: 0;
      height: 4px;
      background: linear-gradient(90deg, #ffd700, #ffed4e, #ffd700);
      background-size: 200% 100%;
      animation: shimmer 2s linear infinite;
    }

    @keyframes shimmer {
      0% { background-position: -200% 0; }
      100% { background-position: 200% 0; }
    }

    .form-icon {
      text-align: center;
      margin-bottom: 20px;
    }

    .form-icon span {
      font-size: 3rem;
      margin-bottom: 10px;
      display: block;
    }

    h3 {
      font-size: 1.8rem;
      font-weight: 600;
      color: #1e3c72;
      text-align: center;
      margin-bottom: 30px;
    }

    .form-row {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 20px;
      margin-bottom: 20px;
    }

    .form-group {
      margin-bottom: 25px;
      position: relative;
    }

    .form-group.full-width {
      grid-column: 1 / -1;
    }

    label {
      display: block;
      margin-bottom: 8px;
      font-weight: 600;
      color: #1e3c72;
      font-size: 14px;
    }

    .required {
      color: #e74c3c;
    }

    input[type="text"],
    input[type="date"],
    select,
    textarea {
      width: 100%;
      padding: 14px 16px;
      border: 2px solid #e1e8ed;
      border-radius: 12px;
      font-size: 14px;
      font-family: 'Inter', sans-serif;
      transition: all 0.3s ease;
      background: rgba(255, 255, 255, 0.8);
    }

    input[type="text"]:focus,
    input[type="date"]:focus,
    select:focus,
    textarea:focus {
      outline: none;
      border-color: #2a5298;
      background: rgba(255, 255, 255, 1);
      box-shadow: 0 0 0 4px rgba(42, 82, 152, 0.1);
      transform: translateY(-1px);
    }

    select {
      cursor: pointer;
      appearance: none;
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
      background-position: right 12px center;
      background-repeat: no-repeat;
      background-size: 16px;
    }

    .btn-container {
      display: flex;
      gap: 15px;
      margin-top: 30px;
    }

    button {
      flex: 1;
      padding: 16px;
      border: none;
      border-radius: 12px;
      font-size: 15px;
      font-weight: 600;
      font-family: 'Inter', sans-serif;
      cursor: pointer;
      transition: all 0.3s ease;
      position: relative;
      overflow: hidden;
    }

    .btn-primary {
      background: linear-gradient(135deg, #1e3c72, #2a5298);
      color: white;
    }

    .btn-secondary {
      background: #f8f9fa;
      color: #666;
      border: 2px solid #e1e8ed;
    }

    .btn-primary::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: left 0.5s;
    }

    .btn-primary:hover::before {
      left: 100%;
    }

    .btn-primary:hover {
      transform: translateY(-2px);
      box-shadow: 0 8px 25px rgba(30, 60, 114, 0.3);
    }

    .btn-secondary:hover {
      background: #e9ecef;
      border-color: #adb5bd;
      transform: translateY(-1px);
    }

    .success-message,
    .error-message {
      padding: 12px 16px;
      border-radius: 8px;
      margin-bottom: 20px;
      font-size: 14px;
      display: none;
    }

    .success-message {
      background: rgba(39, 174, 96, 0.1);
      color: #27ae60;
      border: 1px solid rgba(39, 174, 96, 0.2);
    }

    .error-message {
      background: rgba(231, 76, 60, 0.1);
      color: #e74c3c;
      border: 1px solid rgba(231, 76, 60, 0.2);
    }

    /* Date picker styling */
    input[type="date"]::-webkit-calendar-picker-indicator {
      color: #2a5298;
      opacity: 0.8;
      cursor: pointer;
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%232a5298'%3e%3cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z'/%3e%3c/svg%3e");
      background-size: 16px;
      background-repeat: no-repeat;
      background-position: center;
      width: 20px;
      height: 20px;
    }

    /* Status select special styling */
    .status-select {
      position: relative;
    }

    .status-select::after {
      content: '📋';
      position: absolute;
      right: 45px;
      top: 50%;
      transform: translateY(-50%);
      font-size: 16px;
    }

    /* Responsive */
    @media (max-width: 768px) {
      .main-content {
        padding: 20px 15px;
      }

      .form-container {
        padding: 30px 20px;
      }

      .form-row {
        grid-template-columns: 1fr;
        gap: 0;
      }

      .btn-container {
        flex-direction: column;
      }

      .page-title {
        font-size: 2rem;
      }
    }

    /* Animation d'entrée */
    .form-group {
      opacity: 0;
      transform: translateY(20px);
      animation: fadeInUp 0.6s ease forwards;
    }

    .form-group:nth-child(1) { animation-delay: 0.1s; }
    .form-group:nth-child(2) { animation-delay: 0.2s; }
    .form-group:nth-child(3) { animation-delay: 0.3s; }
    .form-group:nth-child(4) { animation-delay: 0.4s; }
    .form-group:nth-child(5) { animation-delay: 0.5s; }

    @keyframes fadeInUp {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    /* Info tooltip */
    .info-tooltip {
      position: relative;
      display: inline-block;
      margin-left: 5px;
      cursor: help;
    }

    .info-tooltip::after {
      content: 'ℹ️';
      font-size: 14px;
    }

    .info-tooltip:hover::before {
      content: attr(data-tooltip);
      position: absolute;
      bottom: 100%;
      left: 50%;
      transform: translateX(-50%);
      background: #333;
      color: white;
      padding: 8px 12px;
      border-radius: 6px;
      font-size: 12px;
      white-space: nowrap;
      z-index: 1000;
      margin-bottom: 5px;
    }

    .info-tooltip:hover::after {
      content: '';
      position: absolute;
      bottom: 100%;
      left: 50%;
      transform: translateX(-50%);
      border: 5px solid transparent;
      border-top-color: #333;
      z-index: 1000;
    }
  </style>
</head>
<body>
<div class="main-content">
  <div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/contrat?action=list">📋 Contrats</a>
    <span>→</span>
    <span>Ajouter</span>
  </div>

  <div class="page-header">
    <h1 class="page-title">Nouveau Contrat</h1>
    <p class="page-subtitle">Créer un contrat de location</p>
  </div>

  <div class="form-container">
    <div class="form-icon">
      <span>📋</span>
    </div>

    <h3>Informations du contrat</h3>

    <div id="success-message" class="success-message"></div>
    <div id="error-message" class="error-message"></div>

    <form action="contrat?action=save" method="post" id="contratForm">

      <div class="form-row">
        <div class="form-group">
          <label for="locataireId">Locataire <span class="required">*</span></label>
          <select id="locataireId" name="locataireId" required>
            <option value="" disabled selected>-- Sélectionner un locataire --</option>
            <c:forEach items="${locataires}" var="l">
              <option value="${l.id}">${l.utilisateur.nom} ${l.utilisateur.prenom}</option>
            </c:forEach>
          </select>
        </div>

        <div class="form-group">
          <label for="uniteId">Unité <span class="required">*</span>
            <span class="info-tooltip" data-tooltip="Sélectionnez l'appartement à louer"></span>
          </label>
          <select id="uniteId" name="uniteId" required>
            <option value="" disabled selected>-- Sélectionner une unité --</option>
            <c:forEach items="${unites}" var="u">
              <option value="${u.id}">${u.numero} (Immeuble: ${u.immeuble.nom})</option>
            </c:forEach>
          </select>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="dateDebut">Date de début <span class="required">*</span></label>
          <input type="date" id="dateDebut" name="dateDebut" required>
        </div>

        <div class="form-group">
          <label for="dateFin">Date de fin <span class="required">*</span></label>
          <input type="date" id="dateFin" name="dateFin" required>
        </div>
      </div>

      <div class="form-group">
        <label for="statut">Statut du contrat <span class="required">*</span></label>
        <div class="status-select">
          <select id="statut" name="statut" required>
            <option value="EN_COURS" selected>En cours</option>
            <option value="TERMINE">Terminé</option>
          </select>
        </div>
      </div>

      <div class="btn-container">
        <button type="button" class="btn-secondary" onclick="history.back()">
          Annuler
        </button>
        <button type="submit" class="btn-primary">
          Créer le contrat
        </button>
      </div>
    </form>
  </div>
</div>

<script>
  const form = document.getElementById('contratForm');
  const successMessage = document.getElementById('success-message');
  const errorMessage = document.getElementById('error-message');

  // Validation en temps réel pour les champs obligatoires
  const requiredInputs = form.querySelectorAll('[required]');

  requiredInputs.forEach(input => {
    input.addEventListener('input', function() {
      if (this.value.trim()) {
        this.style.borderColor = '#27ae60';
        this.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
      } else {
        this.style.borderColor = '#e1e8ed';
        this.style.boxShadow = 'none';
      }
    });

    input.addEventListener('blur', function() {
      if (this.value.trim() === '') {
        this.style.borderColor = '#e74c3c';
        this.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
      }
    });
  });

  // Validation des dates
  const dateDebut = document.getElementById('dateDebut');
  const dateFin = document.getElementById('dateFin');

  function validateDates() {
    const debut = new Date(dateDebut.value);
    const fin = new Date(dateFin.value);

    if (dateDebut.value && dateFin.value) {
      if (debut >= fin) {
        dateFin.style.borderColor = '#e74c3c';
        dateFin.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
        errorMessage.innerHTML = 'La date de fin doit être postérieure à la date de début.';
        errorMessage.style.display = 'block';
        return false;
      } else {
        dateFin.style.borderColor = '#27ae60';
        dateFin.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
        errorMessage.style.display = 'none';
        return true;
      }
    }
    return true;
  }

  dateDebut.addEventListener('change', validateDates);
  dateFin.addEventListener('change', validateDates);

  // Date minimale pour aujourd'hui
  const today = new Date().toISOString().split('T')[0];
  dateDebut.min = today;

  dateDebut.addEventListener('change', function() {
    dateFin.min = this.value;
  });

  // Gestion du formulaire
  form.addEventListener('submit', function(e) {
    const submitBtn = this.querySelector('.btn-primary');
    submitBtn.innerHTML = 'Création en cours...';
    submitBtn.style.opacity = '0.7';

    // Validation des champs requis
    let isValid = true;
    const requiredFields = this.querySelectorAll('[required]');

    requiredFields.forEach(field => {
      if (!field.value.trim()) {
        isValid = false;
        field.style.borderColor = '#e74c3c';
        field.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
      }
    });

    // Validation des dates
    if (!validateDates()) {
      isValid = false;
    }

    if (!isValid) {
      e.preventDefault();
      submitBtn.innerHTML = 'Créer le contrat';
      submitBtn.style.opacity = '1';

      if (!errorMessage.style.display || errorMessage.style.display === 'none') {
        errorMessage.innerHTML = 'Veuillez remplir tous les champs obligatoires.';
        errorMessage.style.display = 'block';
      }

      setTimeout(() => {
        errorMessage.style.display = 'none';
      }, 5000);
    }
  });

  // Animation au focus des inputs
  document.querySelectorAll('input, select, textarea').forEach(input => {
    input.addEventListener('focus', function() {
      this.parentElement.style.transform = 'translateY(-2px)';
    });

    input.addEventListener('blur', function() {
      this.parentElement.style.transform = 'translateY(0)';
    });
  });

  // Mise à jour automatique de la date de fin quand on sélectionne la date de début
  dateDebut.addEventListener('change', function() {
    if (this.value && !dateFin.value) {
      // Proposer une date de fin 1 an après la date de début
      const debut = new Date(this.value);
      debut.setFullYear(debut.getFullYear() + 1);
      dateFin.value = debut.toISOString().split('T')[0];
      validateDates();
    }
  });

  // Feedback visuel pour les selects
  document.querySelectorAll('select').forEach(select => {
    select.addEventListener('change', function() {
      if (this.value) {
        this.style.borderColor = '#27ae60';
        this.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
      }
    });
  });
</script>
</body>
</html>

