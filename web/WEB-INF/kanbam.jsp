<%-- 
    Document   : kanbam
    Created on : 20/06/2017, 23:19:04
    Author     : Adriano
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Quadro Kanban</title>
        <link href="css/bootstrap.css" rel="stylesheet">
        <link href="css/kanban.css" rel="stylesheet">
        <script src="js/kanban.js"></script>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Quadro Kanban</h3>
            </div> 
            <div class="panel-body">
        <div id="board">
            <div id="todo" class="section">
                <h1>A Fazer</h1>
                <c:forEach var="etiquetas" items="${etiquetas}">
                    <div id="c2" class="card">${etiquetas.titulo}</div>
                </c:forEach>
            </div>
            <div id="doing" class="section">
                <h1>Fazendo</h1>
                <c:forEach var="etiquetas" items="${etiquetas}">
                    <div id="c2" class="card">${etiquetas.titulo}</div>
                </c:forEach>
            </div>
            <div id="done" class="section">
                <h1>Bloqueado</h1>
                <c:forEach var="etiquetas" items="${etiquetas}">
                    <div id="c2" class="card">${etiquetas.titulo}</div>
                </c:forEach>
            </div>
            <div id="doing" class="section">
                <h1>Feito</h1>
                <c:forEach var="etiquetas" items="${etiquetas}">
                    <div id="c2" class="card">${etiquetas.titulo}</div>
                </c:forEach>
            </div>
        </div>  
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>
        