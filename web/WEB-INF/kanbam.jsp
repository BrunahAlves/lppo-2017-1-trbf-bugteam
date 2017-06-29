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
                    <select name="usuario">  
                        <c:forEach var="usuarios" items="${usuarios}">  
                            <option value="${usuarios.id}">${usuarios.nomecompleto}</option>  
                        </c:forEach> 
                    </select>
                    <input class="btn-primary" type="submit" value="Pesquisar" /><p>
                </form>
                <center>
                    <div id="board">
                        <div id="todo" class="section" style="width: 200px">
                            <h1>A Fazer</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo == 'A Fazer'}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                        <div id="doing" class="section" style="width: 200px">
                            <h1>Fazendo</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo == 'Fazendo'}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                        <div id="done" class="section" style="width: 200px">
                            <h1>Bloqueado</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo == 'Bloqueado'}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                        <div id="doing" class="section" style="width: 200px">
                            <h1>Feito</h1>
                            <c:forEach var="etiquetas" items="${etiquetas2}">
                                <c:if test="${etiquetas.titulo =='Feito'}">
                                    <div id="c2" class="card">${etiquetas.tarefa.titulo}</div><p>
                                    </c:if>
                                </c:forEach>
                        </div>
                    </div>  
                </center>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>
