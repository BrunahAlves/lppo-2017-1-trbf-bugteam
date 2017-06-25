<%-- 
    Document   : listar-etiquetas
    Created on : 11/06/2017, 20:23:32
    Author     : Bruna Alves
--%>

<%@page errorPage="../ERROS/erro.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar etiquetas</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Listar etiquetas!</h3>
            </div> 
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Referência para um autor</th><br>
                        <th>Referência para uma tarefa</th><br>
                        <th>Título</th><br>
                        <th>Ações</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="etiqueta" items="${etiquetas}">
                                <tr>
                                    <td><a href="editarEtiqueta.html?id=${etiqueta.id}">${etiqueta.id}</a></td>
                                    <td><a href="listar.html?id=${etiqueta.id}">${etiqueta.usuario.nomecompleto}</td>
                                    <td><a href="listarTarefa.html?id=${etiqueta.tarefa.id}">${etiqueta.tarefa.titulo}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${etiqueta.titulo == 1}">
                                                A fazer
                                            </c:when>
                                            <c:when test="${etiqueta.titulo == 2}">
                                                Fazendo
                                            </c:when>
                                            <c:when test="${etiqueta.titulo == 3}">
                                                Bloqueado
                                            </c:when>
                                            <c:when test="${etiqueta.titulo == 4}">
                                                Feito
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td><a href="excluirEtiqueta.html?id=${etiqueta.id}">&#128465;</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <br>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>