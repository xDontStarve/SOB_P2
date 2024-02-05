<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deim.urv.cat.homework2.model.Game"%>
<%@page import="java.util.List"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Checkout</title>
    <!-- Bootstrap CSS para diseño responsivo -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="container mt-4">
        <!-- Botón Home alineado a la izquierda para mejor consistencia -->
        <div class="mb-3">
            <form action="${mvc.uri('main')}" method="GET">
                <button type="submit" class="btn btn-primary">Home</button>
            </form>
        </div>
        <h2 class="text-center">Checkout</h2>
        <ul class="list-group">
            <!-- Uso de clases de Bootstrap para texto y elementos de lista -->
            <c:forEach var="game" items="${cart.cart}">
                <li class="list-group-item">
                    <div class="d-flex justify-content-between">
                        <div>Nombre: <span class="text-uppercase">${game.name}</span></div>
                        <div>Precio: <fmt:formatNumber value="${game.price}" maxFractionDigits="2" minFractionDigits="2"/>€</div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <!-- Total alineado a la derecha para énfasis en el costo -->
        <h4 class="text-right mt-3">Total: 
            <c:set var="totalPrice" value="0"/>
            <c:forEach var="game" items="${cart.cart}" varStatus="status">
                <c:set var="totalPrice" value="${totalPrice + game.price}"/>
            </c:forEach>
            <fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2"/>€
        </h4>
        <!-- Botón de pago centrado para fácil acceso -->
        <form action="${mvc.uri('pay')}" method="POST">
            <button type="submit" class="btn btn-primary">Proceder al Pago</button>
        </form>
        <c:if test="${not empty sessionScope.rentInfo}">
            <div class="alert alert-success" role="alert">
                <strong>Resultado del Alquiler:</strong>
                <pre>${sessionScope.rentInfo}</pre>
            </div>
        </c:if>
    </div>
</body>
</html>