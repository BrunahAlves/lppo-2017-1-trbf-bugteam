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
                <th>Referência para um autor</th>
                <th>Referência para uma tarefa</th>
                <th>Título</th>
            </tr>
            <c:forEach var="etiqueta" items="${etiquetas}">
            <tr>
                <td>${etiqueta.id}</a></td>
                <td>${etiqueta.referencia_autor}</td>
                <td>${etiqueta.referencia_tarefa}</td>
                <td>${etiqueta.titulo}</td>
            </tr>
            </c:forEach>
        </table>
    </body>
</html>