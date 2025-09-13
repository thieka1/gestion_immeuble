<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .sidebar {
        position: fixed;
        left: 0;
        top: 0;
        height: 100vh;
        width: 280px;
        background: linear-gradient(180deg, #1e3c72, #2a5298);
        box-shadow: 2px 0 10px rgba(0,0,0,0.1);
        z-index: 1000;
        overflow-y: auto;
    }

    .sidebar-header {
        padding: 25px 20px;
        border-bottom: 1px solid rgba(255,255,255,0.1);
    }

    .sidebar-header .logo {
        font-size: 24px;
        font-weight: bold;
        color: #fff;
        text-decoration: none;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .sidebar-header .logo::before {
        content: "🏢";
        font-size: 28px;
    }

    .sidebar-nav {
        padding: 20px 0;
    }

    .sidebar-nav .nav-section {
        margin-bottom: 30px;
    }

    .sidebar-nav .section-title {
        color: rgba(255,255,255,0.6);
        font-size: 12px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 1px;
        padding: 0 20px;
        margin-bottom: 15px;
    }

    .sidebar-nav .nav-item {
        display: block;
        color: rgba(255,255,255,0.9);
        text-decoration: none;
        padding: 12px 20px;
        margin: 2px 10px;
        border-radius: 8px;
        transition: all 0.3s ease;
        position: relative;
        font-weight: 500;
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .sidebar-nav .nav-item::before {
        font-size: 18px;
        width: 20px;
        text-align: center;
    }

    .sidebar-nav .nav-item[href*="utilisateur"]::before { content: "👥"; }
    .sidebar-nav .nav-item[href*="locataire"]::before { content: "🏠"; }
    .sidebar-nav .nav-item[href*="immeuble"]::before { content: "🏢"; }
    .sidebar-nav .nav-item[href*="unite"]::before { content: "🚪"; }
    .sidebar-nav .nav-item[href*="contrat"]::before { content: "📋"; }
    .sidebar-nav .nav-item[href*="paiement"]::before { content: "💳"; }
    .sidebar-nav .nav-item[href*="demande"]::before { content: "📝"; }

    .sidebar-nav .nav-item:hover {
        background: rgba(255,255,255,0.1);
        color: #ffd700;
        transform: translateX(5px);
    }

    .sidebar-nav .nav-item.active {
        background: rgba(255,215,0,0.2);
        color: #ffd700;
        border-left: 4px solid #ffd700;
    }

    .sidebar-footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        padding: 20px;
        border-top: 1px solid rgba(255,255,255,0.1);
    }

    .logout-btn {
        display: flex;
        align-items: center;
        gap: 10px;
        background: #e74c3c;
        color: white !important;
        padding: 12px 16px;
        border-radius: 8px;
        text-decoration: none;
        font-weight: 600;
        transition: all 0.3s ease;
        width: 100%;
        justify-content: center;
    }

    .logout-btn::before {
        content: "🚪";
        font-size: 16px;
    }

    .logout-btn:hover {
        background: #c0392b;
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
    }

    /* Responsive pour tablettes */
    @media (max-width: 768px) {
        .sidebar {
            width: 70px;
            transition: width 0.3s ease;
        }

        .sidebar:hover {
            width: 280px;
        }

        .sidebar-header .logo,
        .sidebar-nav .section-title,
        .sidebar-nav .nav-item span,
        .logout-btn span {
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .sidebar:hover .sidebar-header .logo,
        .sidebar:hover .sidebar-nav .section-title,
        .sidebar:hover .sidebar-nav .nav-item span,
        .sidebar:hover .logout-btn span {
            opacity: 1;
        }
    }

    /* Adaptation du contenu principal */
    .main-content {
        margin-left: 280px;
        transition: margin-left 0.3s ease;
    }

    @media (max-width: 768px) {
        .main-content {
            margin-left: 70px;
        }
    }
</style>

<div class="sidebar">
    <div class="sidebar-header">
        <a href="${pageContext.request.contextPath}/dashboard/admin" class="logo">
            <span>Gestion Locative</span>
        </a>
    </div>

    <nav class="sidebar-nav">
        <div class="nav-section">
            <div class="section-title">Gestion des Personnes</div>
            <a href="${pageContext.request.contextPath}/utilisateur?action=list" class="nav-item">
                <span>Utilisateurs</span>
            </a>
            <a href="${pageContext.request.contextPath}/locataire?action=list" class="nav-item">
                <span>Locataires</span>
            </a>

            <div class="section-title">Patrimoine Immobilier</div>
            <a href="${pageContext.request.contextPath}/immeuble?action=list" class="nav-item">
                <span>Immeubles</span>
            </a>
            <a href="${pageContext.request.contextPath}/unite?action=list" class="nav-item">
                <span>Unités</span>
            </a>

            <div class="section-title">Gestion Locative</div>
            <a href="${pageContext.request.contextPath}/contrat?action=list" class="nav-item">
                <span>Contrats</span>
            </a>
            <a href="${pageContext.request.contextPath}/paiement?action=list" class="nav-item">
                <span>Paiements</span>
            </a>
            <a href="${pageContext.request.contextPath}/demande?action=list" class="nav-item">
                <span>Demandes</span>
            </a>
        </div>
    </nav>

    <div class="sidebar-footer">
        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">
            <span>Déconnexion</span>
        </a>
    </div>
</div>

<!-- Script pour gérer l'état actif -->

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const currentPath = window.location.pathname; // ex: /GestionImmeuble/unite
        const navItems = document.querySelectorAll('.sidebar-nav .nav-item');

        navItems.forEach(item => {
            const itemPath = new URL(item.href).pathname; // extrait juste /GestionImmeuble/unite
            if (currentPath === itemPath) {
                item.classList.add('active');
            }
        });
    });
</script>









