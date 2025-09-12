<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/navbars/navbarAdmin.jsp" />
<html>
<head>
    <title>Ajouter un Locataire</title>
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
        input[type="text"], select {
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
    <h3>Ajouter un Locataire</h3>
    <form action="locataire?action=save" method="post">
        <label for="profession">Profession :</label>
        <input type="text" id="profession" name="profession" placeholder="Profession" required>

        <label for="adresse">Adresse :</label>
        <input type="text" id="adresse" name="adresse" placeholder="Adresse" required>

        <label for="id_utilisateur">Utilisateur associé :</label>
        <select id="id_utilisateur" name="id_utilisateur" required>
            <option value="" disabled selected>Sélectionner</option>
            <c:forEach items="${utilisateurs}" var="u">
                <option value="${u.id}">${u.prenom} ${u.nom}</option>
            </c:forEach>
        </select>

        <button type="submit">Ajouter</button>
    </form>
</div>
</body>
</html>
