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
    <title>Nouvelle demande de location</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f7fa; margin: 20px; }
        h2 { text-align: center; color: #2c3e50; margin-bottom: 30px; }
        .cards-container { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; }
        .card { background: #fff; border-radius: 8px; box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            width: 250px; padding: 15px; display: flex; flex-direction: column; }
        .card img { width: 100%; border-radius: 4px; margin-bottom: 10px; }
        .card h3 { margin: 0 0 5px; color: #34495e; font-size: 18px; }
        .card p { margin: 3px 0; font-size: 14px; }
        .btn { padding: 8px 12px; border: none; border-radius: 4px; cursor: pointer; font-size: 14px; margin-top: 5px; }
        .btn-detail { background: #3498db; color: white; }
        .btn-detail:hover { background: #2980b9; }
        .btn-request { background: #27ae60; color: white; }
        .btn-request:hover { background: #219150; }
    </style>
</head>
<body>
<h2>Unités disponibles pour la location</h2>

<div class="cards-container">
    <c:forEach var="u" items="${unites}">
        <c:if test="${u.statut.name() eq 'DISPONIBLE'}">
            <div class="card">
                <c:if test="${not empty u.image}">
                    <img src="${pageContext.request.contextPath}/uploads/${u.image}" alt="Image unité ${u.numero}" />
                </c:if>
                <h3>Unité ${u.numero}</h3>
                <p>Pièces : ${u.nombrePieces}</p>
                <p>Superficie : ${u.superficie} m²</p>
                <p>Immeuble : ${u.immeuble.nom}</p>
                <p>Loyer : ${u.loyerMensuel} F CFA</p>


                <form action="${pageContext.request.contextPath}/demande?action=save" method="post">
                    <input type="hidden" name="locataireId" value="${locataire.id}" />
                    <input type="hidden" name="uniteId" value="${u.id}" />
                    <button type="submit" class="btn btn-request">Faire la demande</button>
                </form>
            </div>
        </c:if>
    </c:forEach>
</div>
</body>
</html>
