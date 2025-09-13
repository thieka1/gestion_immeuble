<<<<<<< HEAD
<%--
  Created by IntelliJ IDEA.
  User: sowth
  Date: 23/08/2025
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <div class="form-container">
        <h3>Ajouter un locataire</h3>
        <form action="?action=save" method="post">

            <label for="profession">Profession :</label>
            <input type="text" id="profession" name="profession" placeholder="Profession" required>

            <label for="adresse">Adresse :</label>
            <input type="text" id="adresse" name="adresse" placeholder="Adresse" required>

            <label for="id_utilisateur">Utilisateur associé :</label>
            <select id="id_utilisateur" name="id_utilisateur" required>
                <option value="" disabled selected>Sélectionner</option>
                <c:forEach items="${utilisateurs}" var="u">
                    <option value="${u.id}">${u.prenom} ${u.nom}</option>
                </c:forEach>
            </select>

            <button type="submit">Ajouter</button>
        </form>
    </div>
</head>
<body>

</body>
</html>
=======
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.userRole eq 'ADMIN'}">
        <jsp:include page="/navbars/navbarAdmin.jsp"/>
    </c:when>
    <c:when test="${sessionScope.userRole eq 'PROPRIETAIRE'}">
        <jsp:include page="/navbars/navbarProprietaire.jsp"/>
    </c:when>
