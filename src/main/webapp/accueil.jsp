<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion Locative - Plateforme Professionnelle</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* Hero Section */
        .hero {
            height: 100vh;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.1)" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid)"/></svg>');
            animation: float 20s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
        }

        .nav {
            position: fixed;
            top: 0;
            width: 100%;
            padding: 20px 5%;
            background: rgba(30, 60, 114, 0.1);
            backdrop-filter: blur(10px);
            z-index: 1000;
            transition: all 0.3s ease;
        }

        .nav-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: white;
            text-decoration: none;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 30px;
        }

        .nav-links a {
            color: white;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #ffd700;
        }

        .hero-content {
            text-align: center;
            z-index: 2;
            max-width: 800px;
            padding: 0 20px;
        }

        .hero h1 {
            font-size: 3.5rem;
            margin-bottom: 20px;
            opacity: 0;
            animation: fadeInUp 1s ease 0.5s forwards;
        }

        .hero p {
            font-size: 1.3rem;
            margin-bottom: 40px;
            opacity: 0;
            animation: fadeInUp 1s ease 0.8s forwards;
        }

        .cta-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
            opacity: 0;
            animation: fadeInUp 1s ease 1.1s forwards;
        }

        .btn {
            padding: 15px 30px;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-block;
        }

        .btn-primary {
            background: linear-gradient(45deg, #ffd700, #ffed4e);
            color: #1e3c72;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            font-weight: 600;
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            border: 2px solid rgba(255, 255, 255, 0.5);
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Features Section */
        .features {
            padding: 100px 5%;
            background: #f8f9fa;
            position: relative;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }

        .section-title h2 {
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 20px;
        }

        .section-title p {
            font-size: 1.2rem;
            color: #666;
            max-width: 600px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 40px;
            margin-top: 60px;
        }

        .feature-card {
            background: white;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

        .feature-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s;
        }

        .feature-card:hover::before {
            left: 100%;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: white;
        }

        .feature-card h3 {
            font-size: 1.5rem;
            color: #333;
            margin-bottom: 15px;
        }

        .feature-card p {
            color: #666;
            line-height: 1.8;
        }

        /* Stats Section */
        .stats {
            padding: 80px 5%;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            color: white;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 40px;
            text-align: center;
        }

        .stat-item h3 {
            font-size: 3rem;
            margin-bottom: 10px;
            background: linear-gradient(45deg, #ffd700, #ffed4e);
            background-clip: text;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .stat-item p {
            font-size: 1.1rem;
            opacity: 0.9;
        }

        /* Footer */
        .footer {
            background: #1a1a1a;
            color: white;
            padding: 60px 5% 30px;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
        }

        .footer-section h3 {
            margin-bottom: 20px;
            color: #ffd700;
        }

        .footer-section p, .footer-section a {
            color: #ccc;
            text-decoration: none;
            line-height: 1.8;
        }

        .footer-section a:hover {
            color: #ffd700;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #333;
            color: #888;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .hero p {
                font-size: 1.1rem;
            }

            .cta-buttons {
                flex-direction: column;
                align-items: center;
            }

            .nav-links {
                display: none;
            }
        }

        /* Floating elements */
        .floating-shapes {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .shape {
            position: absolute;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
        }

        .shape1 {
            width: 100px;
            height: 100px;
            top: 20%;
            left: 10%;
            animation: floatShape 15s ease-in-out infinite;
        }

        .shape2 {
            width: 150px;
            height: 150px;
            top: 60%;
            right: 10%;
            animation: floatShape 20s ease-in-out infinite reverse;
        }

        .shape3 {
            width: 80px;
            height: 80px;
            bottom: 20%;
            left: 20%;
            animation: floatShape 12s ease-in-out infinite;
        }

        @keyframes floatShape {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-30px) rotate(180deg); }
        }
    </style>
</head>
<body>
<!-- Navigation -->
<nav class="nav">
    <div class="nav-content">
        <a href="${pageContext.request.contextPath}/" class="logo">🏢 Gestion Locative</a>
        <ul class="nav-links">
            <li><a href="#accueil">Accueil</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#modules">Modules</a></li>
            <li><a href="#contact">Contact</a></li>
            <li><a href="${pageContext.request.contextPath}/login">Connexion</a></li>
        </ul>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero" id="accueil">
    <div class="floating-shapes">
        <div class="shape shape1"></div>
        <div class="shape shape2"></div>
        <div class="shape shape3"></div>
    </div>
    <div class="hero-content">
        <h1>Gestion Locative Professionnelle</h1>
        <p>Simplifiez la gestion de vos biens immobiliers avec notre plateforme moderne et intuitive. Gérez vos immeubles, unités, locataires et contrats en un seul endroit.</p>
        <div class="cta-buttons">
            <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Commencer Maintenant</a>
            <a href="#services" class="btn btn-secondary">Découvrir nos Services</a>
        </div>
    </div>
</section>

<!-- Features Section -->
<section class="features" id="services">
    <div class="container">
        <div class="section-title">
            <h2>Pourquoi Choisir Notre Solution ?</h2>
            <p>Notre plateforme offre tous les outils nécessaires pour une gestion locative efficace et rentable</p>
        </div>
        <div class="features-grid" id="modules">
            <div class="feature-card">
                <div class="feature-icon">🏢</div>
                <h3>Gestion des Immeubles</h3>
                <p>Gérez facilement tous vos immeubles avec des fiches détaillées, photos, et historique complet des interventions et réparations.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">🚪</div>
                <h3>Gestion des Unités</h3>
                <p>Organisez et suivez chaque unité locative avec des informations détaillées sur les équipements et l'état des lieux.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">👥</div>
                <h3>Suivi des Locataires</h3>
                <p>Maintenez un dossier complet de chaque locataire, suivez les paiements de loyers et gérez les contrats de bail numériquement.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📋</div>
                <h3>Gestion des Contrats</h3>
                <p>Créez, modifiez et suivez tous vos contrats de location avec des alertes automatiques pour les échéances importantes.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">💳</div>
                <h3>Suivi des Paiements</h3>
                <p>Automatisez le suivi des loyers, charges et dépôts. Générez des reçus et relances automatiquement.</p>
            </div>
            <div class="feature-card">
                <div class="feature-icon">📝</div>
                <h3>Gestion des Demandes</h3>
                <p>Centralisez toutes les demandes de vos locataires et suivez leur traitement jusqu'à leur résolution complète.</p>
            </div>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="stats">
    <div class="container">
        <div class="stats-grid">
            <div class="stat-item">
                <h3>500+</h3>
                <p>Immeubles Gérés</p>
            </div>
            <div class="stat-item">
                <h3>1200+</h3>
                <p>Unités Locatives</p>
            </div>
            <div class="stat-item">
                <h3>850+</h3>
                <p>Locataires Actifs</p>
            </div>
            <div class="stat-item">
                <h3>24/7</h3>
                <p>Support Disponible</p>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer" id="contact">
    <div class="footer-content">
        <div class="footer-section">
            <h3>Gestion Locative</h3>
            <p>La solution complète pour la gestion immobilière moderne. Simplifiez votre quotidien et maximisez vos revenus.</p>
        </div>
        <div class="footer-section">
            <h3>Services</h3>
            <p><a href="${pageContext.request.contextPath}/immeuble?action=list">Gestion Immeubles</a></p>
            <p><a href="${pageContext.request.contextPath}/unite?action=list">Gestion Unités</a></p>
            <p><a href="${pageContext.request.contextPath}/locataire?action=list">Suivi Locataires</a></p>
            <p><a href="${pageContext.request.contextPath}/contrat?action=list">Gestion Contrats</a></p>
        </div>
        <div class="footer-section">
            <h3>Support</h3>
            <p><a href="#">Centre d'Aide</a></p>
            <p><a href="#">Documentation</a></p>
            <p><a href="#">Tutoriels</a></p>
            <p><a href="#">Contact</a></p>
        </div>
        <div class="footer-section">
            <h3>Contact</h3>
            <p>Email: contact@gestion-locative.fr</p>
            <p>Téléphone: +33 1 23 45 67 89</p>
            <p>Adresse: 123 Rue de la Gestion<br>75001 Paris, France</p>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 Gestion Locative. Tous droits réservés.</p>
    </div>
</footer>

<script>
    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Navbar background on scroll
    window.addEventListener('scroll', function() {
        const nav = document.querySelector('.nav');
        if (window.scrollY > 100) {
            nav.style.background = 'rgba(30, 60, 114, 0.95)';
            nav.style.color = '#fff';
            nav.querySelectorAll('a').forEach(link => {
                link.style.color = '#fff';
            });
        } else {
            nav.style.background = 'rgba(30, 60, 114, 0.1)';
            nav.querySelectorAll('a').forEach(link => {
                link.style.color = 'white';
            });
        }
    });

    // Counter animation for stats
    function animateCounters() {
        const counters = document.querySelectorAll('.stat-item h3');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const counter = entry.target;
                    const target = parseInt(counter.innerText.replace(/\D/g, ''));
                    const suffix = counter.innerText.replace(/[0-9]/g, '');
                    let current = 0;
                    const increment = target / 100;
                    const timer = setInterval(() => {
                        current += increment;
                        if (current >= target) {
                            current = target;
                            clearInterval(timer);
                        }
                        counter.innerText = Math.floor(current) + suffix;
                    }, 20);
                    observer.unobserve(counter);
                }
            });
        });

        counters.forEach(counter => observer.observe(counter));
    }

    // Initialize animations when page loads
    document.addEventListener('DOMContentLoaded', animateCounters);

    // Add hover effects to feature cards
    document.querySelectorAll('.feature-card').forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });

        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
</script>
</body>
</html>