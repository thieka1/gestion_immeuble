<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<<<<<<< HEAD
<html>
<head>
    <title>Modifier un Locataire</title>
=======
<jsp:include page="/navbars/navbarAdmin.jsp" />
<html>
<head>
    <title>Modifier un Locataire</title>
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
        h2, h3 {
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
>>>>>>> 0249102 (design de l'application)
</head>
<body>
<div class="form-container">
    <h2>Modifier un Locataire</h2>
    <form action="locataire" method="post">
        <!-- ID caché pour update -->
        <input type="hidden" name="id" value="${locataire.id}" />
<<<<<<< HEAD

        <!-- Action update -->
        <input type="hidden" name="action" value="update" />

        <label>Profession :</label>
        <input type="text" name="profession" value="${locataire.profession}" required /><br/><br/>

        <label>Adresse :</label>
        <input type="text" name="adresse" value="${locataire.adresse}" required /><br/><br/>

        <label>Utilisateur :</label>
        <select name="id_utilisateur" required>
            <c:forEach var="user" items="${utilisateurs}">
                <option value="${user.id}"
                        <c:if test="${locataire.utilisateur.id == user.id}">selected</c:if>>
                        ${user.nom} ${user.prenom}
                </option>
            </c:forEach>
        </select><br/><br/>
=======
        <input type="hidden" name="action" value="update" />

        <label>Profession :</label>
        <input type="text" name="profession" value="${locataire.profession}" required />

        <label>Adresse :</label>
        <input type="text" name="adresse" value="${locataire.adresse}" required />

        <label>Utilisateur associé :</label>
        <select name="id_utilisateur" required>
            <c:forEach var="user" items="${utilisateurs}">
                <option value="${user.id}" <c:if test="${locataire.utilisateur.id == user.id}">selected</c:if>>
                        ${user.nom} ${user.prenom}
                </option>
            </c:forEach>
        </select>
>>>>>>> 0249102 (design de l'application)

        <button type="submit">Mettre à jour</button>
    </form>
</div>
</body>
</html>
