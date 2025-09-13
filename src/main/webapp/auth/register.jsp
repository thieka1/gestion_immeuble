<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<html>
<head>
    <title>Inscription</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #f5f6fa;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .register-box {
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 400px;
        }
        h2 {
            margin-bottom: 20px;
            text-align: center;
            color: #2c3e50;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: 500;
            display: block;
            margin-bottom: 6px;
        }
        input {
            width: 100%;
            padding: 10px;
            border: 1px solid #dcdde1;
            border-radius: 5px;
            font-size: 14px;
        }
        .btn {
            background: #3498db;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 15px;
            font-weight: bold;
        }
        .btn:hover {
            background: #2980b9;
        }
        .error {
            color: red;
            text-align: center;
            margin-bottom: 15px;
        }
        .login-link {
            margin-top: 15px;
            text-align: center;
            font-size: 14px;
        }
        .login-link a {
            color: #3498db;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="register-box">
    <h2>Créer un compte</h2>

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>

    <form action="register" method="post">
        <h3>Informations personnelles</h3>
        <div class="form-group">
            <label>Nom</label>
            <input type="text" name="nom" required>
        </div>
        <div class="form-group">
            <label>Prénom</label>
            <input type="text" name="prenom" required>
        </div>
        <div class="form-group">
            <label>Email</label>
            <input type="email" name="email" required>
        </div>
        <div class="form-group">
            <label>Téléphone</label>
            <input type="text" name="telephone">
        </div>
        <div class="form-group">
            <label>Mot de passe</label>
            <input type="password" name="password" required>
        </div>

        <h3>Informations locataire</h3>
        <div class="form-group">
            <label>Adresse</label>
            <input type="text" name="adresse" required>
        </div>
        <div class="form-group">
            <label>Profession</label>
            <input type="text" name="profession" required>
        </div>

        <button type="submit" class="btn">S'inscrire</button>
    </form>

    <div class="login-link">
        Déjà un compte ? <a href="login">Se connecter</a>
    </div>
</div>
</body>
</html>
=======
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - Gestion Locative</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow-x: hidden;
            padding: 20px 0;
        }

        /* Background animations */
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            animation: float 20s ease-in-out infinite;
            z-index: 0;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        /* Floating shapes */
        .floating-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 50%;
        }

        .shape1 {
            width: 120px;
            height: 120px;
            top: 10%;
            left: 10%;
            animation: floatShape 18s ease-in-out infinite;
        }

        .shape2 {
            width: 180px;
            height: 180px;
            bottom: 15%;
            right: 10%;
            animation: floatShape 25s ease-in-out infinite reverse;
        }

        .shape3 {
            width: 90px;
            height: 90px;
            top: 55%;
            left: 5%;
            animation: floatShape 15s ease-in-out infinite;
        }

        .shape4 {
            width: 140px;
            height: 140px;
            top: 20%;
            right: 20%;
            animation: floatShape 22s ease-in-out infinite;
        }

        @keyframes floatShape {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-40px) rotate(180deg); }
        }

        .register-container {
            position: relative;
            z-index: 10;
            width: 100%;
            max-width: 500px;
            padding: 20px;
        }

        .register-box {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(20px);
            padding: 40px;
            border-radius: 24px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            position: relative;
            overflow: hidden;
        }

        .register-box::before {
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

        .logo-section {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo-icon {
            font-size: 3rem;
            margin-bottom: 10px;
            display: block;
        }

        .logo-text {
            font-size: 24px;
            font-weight: 700;
            color: #1e3c72;
            margin-bottom: 8px;
        }

        .logo-subtitle {
            font-size: 14px;
            color: #666;
            font-weight: 400;
        }

        h2 {
            font-size: 28px;
            font-weight: 600;
            color: #1e3c72;
            text-align: center;
            margin-bottom: 8px;
        }

        .subtitle {
            text-align: center;
            color: #666;
            font-size: 14px;
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 16px;
            font-weight: 600;
            color: #1e3c72;
            margin: 25px 0 15px 0;
            padding-bottom: 8px;
            border-bottom: 2px solid #f0f2f5;
            position: relative;
        }

        .section-title::before {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 40px;
            height: 2px;
            background: linear-gradient(90deg, #1e3c72, #2a5298);
        }

        .section-title:first-of-type {
            margin-top: 0;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            font-weight: 500;
            color: #1e3c72;
            display: block;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .input-wrapper {
            position: relative;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e1e8ed;
            border-radius: 12px;
            font-size: 14px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
            font-family: 'Inter', sans-serif;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: #2a5298;
            background: rgba(255, 255, 255, 1);
            box-shadow: 0 0 0 4px rgba(42, 82, 152, 0.1);
        }

        .btn {
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: #fff;
            border: none;
            padding: 16px;
            border-radius: 12px;
            cursor: pointer;
            width: 100%;
            font-size: 15px;
            font-weight: 600;
            font-family: 'Inter', sans-serif;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            margin-top: 10px;
        }

        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .btn:hover::before {
            left: 100%;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(30, 60, 114, 0.3);
        }

        .btn:active {
            transform: translateY(0);
        }

        .error {
            background: rgba(231, 76, 60, 0.1);
            color: #e74c3c;
            padding: 12px 16px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 20px;
            font-size: 14px;
            border: 1px solid rgba(231, 76, 60, 0.2);
        }

        .login-link {
            margin-top: 24px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .login-link a {
            color: #2a5298;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .login-link a:hover {
            color: #1e3c72;
            text-decoration: underline;
        }

        .divider {
            margin: 24px 0;
            text-align: center;
            position: relative;
            color: #999;
            font-size: 13px;
        }

        .divider::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 0;
            right: 0;
            height: 1px;
            background: #e1e8ed;
            z-index: 0;
        }

        .divider span {
            background: rgba(255, 255, 255, 0.95);
            padding: 0 16px;
            position: relative;
            z-index: 1;
        }

        .back-home {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 20;
        }

        .back-home a {
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-size: 14px;
            padding: 8px 16px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .back-home a:hover {
            background: rgba(255, 255, 255, 0.2);
            color: white;
        }

        .progress-indicator {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
            gap: 8px;
        }

        .progress-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #e1e8ed;
            transition: all 0.3s ease;
        }

        .progress-dot.active {
            background: #2a5298;
            transform: scale(1.2);
        }

        /* Responsive */
        @media (max-width: 600px) {
            .register-container {
                padding: 15px;
            }

            .register-box {
                padding: 30px 25px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            h2 {
                font-size: 24px;
            }

            .back-home {
                position: relative;
                top: auto;
                left: auto;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
<div class="floating-shapes">
    <div class="shape shape1"></div>
    <div class="shape shape2"></div>
    <div class="shape shape3"></div>
    <div class="shape shape4"></div>
</div>

<div class="back-home">
    <a href="${pageContext.request.contextPath}/">
        <span>←</span> Retour à l'accueil
    </a>
</div>

<div class="register-container">
    <div class="register-box">
        <div class="logo-section">
            <span class="logo-icon">🏢</span>
            <div class="logo-text">Gestion Locative</div>
            <div class="logo-subtitle">Plateforme Professionnelle</div>
        </div>

        <h2>Créer un compte</h2>
        <p class="subtitle">Rejoignez notre plateforme de gestion</p>

        <div class="progress-indicator">
            <div class="progress-dot active"></div>
            <div class="progress-dot active"></div>
            <div class="progress-dot"></div>
        </div>

        <c:if test="${not empty error}">
            <div class="error">
                <strong>Erreur :</strong> ${error}
            </div>
        </c:if>

        <form action="register" method="post">
            <h3 class="section-title">👤 Informations personnelles</h3>

            <div class="form-row">
                <div class="form-group">
                    <label for="nom">Nom</label>
                    <div class="input-wrapper">
                        <input type="text" id="nom" name="nom" placeholder="Votre nom" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="prenom">Prénom</label>
                    <div class="input-wrapper">
                        <input type="text" id="prenom" name="prenom" placeholder="Votre prénom" required>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <div class="input-wrapper">
                    <input type="email" id="email" name="email" placeholder="votre@email.com" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="telephone">Téléphone</label>
                    <div class="input-wrapper">
                        <input type="text" id="telephone" name="telephone" placeholder="+33 1 23 45 67 89">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Mot de passe</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" placeholder="••••••••" required>
                    </div>
                </div>
            </div>

            <h3 class="section-title">🏠 Informations locataire</h3>

            <div class="form-group">
                <label for="adresse">Adresse complète</label>
                <div class="input-wrapper">
                    <input type="text" id="adresse" name="adresse" placeholder="123 Rue de la République, 75001 Paris" required>
                </div>
            </div>

            <div class="form-group">
                <label for="profession">Profession</label>
                <div class="input-wrapper">
                    <input type="text" id="profession" name="profession" placeholder="Ex: Ingénieur, Professeur..." required>
                </div>
            </div>

            <button type="submit" class="btn">
                Créer mon compte
            </button>
        </form>

        <div class="divider">
            <span>ou</span>
        </div>

        <div class="login-link">
            Déjà inscrit ? <a href="login">Se connecter</a>
        </div>
    </div>
</div>

<script>
    // Animation progressive des sections
    const sections = document.querySelectorAll('.section-title');
    const progressDots = document.querySelectorAll('.progress-dot');

    // Animation des champs lors du focus
    document.querySelectorAll('input').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'scale(1.02)';

            // Mise à jour des indicateurs de progression
            const section = this.closest('.section-title').nextElementSibling ?
                this.closest('.section-title') :
                document.querySelector('.section-title');

            const sectionIndex = Array.from(sections).indexOf(section);
            progressDots.forEach((dot, index) => {
                if (index <= sectionIndex) {
                    dot.classList.add('active');
                }
            });
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'scale(1)';
        });
    });

    // Validation en temps réel
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');

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

    passwordInput.addEventListener('input', function() {
        const password = this.value;
        const isStrong = password.length >= 8;

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

    // Animation du bouton de soumission
    document.querySelector('form').addEventListener('submit', function(e) {
        const btn = this.querySelector('.btn');
        btn.innerHTML = '<span style="opacity: 0.7;">Création en cours...</span>';
        btn.style.transform = 'scale(0.98)';

        // Validation côté client
        const requiredFields = this.querySelectorAll('[required]');
        let isValid = true;

        requiredFields.forEach(field => {
            if (!field.value.trim()) {
                isValid = false;
                field.style.borderColor = '#e74c3c';
                field.style.boxShadow = '0 0 0 4px rgba(231, 76, 60, 0.1)';
            }
        });

        if (!isValid) {
            e.preventDefault();
            btn.innerHTML = 'Créer mon compte';
            btn.style.transform = 'scale(1)';

            // Scroll vers le premier champ invalide
            const firstInvalid = this.querySelector('input[style*="border-color: rgb(231, 76, 60)"]');
            if (firstInvalid) {
                firstInvalid.scrollIntoView({ behavior: 'smooth', block: 'center' });
                firstInvalid.focus();
            }
        }
    });

    // Animation d'entrée des éléments
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    });

    document.querySelectorAll('.form-group, .section-title').forEach((el, index) => {
        el.style.opacity = '0';
        el.style.transform = 'translateY(20px)';
        el.style.transition = `opacity 0.6s ease ${index * 0.1}s, transform 0.6s ease ${index * 0.1}s`;
        observer.observe(el);
    });
</script>
</body>
</html>
>>>>>>> 0249102 (design de l'application)
