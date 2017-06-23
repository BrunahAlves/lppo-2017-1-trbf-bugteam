<%-- 
    Document   : listar-etiquetasporautor
    Created on : 18/06/2017, 17:40:21
    Author     : Bruna Alves
--%>

<%@page errorPage="../ERROS/erro.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar etiquetas por autor e título</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Listar etiquetas por autor e titulo</h3>
            </div> 
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Id Autor</th><br>
                        <th>Nome Autor</th><br>
                        <th>Titulo tarefa</th><br>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="etiqueta" items="${etiquetas}">
                                <tr>
                                    <td>${etiqueta.id}</a></td>
                                    <td>${etiqueta.usuario.id}</td>
                                    <td>${etiqueta.usuario.nomecompleto}</td>
                                    <td>${etiqueta.tarefa.titulo}</td>
                                </tr>
                            </c:forEach>
                    </table>
                </div>
                <br>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>