<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:choose>
    <c:when test="${sessionScope.userRole eq 'ADMIN'}">
        <jsp:include page="/navbars/navbarAdmin.jsp"/>
    </c:when>
    <c:when test="${sessionScope.userRole eq 'PROPRIETAIRE'}">
        <jsp:include page="/navbars/navbarProprietaire.jsp"/>
    </c:when>
    <c:when test="${sessionScope.userRole eq 'LOCATAIRE'}">
        <jsp:include page="/navbars/navbarLocataire.jsp"/>
    </c:when>
</c:choose>

<html>
<head>
    <title>Ajouter une Unité de Location</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f7fa; margin: 0; padding: 0; }
        .form-container { max-width: 500px; margin: 50px auto; background: #fff; padding: 30px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #2c3e50; margin-bottom: 25px; }
        label { display: block; margin-top: 15px; margin-bottom: 5px; font-weight: bold; color: #34495e; }
        input, select { width: 100%; padding: 8px 10px; border-radius: 5px; border: 1px solid #ccc; box-sizing: border-box; }
        button { margin-top: 20px; width: 100%; padding: 10px; background-color: #27ae60; color: #fff; border: none; border-radius: 5px; font-size: 16px; cursor: pointer; transition: background 0.3s; }
        button:hover { background-color: #219150; }
    </style>
    <script>
        function updateNumero() {
            var immeubleSelect = document.getElementById("immeubleId");
            var numeroInput = document.getElementById("numero");

            var immeubleId = immeubleSelect.value;
            if(!immeubleId) {
                numeroInput.value = "";
                return;
            }

            // AJAX call pour récupérer le prochain numéro
            var xhr = new XMLHttpRequest();
            xhr.open("GET", "unite?action=nextNumero&immeubleId=" + immeubleId, true);
            xhr.onreadystatechange = function() {
                if(xhr.readyState === 4 && xhr.status === 200) {
                    numeroInput.value = xhr.responseText;
                }
            };
            xhr.send();
        }
    </script>
</head>
<body>

<div class="form-container">
    <h2>Ajouter une Unité de Location</h2>
    <form action="unite?action=save" method="post" enctype="multipart/form-data">
        <label>Immeuble :</label>
        <select id="immeubleId" name="immeubleId" required onchange="updateNumero()">
            <option value="" disabled selected>-- Sélectionner un immeuble --</option>
            <c:forEach items="${immeubles}" var="im">
                <option value="${im.id}">${im.nom} (${im.adresse})</option>
            </c:forEach>
        </select>

        <label>Numéro :</label>
        <input type="text" id="numero" name="numero" placeholder="Ex: A001" readonly required />

        <label>Nombre de pièces :</label>
        <input type="number" name="nombrePieces" placeholder="Ex: 3" required />

        <label>Superficie (m²) :</label>
        <input type="number" step="0.01" name="superficie" placeholder="Ex: 75.5" required />

        <label>Loyer mensuel :</label>
        <input type="number" step="0.01" name="loyerMensuel" placeholder="Ex: 500" required />

        <label>Statut :</label>
        <select name="statut" required>
            <option value="" disabled selected>-- Sélectionner --</option>
            <option value="DISPONIBLE">DISPONIBLE</option>
            <option value="LOUE">LOUEE</option>
        </select>

        <label>Image :</label>
        <input type="file" name="image" accept="image/*">

        <button type="submit">Ajouter l'unité</button>
    </form>
</div>

</body>
</html>
