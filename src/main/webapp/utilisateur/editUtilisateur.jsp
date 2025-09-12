<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Modifier un Utilisateur</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .form-container {
            background-color: #ffffff;
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555555;
        }

        input[type="text"], input[type="email"], input[type="password"], select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #cccccc;
            box-sizing: border-box;
        }

        input[type="text"]:focus, input[type="email"]:focus, input[type="password"]:focus, select:focus {
            border-color: #007BFF;
            outline: none;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #007BFF;
            color: #ffffff;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h2>Modifier un Utilisateur</h2>
    <form action="utilisateur" method="post">
        <input type="hidden" name="id" value="${utilisateur.id}" />
        <input type="hidden" name="action" value="update" />

        <label>Nom :</label>
        <input type="text" name="nom" value="${utilisateur.nom}" required />

        <label>Prénom :</label>
        <input type="text" name="prenom" value="${utilisateur.prenom}" required />

        <label>Email :</label>
        <input type="email" name="email" value="${utilisateur.email}" required />

        <label>Téléphone :</label>
        <input type="text" name="telephone" value="${utilisateur.telephone}" />

        <label>Mot de passe :</label>
        <input type="password" name="password" placeholder="Nouveau mot de passe (laisser vide si inchangé)" />

        <label>Rôle :</label>
        <select name="role" required>
            <option value="ADMIN" ${utilisateur.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
            <option value="PROPRIETAIRE" ${utilisateur.role == 'PROPRIETAIRE' ? 'selected' : ''}>PROPRIETAIRE</option>
            <option value="LOCATAIRE" ${utilisateur.role == 'LOCATAIRE' ? 'selected' : ''}>LOCATAIRE</option>
        </select>

        <button type="submit" class="btn-submit">Enregistrer les modifications</button>
    </form>
</div>
</body>
</html>
