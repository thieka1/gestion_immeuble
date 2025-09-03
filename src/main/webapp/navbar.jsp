<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        /* Reset de base */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }

        /* Navbar container */
        .navbar {
            background-color: #2c3e50;
            overflow: hidden;
        }

        /* Liens */
        .navbar a {
            float: left;
            display: block;
            color: #ecf0f1;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
            transition: background 0.3s;
        }

        /* Hover */
        .navbar a:hover {
            background-color: #34495e;
        }

        /* Logo */
        .navbar .logo {
            font-weight: bold;
            font-size: 20px;
        }

        /* Responsive */
        @media screen and (max-width: 600px) {
            .navbar a {
                float: none;
                width: 100%;
            }
        }
    </style>
</head>
<body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="navbar">
    <a href="index.jsp" class="logo">Gestion Immeuble</a>
    <a href="utilisateur?action=list">Utilisateurs</a>
    <a href="locataire?action=list">Locataires</a>
    <a href="immeuble?action=list">Immeubles</a>
    <a href="unite?action=list">Unités</a>
    <a href="contrat?action=list">Contrats</a>
    <a href="paiement?action=list">Paiements</a>
    <a href="demande?action=list">Demandes</a>
</div>


</body>
</html>
