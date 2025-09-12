<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
    /* Reset et style de base */
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .navbar {
        background-color: #2c3e50;
        overflow: hidden;
    }

    .navbar a {
        float: left;
        display: block;
        color: #ecf0f1;
        text-align: center;
        padding: 14px 20px;
        text-decoration: none;
        transition: background 0.3s;
    }

    .navbar a:hover {
        background-color: #34495e;
    }

    .navbar .logo {
        font-weight: bold;
        font-size: 20px;
    }

    /* Bouton déconnexion */
    .navbar .logout {
        float: right;
        background-color: #e74c3c;
        color: white;
        border-radius: 5px;
        margin-right: 10px;
    }

    .navbar .logout:hover {
        background-color: #c0392b;
    }

    @media screen and (max-width: 600px) {
        .navbar a {
            float: none;
            width: 100%;
        }
        .navbar .logout {
            width: 100%;
            text-align: center;
            float: none;
            margin: 5px 0;
        }
    }
</style>

<div class="navbar">
    <a href="${pageContext.request.contextPath}/dashboard/locataire" class="logo">Locataire dashboard</a>
    <a href="${pageContext.request.contextPath}/contrat?action=list">Contrats</a>
    <a href="${pageContext.request.contextPath}/paiement?action=list">Paiements</a>
    <a href="${pageContext.request.contextPath}/demande?action=list">Demandes</a>
    <a href="${pageContext.request.contextPath}/logout" class="logout">Déconnexion</a>
</div>
