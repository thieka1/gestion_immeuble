<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/navbars/navbarAdmin.jsp" />

<html>
<head>
    <title>Ajouter un utilisateur</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .form-container {
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h3 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 25px;
        }
        label {
            display: block;
            margin-top: 15px;
            margin-bottom: 5px;
            font-weight: bold;
            color: #34495e;
        }
        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 8px 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #27ae60;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }
        button:hover {
            background-color: #219150;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h3>Ajouter un utilisateur</h3>
    <form action="?action=save" method="post">

        <label for="nom">Nom :</label>
        <input type="text" id="nom" name="nom" placeholder="Nom" required>

        <label for="prenom">Prénom :</label>
        <input type="text" id="prenom" name="prenom" placeholder="Prénom" required>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" placeholder="Email" required>

        <label for="telephone">Téléphone :</label>
        <input type="text" id="telephone" name="telephone" placeholder="Téléphone">

        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" placeholder="Mot de passe" required>

        <label for="role">Rôle :</label>
        <select id="role" name="role" required>
            <option value="ADMIN">ADMIN</option>
            <option value="PROPRIETAIRE">PROPRIETAIRE</option>
            <option value="LOCATAIRE">LOCATAIRE</option>
        </select>

        <button type="submit">Ajouter</button>
    </form>
</div>
</body>
</html>
