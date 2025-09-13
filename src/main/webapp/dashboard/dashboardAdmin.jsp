<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbars/navbarAdmin.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #667eea;
            --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --secondary-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --success-gradient: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --warning-gradient: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);
            --danger-gradient: linear-gradient(135deg, #fa709a 0%, #fee140 100%);
            --info-gradient: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            --dark-gradient: linear-gradient(135deg, #2c3e50 0%, #34495e 100%);
            --surface-white: #ffffff;
            --surface-light: #f8fafc;
            --text-dark: #2d3748;
            --text-light: #718096;
            --border-light: #e2e8f0;
            --shadow-sm: 0 1px 3px 0 rgba(0, 0, 0, 0.1), 0 1px 2px 0 rgba(0, 0, 0, 0.06);
            --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            --shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            font-family: 'Inter', sans-serif;
            color: var(--text-dark);
            min-height: 100vh;
            position: relative;
        }

        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background:
                    radial-gradient(circle at 20% 50%, rgba(102, 126, 234, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 80% 20%, rgba(118, 75, 162, 0.1) 0%, transparent 50%),
                    radial-gradient(circle at 40% 80%, rgba(240, 147, 251, 0.1) 0%, transparent 50%);
            pointer-events: none;
            z-index: -1;
        }

        /* ===== SIDEBAR STYLES ===== */
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
        .sidebar-nav .nav-item[href*="dashboard"]::before { content: "📊"; }

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

        /* ===== MAIN CONTENT STYLES ===== */
        .main-content {
            margin-left: 280px;
            transition: margin-left 0.3s ease;
            min-height: 100vh;
        }

        .container-fluid {
            padding: 2rem;
        }

        .welcome-header {
            background: linear-gradient(180deg, #1e3c72, #2a5298);
            padding: 2rem;
            border-radius: 20px;
            color: white;
            margin-bottom: 2rem;
            box-shadow: var(--shadow-xl);
            position: relative;
            overflow: hidden;
        }

        .welcome-header::before {
            content: '';
            position: absolute;
            top: -50%;
            right: -20%;
            width: 200px;
            height: 200px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .welcome-header::after {
            content: '';
            position: absolute;
            bottom: -30%;
            left: -10%;
            width: 150px;
            height: 150px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 50%;
            animation: float 8s ease-in-out infinite reverse;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
        }

        .welcome-title {
            font-size: 2.5rem;
            font-weight: 700;
            margin: 0;
            position: relative;
            z-index: 1;
        }

        .welcome-subtitle {
            font-size: 1.1rem;
            opacity: 0.9;
            margin-top: 0.5rem;
            position: relative;
            z-index: 1;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 1.5rem;
            margin-bottom: 3rem;
        }

        .stat-card {
            background: var(--surface-white);
            border-radius: 20px;
            padding: 2rem;
            box-shadow: var(--shadow-md);
            border: 1px solid var(--border-light);
            position: relative;
            overflow: hidden;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            cursor: pointer;
        }

        .stat-card:hover {
            transform: translateY(-8px) scale(1.02);
            box-shadow: var(--shadow-xl);
        }

        .stat-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: var(--primary-gradient);
            transition: height 0.3s ease;
        }

        .stat-card:hover::before {
            height: 8px;
        }

        .stat-card.immeubles::before { background: var(--primary-gradient); }
        .stat-card.unites::before { background: var(--secondary-gradient); }
        .stat-card.contrats::before { background: var(--success-gradient); }
        .stat-card.locataires::before { background: var(--warning-gradient); }
        .stat-card.proprietaires::before { background: var(--info-gradient); }
        .stat-card.admins::before { background: var(--danger-gradient); }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            font-size: 1.5rem;
            color: white;
        }

        .stat-card.immeubles .stat-icon { background: var(--primary-gradient); }
        .stat-card.unites .stat-icon { background: var(--secondary-gradient); }
        .stat-card.contrats .stat-icon { background: var(--success-gradient); }
        .stat-card.locataires .stat-icon { background: var(--warning-gradient); }
        .stat-card.proprietaires .stat-icon { background: var(--info-gradient); }
        .stat-card.admins .stat-icon { background: var(--danger-gradient); }

        .stat-number {
            font-size: 2rem;
            font-weight: 700;
            color: var(--text-dark);
            line-height: 1;
            margin-bottom: 0.3rem;
        }

        .stat-label {
            font-size: 0.85rem;
            color: var(--text-light);
            font-weight: 500;
        }

        .action-buttons {
            display: flex;
            gap: 1rem;
            margin-bottom: 3rem;
            flex-wrap: wrap;
        }

        .btn-modern {
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
            font-size: 0.95rem;
            border: none;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }

        .btn-modern:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-lg);
        }

        .btn-modern.btn-success {
            background: var(--success-gradient);
            color: white;
        }

        .btn-modern.btn-primary {
            background: var(--primary-gradient);
            color: white;
        }

        .management-card {
            background: var(--surface-white);
            border-radius: 20px;
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-md);
            margin-bottom: 2rem;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .management-card:hover {
            box-shadow: var(--shadow-lg);
        }

        .card-header-modern {
            background: linear-gradient(180deg, #1e3c72, #2a5298);
            color: white;
            padding: 1.5rem 2rem;
            font-weight: 600;
            font-size: 1.2rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .card-body-modern {
            padding: 2rem;
        }

        .table-modern {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-light);
        }

        .table-modern thead th {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            font-weight: 600;
            color: var(--text-dark);
            border: none;
            padding: 1rem;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .table-modern tbody td {
            padding: 1rem;
            border-color: var(--border-light);
            vertical-align: middle;
        }

        .table-modern tbody tr {
            transition: all 0.2s ease;
        }

        .table-modern tbody tr:hover {
            background-color: rgba(102, 126, 234, 0.05);
            transform: scale(1.01);
        }

        .btn-action {
            padding: 0.5rem 1rem;
            border-radius: 8px;
            font-size: 0.875rem;
            font-weight: 500;
            border: none;
            transition: all 0.3s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.3rem;
            margin-right: 0.5rem;
        }

        .btn-action:hover {
            transform: translateY(-1px);
        }

        .btn-action.btn-info {
            background: linear-gradient(135deg, #17a2b8, #138496);
            color: white;
        }

        .btn-action.btn-danger {
            background: linear-gradient(135deg, #dc3545, #c82333);
            color: white;
        }

        .badge-modern {
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .badge-modern.bg-success {
            background: var(--success-gradient) !important;
        }

        .badge-modern.bg-warning {
            background: var(--warning-gradient) !important;
            color: var(--text-dark) !important;
        }

        .badge-modern.bg-danger {
            background: var(--danger-gradient) !important;
        }

        .fade-in {
            animation: fadeIn 0.6s ease-out forwards;
            opacity: 0;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .animate-delay-1 { animation-delay: 0.1s; }
        .animate-delay-2 { animation-delay: 0.2s; }
        .animate-delay-3 { animation-delay: 0.3s; }
        .animate-delay-4 { animation-delay: 0.4s; }
        .animate-delay-5 { animation-delay: 0.5s; }
        .animate-delay-6 { animation-delay: 0.6s; }

        /* ===== RESPONSIVE STYLES ===== */
        @media (max-width: 768px) {
            .sidebar {
                width: 70px;
                transition: width 0.3s ease;
            }

            .sidebar:hover {
                width: 280px;
            }

            .sidebar-header .logo span,
            .sidebar-nav .section-title,
            .sidebar-nav .nav-item span,
            .logout-btn span {
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .sidebar:hover .sidebar-header .logo span,
            .sidebar:hover .sidebar-nav .section-title,
            .sidebar:hover .sidebar-nav .nav-item span,
            .sidebar:hover .logout-btn span {
                opacity: 1;
            }

            .main-content {
                margin-left: 70px;
            }

            .container-fluid {
                padding: 1rem;
            }

            .welcome-header {
                padding: 1.5rem;
                text-align: center;
            }

            .welcome-title {
                font-size: 2rem;
            }

            .stats-grid {
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1rem;
            }

            .stat-card {
                padding: 1.5rem;
            }

            .action-buttons {
                flex-direction: column;
            }

            .card-body-modern {
                padding: 1rem;
            }

            .table-modern {
                font-size: 0.875rem;
            }
        }
    </style>
</head>
<body>
<!-- Sidebar -->


<!-- Main Content -->
<div class="main-content">
    <div class="container-fluid">
        <!-- Header de bienvenue -->
        <div class="welcome-header fade-in">
            <h1 class="welcome-title">
                <i class="fas fa-tachometer-alt me-3"></i>
                Tableau de bord administrateur
            </h1>
            <p class="welcome-subtitle">
                Gérez efficacement votre plateforme immobilière
            </p>
        </div>

        <!-- Statistiques globales -->
        <div class="stats-grid">
            <div class="stat-card immeubles fade-in animate-delay-1">
                <div class="stat-icon">
                    <i class="fas fa-building"></i>
                </div>
                <div class="stat-number">${totalImmeubles}</div>
                <div class="stat-label">Immeubles</div>
            </div>
            <div class="stat-card unites fade-in animate-delay-2">
                <div class="stat-icon">
                    <i class="fas fa-door-open"></i>
                </div>
                <div class="stat-number">${totalUnites}</div>
                <div class="stat-label">Unités</div>
            </div>
            <div class="stat-card contrats fade-in animate-delay-3">
                <div class="stat-icon">
                    <i class="fas fa-file-contract"></i>
                </div>
                <div class="stat-number">${totalContratsActifs}</div>
                <div class="stat-label">Contrats actifs</div>
            </div>
            <div class="stat-card locataires fade-in animate-delay-4">
                <div class="stat-icon">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-number">${totalLocataires}</div>
                <div class="stat-label">Locataires</div>
            </div>
            <div class="stat-card proprietaires fade-in animate-delay-5">
                <div class="stat-icon">
                    <i class="fas fa-user-tie"></i>
                </div>
                <div class="stat-number">${totalProprietaires}</div>
                <div class="stat-label">Propriétaires</div>
            </div>
        </div>

        <!-- Boutons d'action -->
        <div class="action-buttons fade-in">
            <form action="${pageContext.request.contextPath}/rapport/demandes" method="get" target="_blank" style="display: inline;">
                <button type="submit" class="btn-modern btn-success">
                    <i class="fas fa-file-pdf"></i>
                    Générer le rapport Demandes
                </button>
            </form>
            <form action="${pageContext.request.contextPath}/rapport/paiements" method="get" target="_blank" style="display: inline;">
                <button type="submit" class="btn-modern btn-success">
                    <i class="fas fa-file-pdf"></i>
                    Générer le rapport Paiements
                </button>
            </form>

        </div>

        <!-- Gestion des utilisateurs -->
        <div class="management-card fade-in">
            <div class="card-header-modern">
                <i class="fas fa-users"></i>
                Gestion des utilisateurs
            </div>
            <div class="card-body-modern">
                <a href="utilisateur?action=add" class="btn-modern btn-primary mb-4">
                    <i class="fas fa-plus"></i>
                    Ajouter un utilisateur
                </a>
                <div class="table-responsive">
                    <table class="table table-modern">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nom complet</th>
                            <th>Email</th>
                            <th>Rôle</th>
                            <th>Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="u" items="${utilisateurs}">
                            <tr>
                                <td><strong>#${u.id}</strong></td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="avatar-placeholder me-3" style="width: 40px; height: 40px; background: var(--primary-gradient); border-radius: 10px; display: flex; align-items: center; justify-content: center; color: white; font-weight: 600;">
                                                ${u.nom.substring(0,1)}${u.prenom.substring(0,1)}
                                        </div>
                                        <div>
                                            <div class="fw-semibold">${u.nom} ${u.prenom}</div>
                                        </div>
                                    </div>
                                </td>
                                <td>
                                    <i class="fas fa-envelope me-2 text-muted"></i>
                                        ${u.email}
                                </td>
                                <td>
                                            <span class="badge-modern ${u.role eq 'ADMIN' ? 'bg-danger' : (u.role eq 'PROPRIETAIRE' ? 'bg-warning' : 'bg-success')}">
                                                    ${u.role}
                                            </span>
                                </td>
                                <td>
                                    <a href="utilisateur?action=edit&id=${u.id}" class="btn-action btn-info">
                                        <i class="fas fa-edit"></i>
                                        Modifier
                                    </a>
                                    <a href="utilisateur?action=delete&id=${u.id}" class="btn-action btn-danger"
                                       onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet utilisateur ?')">
                                        <i class="fas fa-trash"></i>
                                        Supprimer
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Suivi des paiements -->
        <div class="management-card fade-in">
            <div class="card-header-modern">
                <i class="fas fa-money-bill-wave"></i>
                Suivi des paiements récents
            </div>
            <div class="card-body-modern">
                <div class="table-responsive">
                    <table class="table table-modern">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Contrat</th>
                            <th>Montant</th>
                            <th>Date de paiement</th>
                            <th>Statut</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="p" items="${paiements}">
                            <tr>
                                <td><strong>#${p.id}</strong></td>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <i class="fas fa-file-contract me-2 text-muted"></i>
                                        Contrat #${p.contratLocation.id}
                                    </div>
                                </td>
                                <td>
                                    <div class="fw-bold text-success">
                                        <i class="fas fa-coins me-1"></i>
                                            ${p.montant} FCFA
                                    </div>
                                </td>
                                <td>
                                    <i class="fas fa-calendar-alt me-2 text-muted"></i>
                                        ${p.datePaiement}
                                </td>
                                <td>
                                            <span class="badge-modern ${p.statut eq 'PAYE' ? 'bg-success' : (p.statut eq 'EN_ATTENTE' ? 'bg-warning' : 'bg-danger')}">
                                                <i class="fas ${p.statut eq 'PAYE' ? 'fa-check' : (p.statut eq 'EN_ATTENTE' ? 'fa-clock' : 'fa-times')} me-1"></i>
                                                ${p.statut}
                                            </span>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>