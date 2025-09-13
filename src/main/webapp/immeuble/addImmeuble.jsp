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
  <title>Ajouter un Immeuble - Gestion Locative</title>
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
    input[type="number"],
    input[type="file"],
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
    input[type="number"]:focus,
    input[type="file"]:focus,
    select:focus,
    textarea:focus {
      outline: none;
      border-color: #2a5298;
      background: rgba(255, 255, 255, 1);
      box-shadow: 0 0 0 4px rgba(42, 82, 152, 0.1);
      transform: translateY(-1px);
    }

    textarea {
      resize: vertical;
      min-height: 100px;
    }

    select {
      cursor: pointer;
      appearance: none;
      background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='M6 8l4 4 4-4'/%3e%3c/svg%3e");
      background-position: right 12px center;
      background-repeat: no-repeat;
      background-size: 16px;
    }

    input[type="file"] {
      padding: 12px 16px;
      border: 2px dashed #e1e8ed;
      background: rgba(248, 249, 250, 0.5);
      cursor: pointer;
    }

    input[type="file"]:hover {
      border-color: #2a5298;
      background: rgba(42, 82, 152, 0.05);
    }

    .file-upload-wrapper {
      position: relative;
    }

    .file-upload-icon {
      position: absolute;
      right: 16px;
      top: 50%;
      transform: translateY(-50%);
      color: #666;
      font-size: 1.2rem;
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
    .form-group:nth-child(6) { animation-delay: 0.6s; }
    .form-group:nth-child(7) { animation-delay: 0.7s; }
    .form-group:nth-child(8) { animation-delay: 0.8s; }

    @keyframes fadeInUp {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>
<body>
<div class="main-content">
  <div class="breadcrumb">
    <a href="${pageContext.request.contextPath}/immeuble?action=list">🏢 Immeubles</a>
    <span>→</span>
    <span>Ajouter</span>
  </div>

  <div class="page-header">
    <h1 class="page-title">Nouvel Immeuble</h1>
    <p class="page-subtitle">Ajouter une propriété immobilière au système</p>
  </div>

  <div class="form-container">
    <div class="form-icon">
      <span>🏢</span>
    </div>

    <h3>Informations de l'immeuble</h3>

    <div id="success-message" class="success-message"></div>
    <div id="error-message" class="error-message"></div>

    <form action="immeuble?action=save" method="post" enctype="multipart/form-data" id="immeubleForm">
      <div class="form-group">
        <label for="image">Image de l'immeuble</label>
        <div class="file-upload-wrapper">
          <input type="file" id="image" name="image" accept="image/*">
          <div class="file-upload-icon">📸</div>
        </div>
      </div>

      <div class="form-row">
        <div class="form-group">
          <label for="nom">Nom <span class="required">*</span></label>
          <input type="text" id="nom" name="nom" placeholder="Nom de l'immeuble" required>
        </div>

        <div class="form-group">
          <label for="nombreEtages">Nombre d'étages <span class="required">*</span></label>
          <input type="number" id="nombreEtages" name="nombreEtages" placeholder="Ex: 5" required min="1">
        </div>
      </div>

      <div class="form-group">
        <label for="adresse">Adresse <span class="required">*</span></label>
        <input type="text" id="adresse" name="adresse" placeholder="Adresse complète" required>
      </div>

      <div class="form-group">
        <label for="description">Description</label>
        <textarea id="description" name="description" placeholder="Description de l'immeuble..."></textarea>
      </div>

      <div class="form-group">
        <label for="equipements">Équipements (séparés par des virgules)</label>
        <input type="text" id="equipements" name="equipements" placeholder="Ex: Ascenseur, Parking, Sécurité, Balcon">
      </div>

      <!-- Champ propriétaire seulement pour l'admin -->
      <c:if test="${sessionScope.user.role eq 'ADMIN'}">
        <div class="form-group">
          <label for="proprietaire">Propriétaire <span class="required">*</span></label>
          <select id="proprietaire" name="proprietaireId" required>
            <option value="" disabled selected>-- Sélectionner un propriétaire --</option>
            <c:forEach items="${proprietaires}" var="p">
              <option value="${p.id}">${p.prenom} ${p.nom}</option>
            </c:forEach>
          </select>
        </div>
      </c:if>

      <div class="btn-container">
        <button type="button" class="btn-secondary" onclick="history.back()">
          Annuler
        </button>
        <button type="submit" class="btn-primary">
          Créer l'immeuble
        </button>
      </div>
    </form>
  </div>
</div>

<script>
  const form = document.getElementById('immeubleForm');
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

  // Validation du nombre d'étages
  document.getElementById('nombreEtages').addEventListener('input', function() {
    const value = parseInt(this.value);
    if (value && value > 0) {
      this.style.borderColor = '#27ae60';
      this.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
    } else if (this.value) {
      this.style.borderColor = '#e74c3c';
      this.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
    }
  });

  // Gestion du fichier image
  document.getElementById('image').addEventListener('change', function() {
    const file = this.files[0];
    if (file) {
      if (file.type.startsWith('image/')) {
        this.style.borderColor = '#27ae60';
        this.style.background = 'rgba(39, 174, 96, 0.05)';
      } else {
        this.style.borderColor = '#e74c3c';
        this.style.background = 'rgba(231, 76, 60, 0.05)';
        errorMessage.innerHTML = 'Veuillez sélectionner un fichier image valide.';
        errorMessage.style.display = 'block';
        setTimeout(() => {
          errorMessage.style.display = 'none';
        }, 3000);
      }
    }
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

    // Validation spécifique pour le nombre d'étages
    const nombreEtages = document.getElementById('nombreEtages').value;
    if (nombreEtages && parseInt(nombreEtages) <= 0) {
      isValid = false;
      document.getElementById('nombreEtages').style.borderColor = '#e74c3c';
      errorMessage.innerHTML = 'Le nombre d\'étages doit être supérieur à 0.';
      errorMessage.style.display = 'block';
    }

    if (!isValid) {
      e.preventDefault();
      submitBtn.innerHTML = 'Créer l\'immeuble';
      submitBtn.style.opacity = '1';

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

  // Prévisualisation des équipements
  document.getElementById('equipements').addEventListener('input', function() {
    const equipements = this.value.split(',').map(e => e.trim()).filter(e => e);
    if (equipements.length > 0) {
      this.style.borderColor = '#2a5298';
      this.style.boxShadow = '0 0 0 4px rgba(42, 82, 152, 0.1)';
    }
  });
</script>
</body>
</html>