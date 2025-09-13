<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/navbars/navbarAdmin.jsp" />
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un utilisateur - Gestion Locative</title>
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
            max-width: 600px;
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
        input[type="email"],
        input[type="password"],
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
        input[type="email"]:focus,
        input[type="password"]:focus,
        select:focus {
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

        .role-selector {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 8px;
        }

        .role-option {
            position: relative;
        }

        .role-option input[type="radio"] {
            position: absolute;
            opacity: 0;
            width: 0;
            height: 0;
        }

        .role-label {
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

        .role-option input[type="radio"]:checked + .role-label {
            border-color: #2a5298;
            background: rgba(42, 82, 152, 0.1);
            color: #1e3c72;
        }

        .role-label:hover {
            border-color: #2a5298;
            transform: translateY(-1px);
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

            .role-selector {
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
        <a href="${pageContext.request.contextPath}/utilisateur?action=list">👥 Utilisateurs</a>
        <span>→</span>
        <span>Ajouter</span>
    </div>

    <div class="page-header">
        <h1 class="page-title">Nouvel Utilisateur</h1>
        <p class="page-subtitle">Créer un compte utilisateur dans le système</p>
    </div>

    <div class="form-container">
        <div class="form-icon">
            <span>👤</span>
        </div>

        <h3>Informations du compte</h3>

        <div id="success-message" class="success-message"></div>
        <div id="error-message" class="error-message"></div>

        <form action="?action=save" method="post" id="userForm">
            <div class="form-row">
                <div class="form-group">
                    <label for="nom">Nom <span class="required">*</span></label>
                    <input type="text" id="nom" name="nom" placeholder="Nom de famille" required>
                </div>

                <div class="form-group">
                    <label for="prenom">Prénom <span class="required">*</span></label>
                    <input type="text" id="prenom" name="prenom" placeholder="Prénom" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Adresse email <span class="required">*</span></label>
                <input type="email" id="email" name="email" placeholder="utilisateur@example.com" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="telephone">Téléphone</label>
                    <input type="text" id="telephone" name="telephone" placeholder="+33 1 23 45 67 89">
                </div>

                <div class="form-group">
                    <label for="password">Mot de passe <span class="required">*</span></label>
                    <input type="password" id="password" name="password" placeholder="••••••••" required>
                </div>
            </div>

            <div class="form-group">
                <label>Rôle utilisateur <span class="required">*</span></label>
                <div class="role-selector">
                    <div class="role-option">
                        <input type="radio" id="admin" name="role" value="ADMIN" required>
                        <label for="admin" class="role-label">
                            🛡️<br>ADMIN
                        </label>
                    </div>
                    <div class="role-option">
                        <input type="radio" id="proprietaire" name="role" value="PROPRIETAIRE" required>
                        <label for="proprietaire" class="role-label">
                            🏢<br>PROPRIÉTAIRE
                        </label>
                    </div>
                    <div class="role-option">
                        <input type="radio" id="locataire" name="role" value="LOCATAIRE" required>
                        <label for="locataire" class="role-label">
                            🏠<br>LOCATAIRE
                        </label>
                    </div>
                </div>
            </div>

            <div class="btn-container">
                <button type="button" class="btn-secondary" onclick="history.back()">
                    Annuler
                </button>
                <button type="submit" class="btn-primary">
                    Créer l'utilisateur
                </button>
            </div>
        </form>
    </div>
</div>

<script>
    // Validation en temps réel
    const form = document.getElementById('userForm');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const successMessage = document.getElementById('success-message');
    const errorMessage = document.getElementById('error-message');

    // Validation email
    emailInput.addEventListener('input', function() {
        const email = this.value;
        const isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);

        if (email && !isValid) {
            this.style.borderColor = '#e74c3c';
            this.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
        } else if (isValid) {
            this.style.borderColor = '#27ae60';
            this.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
        } else {
            this.style.borderColor = '#e1e8ed';
            this.style.boxShadow = 'none';
        }
    });

    // Validation mot de passe
    passwordInput.addEventListener('input', function() {
        const password = this.value;
        const isStrong = password.length >= 6;

        if (password && !isStrong) {
            this.style.borderColor = '#f39c12';
            this.style.boxShadow = '0 0 0 4px rgba(243, 156, 18, 0.1)';
        } else if (isStrong) {
            this.style.borderColor = '#27ae60';
            this.style.boxShadow = '0 0 0 4px rgba(39, 174, 96, 0.1)';
        } else {
            this.style.borderColor = '#e1e8ed';
            this.style.boxShadow = 'none';
        }
    });

    // Gestion du formulaire
    form.addEventListener('submit', function(e) {
        const submitBtn = this.querySelector('.btn-primary');
        submitBtn.innerHTML = 'Création en cours...';
        submitBtn.style.opacity = '0.7';

        // Validation des champs requis
        const requiredFields = this.querySelectorAll('[required]');
        let isValid = true;

        requiredFields.forEach(field => {
            if (!field.value.trim() && field.type !== 'radio') {
                isValid = false;
                field.style.borderColor = '#e74c3c';
                field.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
            }
        });

        // Vérifier qu'un rôle est sélectionné
        const roleSelected = this.querySelector('input[name="role"]:checked');
        if (!roleSelected) {
            isValid = false;
            errorMessage.innerHTML = 'Veuillez sélectionner un rôle utilisateur.';
            errorMessage.style.display = 'block';
        }

        if (!isValid) {
            e.preventDefault();
            submitBtn.innerHTML = 'Créer l\'utilisateur';
            submitBtn.style.opacity = '1';

            setTimeout(() => {
                errorMessage.style.display = 'none';
            }, 5000);
        }
    });

    // Animation au focus des inputs
    document.querySelectorAll('input, select').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateY(-2px)';
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateY(0)';
        });
    });
</script>
</body>
</html>