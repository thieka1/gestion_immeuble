<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbars/navbarProprietaire.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Propriétaire</title>

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
            --sidebar-gradient: linear-gradient(180deg, #1e3c72, #2a5298);
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

        .main-content {
            margin-left: 280px;
            transition: margin-left 0.3s ease;
            min-height: 100vh;
        }

        .container {
            padding: 2rem;
        }

        .welcome-header {
            background: var(--sidebar-gradient);
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
            transform: translateY(-2px);
        }

        .card-header-modern {
            background: var(--sidebar-gradient);
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

        .item-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 1rem;
            margin-bottom: 0.5rem;
            background: var(--surface-light);
            border-radius: 12px;
            border: 1px solid var(--border-light);
            transition: all 0.3s ease;
        }

        .item-row:hover {
            background: rgba(102, 126, 234, 0.05);
            transform: translateX(5px);
        }

        .item-info {
            display: flex;
            flex-direction: column;
        }

        .item-title {
            font-weight: 600;
            color: var(--text-dark);
            margin-bottom: 0.3rem;
        }

        .item-subtitle {
            color: var(--text-light);
            font-size: 0.9rem;
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
            color: white;
        }

        .badge-modern.bg-danger {
            background: var(--danger-gradient) !important;
            color: white;
        }

        .badge-modern.bg-warning {
            background: var(--warning-gradient) !important;
            color: var(--text-dark);
        }

        .badge-modern.bg-secondary {
            background: var(--info-gradient) !important;
            color: white;
        }

        .btn-modern {
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

        .btn-modern:hover {
            transform: translateY(-1px);
            box-shadow: var(--shadow-md);
        }

        .btn-accept {
            background: var(--success-gradient);
            color: white !important;
        }

        .btn-reject {
            background: var(--danger-gradient);
            color: white !important;
        }

        .empty-state {
            text-align: center;
            padding: 3rem 2rem;
            color: var(--text-light);
        }

        .empty-state i {
            font-size: 3rem;
            margin-bottom: 1rem;
            opacity: 0.5;
        }

        .money-amount {
            font-weight: 700;
            color: var(--success-gradient);
            background: linear-gradient(45deg, #4facfe 0%, #00f2fe 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
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

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .main-content {
                margin-left: 70px;
            }

            .container {
                padding: 1rem;
            }

            .welcome-header {
                padding: 1.5rem;
                text-align: center;
            }

            .welcome-title {
                font-size: 2rem;
            }

            .card-body-modern {
                padding: 1rem;
            }

            .item-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .action-buttons {
                align-self: stretch;
                justify-content: flex-end;
            }
        }
    </style>
</head>
<body>
<div class="main-content">
    <div class="container">
        <!-- Header de bienvenue -->
        <div class="welcome-header fade-in">
            <h2 class="welcome-title">
                <i class="fas fa-user-tie me-3"></i>
                Espace Propriétaire
            </h2>
            <p class="welcome-subtitle">
                Gérez vos biens immobiliers en toute simplicité
            </p>
        </div>

        <!-- Section Immeubles -->
        <div class="management-card fade-in animate-delay-1">
            <div class="card-header-modern">
                <i class="fas fa-building"></i>
                Mes Immeubles
            </div>
            <div class="card-body-modern">
                <c:choose>
                    <c:when test="${empty immeubles}">
                        <div class="empty-state">
                            <i class="fas fa-building"></i>
                            <p>Aucun immeuble trouvé dans votre portefeuille.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="im" items="${immeubles}">
                            <div class="item-row">
                                <div class="item-info">
                                    <div class="item-title">
                                        <i class="fas fa-building me-2"></i>
                                            ${im.nom}
                                    </div>
                                    <div class="item-subtitle">
                                        <i class="fas fa-map-marker-alt me-1"></i>
                                            ${im.adresse}
                                    </div>
                                </div>
                                <span class="badge-modern bg-secondary">
                                        ${im.nombreEtages} étages
                                    </span>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Section Unités -->
        <div class="management-card fade-in animate-delay-2">
            <div class="card-header-modern">
                <i class="fas fa-door-open"></i>
                Unités de Location
            </div>
            <div class="card-body-modern">
                <c:choose>
                    <c:when test="${empty unites}">
                        <div class="empty-state">
                            <i class="fas fa-door-open"></i>
                            <p>Aucune unité de location disponible.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="u" items="${unites}">
                            <div class="item-row">
                                <div class="item-info">
                                    <div class="item-title">
                                        <i class="fas fa-home me-2"></i>
                                        Unité ${u.numero}
                                    </div>
                                </div>
                                <c:choose>
                                    <c:when test="${u.statut eq 'LOUE'}">
                                            <span class="badge-modern bg-danger">
                                                <i class="fas fa-lock me-1"></i>
                                                LOUÉE
                                            </span>
                                    </c:when>
                                    <c:when test="${u.statut eq 'DISPONIBLE'}">
                                            <span class="badge-modern bg-success">
                                                <i class="fas fa-check me-1"></i>
                                                DISPONIBLE
                                            </span>
                                    </c:when>
                                </c:choose>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Section Contrats -->
        <div class="management-card fade-in animate-delay-3">
            <div class="card-header-modern">
                <i class="fas fa-file-contract"></i>
                Contrats en cours
            </div>
            <div class="card-body-modern">
                <c:choose>
                    <c:when test="${empty contrats}">
                        <div class="empty-state">
                            <i class="fas fa-file-contract"></i>
                            <p>Aucun contrat actif pour le moment.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="c" items="${contrats}">
                            <c:if test="${not empty c.locataire and not empty c.locataire.utilisateur}">
                                <div class="item-row">
                                    <div class="item-info">
                                        <div class="item-title">
                                            <i class="fas fa-user me-2"></i>
                                                ${c.locataire.utilisateur.nom} ${c.locataire.utilisateur.prenom}
                                        </div>
                                        <div class="item-subtitle">
                                            <i class="fas fa-calendar me-1"></i>
                                            Du ${c.dateDebut} au ${c.dateFin}
                                        </div>
                                    </div>
                                    <span class="badge-modern bg-success">
                                            <i class="fas fa-handshake me-1"></i>
                                            ACTIF
                                        </span>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Section Paiements -->
        <div class="management-card fade-in animate-delay-4">
            <div class="card-header-modern">
                <i class="fas fa-money-bill-wave"></i>
                Paiements Reçus
            </div>
            <div class="card-body-modern">
                <c:choose>
                    <c:when test="${empty paiements}">
                        <div class="empty-state">
                            <i class="fas fa-money-bill-wave"></i>
                            <p>Aucun paiement enregistré pour le moment.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="p" items="${paiements}">
                            <div class="item-row">
                                <div class="item-info">
                                    <div class="item-title money-amount">
                                        <i class="fas fa-coins me-2"></i>
                                            ${p.montant} FCFA
                                    </div>
                                    <div class="item-subtitle">
                                        <i class="fas fa-calendar-check me-1"></i>
                                        Reçu le ${p.datePaiement}
                                    </div>
                                </div>
                                <span class="badge-modern ${p.statut eq 'PAYE' ? 'bg-success' : 'bg-warning'}">
                                        <i class="fas ${p.statut eq 'PAYE' ? 'fa-check-circle' : 'fa-clock'} me-1"></i>
                                        ${p.statut}
                                    </span>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Section Demandes Acceptées -->
        <div class="management-card fade-in animate-delay-5">
            <div class="card-header-modern">
                <i class="fas fa-check-circle"></i>
                Demandes Acceptées
            </div>
            <div class="card-body-modern">
                <c:choose>
                    <c:when test="${empty demandes}">
                        <div class="empty-state">
                            <i class="fas fa-check-circle"></i>
                            <p>Aucune demande acceptée pour le moment.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:set var="hasAcceptedDemandes" value="false" />
                        <c:forEach var="d" items="${demandes}">
                            <c:if test="${d.statut eq 'ACCEPTEE'}">
                                <c:set var="hasAcceptedDemandes" value="true" />
                                <div class="item-row">
                                    <div class="item-info">
                                        <div class="item-title">
                                            <i class="fas fa-user-check me-2"></i>
                                                ${d.locataire.utilisateur.nom} ${d.locataire.utilisateur.prenom}
                                        </div>
                                        <div class="item-subtitle">
                                            <i class="fas fa-home me-1"></i>
                                            Unité ${d.unite.numero}
                                        </div>
                                    </div>
                                    <span class="badge-modern bg-success">
                                            <i class="fas fa-thumbs-up me-1"></i>
                                            ACCEPTÉE
                                        </span>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${not hasAcceptedDemandes}">
                            <div class="empty-state">
                                <i class="fas fa-check-circle"></i>
                                <p>Aucune demande acceptée pour le moment.</p>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>

        <!-- Section Demandes en attente -->
        <div class="management-card fade-in animate-delay-6">
            <div class="card-header-modern">
                <i class="fas fa-envelope-open-text"></i>
                Demandes en Attente de Réponse
            </div>
            <div class="card-body-modern">
                <c:choose>
                    <c:when test="${empty demandes}">
                        <div class="empty-state">
                            <i class="fas fa-envelope-open-text"></i>
                            <p>Aucune demande en attente pour le moment.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:set var="hasPendingDemandes" value="false" />
                        <c:forEach var="d" items="${demandes}">
                            <c:if test="${not empty d.locataire and not empty d.locataire.utilisateur}">
                                <div class="item-row">
                                    <div class="item-info">
                                        <div class="item-title">
                                            <i class="fas fa-user-clock me-2"></i>
                                                ${d.locataire.utilisateur.nom} ${d.locataire.utilisateur.prenom}
                                        </div>
                                        <div class="item-subtitle">
                                            <i class="fas fa-home me-1"></i>
                                            Demande pour l'unité ${d.unite.numero}
                                        </div>
                                    </div>
                                    <div class="action-buttons">
                                        <c:choose>
                                            <c:when test="${d.statut eq 'EN_ATTENTE'}">
                                                <c:set var="hasPendingDemandes" value="true" />
                                                <a href="${pageContext.request.contextPath}/demande?action=accept&id=${d.id}"
                                                   class="btn-modern btn-accept">
                                                    <i class="fas fa-check"></i>
                                                    Accepter
                                                </a>
                                                <a href="${pageContext.request.contextPath}/demande?action=reject&id=${d.id}"
                                                   class="btn-modern btn-reject">
                                                    <i class="fas fa-times"></i>
                                                    Refuser
                                                </a>
                                            </c:when>
                                            <c:when test="${d.statut eq 'ACCEPTEE'}">
                                                    <span class="badge-modern bg-success">
                                                        <i class="fas fa-thumbs-up me-1"></i>
                                                        ACCEPTÉE
                                                    </span>
                                            </c:when>
                                            <c:when test="${d.statut eq 'REFUSEE'}">
                                                    <span class="badge-modern bg-danger">
                                                        <i class="fas fa-thumbs-down me-1"></i>
                                                        REFUSÉE
                                                    </span>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                        <c:if test="${not hasPendingDemandes}">
                            <div class="empty-state">
                                <i class="fas fa-envelope-open-text"></i>
                                <p>Aucune demande en attente de réponse.</p>
                            </div>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    // Animation au scroll
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);

    // Observer tous les éléments avec animation
    document.querySelectorAll('.fade-in').forEach(el => {
        observer.observe(el);
    });

    // Animation des cartes
    document.querySelectorAll('.management-card').forEach(card => {
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-2px)';
        });

        card.addEventListener('mouseleave', () => {
            card.style.transform = 'translateY(0)';
        });
    });

    // Animation des lignes d'items
    document.querySelectorAll('.item-row').forEach(row => {
        row.addEventListener('mouseenter', () => {
            row.style.backgroundColor = 'rgba(102, 126, 234, 0.05)';
            row.style.transform = 'translateX(5px)';
        });

        row.addEventListener('mouseleave', () => {
            row.style.backgroundColor = '';
            row.style.transform = 'translateX(0)';
        });
    });

    // Animation des boutons
    document.querySelectorAll('.btn-modern').forEach(btn => {
        btn.addEventListener('mouseenter', () => {
            btn.style.transform = 'translateY(-1px)';
        });

        btn.addEventListener('mouseleave', () => {
            btn.style.transform = 'translateY(0)';
        });
    });
</script>
</body>
</html>