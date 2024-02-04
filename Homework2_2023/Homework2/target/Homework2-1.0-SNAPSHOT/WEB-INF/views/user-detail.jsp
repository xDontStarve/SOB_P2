<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="deim.urv.cat.homework2.model.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Detalles del Usuario</title>
    <!-- CDN de Bootstrap CSS para diseño responsivo -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="d-flex justify-content-center mt-3 mb-3">
        <form action="${mvc.uri('main')}" method="GET" class="mr-2">
            <button type="submit" class="btn btn-primary">Home</button>
        </form>
    </div>
    <div class="container mt-5">
        <h1>Detalles del Usuario</h1>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Usuario: ${customerDTO.username}</h5>
                <p class="card-text">ID: ${customerDTO.id}</p>
                <p class="card-text">Email: ${customerDTO.email}</p>
            </div>
        </div>
            <form action="${mvc.uri('logout')}" method="POST" class="mr-2">
                <button type="submit" class="btn btn-primary">Logout</button>
            </form>
    </div>
</body>
</html>