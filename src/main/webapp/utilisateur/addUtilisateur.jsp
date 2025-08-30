<%--
  Created by IntelliJ IDEA.
  User: sowth
  Date: 23/08/2025
  Time: 12:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
