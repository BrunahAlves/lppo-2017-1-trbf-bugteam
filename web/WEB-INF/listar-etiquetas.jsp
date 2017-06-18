<%-- 
    Document   : listar-etiquetas
    Created on : 11/06/2017, 20:23:32
    Author     : Bruna Alves
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar etiquetas</title>
    </head>
    <body>
        <h1>Listar etiquetas!</h1>
        <table>
            <tr>
                <th>Id</th>
                <th>Referência para um autor</th><br>
                <th>Referência para uma tarefa</th><br>
                <th>Título</th><br>
                <th>Ações</th>
        </tr>
        <c:forEach var="etiqueta" items="${etiquetas}">
            <tr>
                <td><a href="editarEtiqueta.html?id=${etiqueta.id}">${etiqueta.id}</a></td>
                <td>${etiqueta.usuario.id}</td>
                <td>${etiqueta.tarefa.id}</td>
                <td>${etiqueta.titulo}</td>
                <td><a href="excluirEtiqueta.html?id=${etiqueta.id}">&#128465;</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>