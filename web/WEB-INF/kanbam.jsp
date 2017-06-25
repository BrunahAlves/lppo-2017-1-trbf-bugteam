<%-- 
    Document   : kanbam
    Created on : 20/06/2017, 23:19:04
    Author     : Adriano
--%>

<%@page errorPage="../ERROS/erro.jsp"%>
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
                <strong>Tarefas por usuário:</strong>
                <form method="post">
                    <select name="usuario" class=""> 
                        <option value="0">Todos Usuários</option>
                        <c:forEach var="etiqueta" items="${etiquetas}">  
                            <option value="${etiqueta.usuario.id}">${etiqueta.usuario.nomecompleto}</option>  
                        </c:forEach>  
                    </select>
                    <input type="submit" value="Filtrar" /><p></p>
                </form>
                <center>
                    <div id="board">
                        <div id="todo" class="section">
                            <h1>A Fazer</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo == 1}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                        <div id="doing" class="section">
                            <h1>Fazendo</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo == 2}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                        <div id="done" class="section">
                            <h1>Bloqueado</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo == 3}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                        <div id="doing" class="section">
                            <h1>Feito</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo == 4}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                    </div>  
                </center>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>