</c:choose>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter une Unité de Location - Gestion Locative</title>
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

        h2 {
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
        select {
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
        select:focus {
            outline: none;
            border-color: #2a5298;
            background: rgba(255, 255, 255, 1);
            box-shadow: 0 0 0 4px rgba(42, 82, 152, 0.1);
            transform: translateY(-1px);
        }

        input[readonly] {
            background: rgba(248, 249, 250, 0.8);
            cursor: not-allowed;
        }

        input[readonly]:focus {
            border-color: #e1e8ed;
            box-shadow: none;
            transform: none;
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

        .status-selector {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-top: 8px;
        }

        .status-option {
            position: relative;
        }

        .status-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .status-label {
            display: block;
            padding: 12px 16px;
            border: 2px solid #e1e8ed;
            border-radius: 12px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            font-weight: 500;
            font-size: 13px;
        }

        .status-option input[type="radio"]:checked + .status-label {
            border-color: #2a5298;
            background: rgba(42, 82, 152, 0.1);
            color: #1e3c72;
        }

        .status-label:hover {
            border-color: #2a5298;
            transform: translateY(-1px);
        }

        .auto-generated {
            position: relative;
        }

        .auto-generated::after {
            content: '🔄';
            position: absolute;
            right: 16px;
            top: 50%;
            transform: translateY(-50%);
            font-size: 1.1rem;
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

            .status-selector {
                grid-template-columns: 1fr;
                gap: 10px;
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
        <a href="${pageContext.request.contextPath}/unite?action=list">🏠 Unités</a>
        <span>→</span>
        <span>Ajouter</span>
    </div>

    <div class="page-header">
        <h1 class="page-title">Nouvelle Unité de Location</h1>
        <p class="page-subtitle">Créer une nouvelle unité locative dans un immeuble</p>
    </div>

    <div class="form-container">
        <div class="form-icon">
            <span>🏠</span>
        </div>

        <h2>Informations de l'unité</h2>

        <div id="success-message" class="success-message"></div>
        <div id="error-message" class="error-message"></div>

        <form action="unite?action=save" method="post" enctype="multipart/form-data" id="uniteForm">
            <div class="form-group">
                <label for="immeubleId">Immeuble <span class="required">*</span></label>
                <select id="immeubleId" name="immeubleId" required onchange="updateNumero()">
                    <option value="" disabled selected>-- Sélectionner un immeuble --</option>
                    <c:forEach items="${immeubles}" var="im">
                        <option value="${im.id}">${im.nom} (${im.adresse})</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="numero">Numéro <span class="required">*</span></label>
                    <input type="text" id="numero" name="numero" placeholder="Ex: A001" readonly required class="auto-generated">
                </div>

                <div class="form-group">
                    <label for="nombrePieces">Nombre de pièces <span class="required">*</span></label>
                    <input type="number" id="nombrePieces" name="nombrePieces" placeholder="Ex: 3" required min="1">
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="superficie">Superficie (m²) <span class="required">*</span></label>
                    <input type="number" id="superficie" name="superficie" step="0.01" placeholder="Ex: 75.5" required min="0.1">
                </div>

                <div class="form-group">
                    <label for="loyerMensuel">Loyer mensuel (€) <span class="required">*</span></label>
                    <input type="number" id="loyerMensuel" name="loyerMensuel" step="0.01" placeholder="Ex: 500" required min="0.01">
                </div>
            </div>

            <div class="form-group">
                <label>Statut <span class="required">*</span></label>
                <div class="status-selector">
                    <div class="status-option">
                        <input type="radio" id="disponible" name="statut" value="DISPONIBLE" required>
                        <label for="disponible" class="status-label">
                            ✅<br>DISPONIBLE
                        </label>
                    </div>
                    <div class="status-option">
                        <input type="radio" id="loue" name="statut" value="LOUE" required>
                        <label for="loue" class="status-label">
                            🔒<br>LOUÉE
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="image">Image de l'unité</label>
                <input type="file" id="image" name="image" accept="image/*">
            </div>

            <div class="btn-container">
                <button type="button" class="btn-secondary" onclick="history.back()">
                    Annuler
                </button>
                <button type="submit" class="btn-primary">
                    Créer l'unité
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    const form = document.getElementById('uniteForm');
    const successMessage = document.getElementById('success-message');
    const errorMessage = document.getElementById('error-message');

    // Fonction pour mettre à jour le numéro automatiquement
    function updateNumero() {
        var immeubleSelect = document.getElementById("immeubleId");
        var numeroInput = document.getElementById("numero");

        var immeubleId = immeubleSelect.value;
        if(!immeubleId) {
            numeroInput.value = "";
            return;
        }

        // AJAX call pour récupérer le prochain numéro
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "unite?action=nextNumero&immeubleId=" + immeubleId, true);
        xhr.onreadystatechange = function() {
            if(xhr.readyState === 4 && xhr.status === 200) {
                numeroInput.value = xhr.responseText;
                numeroInput.style.borderColor = '#27ae60';
                numeroInput.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
            }
        };
        xhr.send();
    }

    // Validation en temps réel pour les champs obligatoires
    const requiredInputs = form.querySelectorAll('[required]');

    requiredInputs.forEach(input => {
        input.addEventListener('input', function() {
            if (this.type === 'radio') return; // Skip radio buttons

            if (this.value.trim()) {
                this.style.borderColor = '#27ae60';
                this.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
            } else {
                this.style.borderColor = '#e1e8ed';
                this.style.boxShadow = 'none';
            }
        });

        input.addEventListener('blur', function() {
            if (this.type === 'radio') return; // Skip radio buttons

            if (this.value.trim() === '') {
                this.style.borderColor = '#e74c3c';
                this.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
            }
        });
    });

    // Validation des nombres
    ['nombrePieces', 'superficie', 'loyerMensuel'].forEach(id => {
        const input = document.getElementById(id);
        input.addEventListener('input', function() {
            const value = parseFloat(this.value);
            const min = parseFloat(this.min);

            if (value && value >= min) {
                this.style.borderColor = '#27ae60';
                this.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
            } else if (this.value) {
                this.style.borderColor = '#e74c3c';
                this.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
            }
        });
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
            if (field.type === 'radio') {
                const radioGroup = this.querySelector(`input[name="${field.name}"]:checked`);
                if (!radioGroup) {
                    isValid = false;
                }
            } else if (!field.value.trim()) {
                isValid = false;
                field.style.borderColor = '#e74c3c';
                field.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
            }
        });

        // Validation spécifique pour les nombres
        const nombrePieces = document.getElementById('nombrePieces').value;
        const superficie = document.getElementById('superficie').value;
        const loyerMensuel = document.getElementById('loyerMensuel').value;

        if (nombrePieces && parseInt(nombrePieces) <= 0) {
            isValid = false;
            errorMessage.innerHTML = 'Le nombre de pièces doit être supérieur à 0.';
            errorMessage.style.display = 'block';
        }

        if (superficie && parseFloat(superficie) <= 0) {
            isValid = false;
            errorMessage.innerHTML = 'La superficie doit être supérieure à 0.';
            errorMessage.style.display = 'block';
        }

        if (loyerMensuel && parseFloat(loyerMensuel) <= 0) {
            isValid = false;
            errorMessage.innerHTML = 'Le loyer mensuel doit être supérieur à 0.';
            errorMessage.style.display = 'block';
        }

        // Vérifier qu'un statut est sélectionné
        const statutSelected = this.querySelector('input[name="statut"]:checked');
        if (!statutSelected) {
            isValid = false;
            errorMessage.innerHTML = 'Veuillez sélectionner un statut pour l\'unité.';
            errorMessage.style.display = 'block';
        }

        if (!isValid) {
            e.preventDefault();
            submitBtn.innerHTML = 'Créer l\'unité';
            submitBtn.style.opacity = '1';

            setTimeout(() => {
                errorMessage.style.display = 'none';
            }, 5000);
        }
    });

    // Animation au focus des inputs
    document.querySelectorAll('input, select').forEach(input => {
        input.addEventListener('focus', function() {
            if (!this.readOnly) {
                this.parentElement.style.transform = 'translateY(-2px)';
            }
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateY(0)';
        });
    });
</script>
</body>
</html>
>>>>>>> 0249102 (design de l'application)
