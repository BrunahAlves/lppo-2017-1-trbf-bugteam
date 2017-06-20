<%-- 
    Document   : listar-etiquetasporautor
    Created on : 18/06/2017, 17:40:21
    Author     : Bruna Alves
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar etiquetas por autor</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Listar etiquetas por autor</h3>
            </div> 
            <div class="panel-body">
                <div class="table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>

                                <th>Nome do autor</th>
                        <select name="blabla">  
                            <c:forEach var="etiqueta" items="${etiquetas}">  
                                <option value="${etiqueta.usuario.nomecompleto}">${etiqueta.usuario.nomecompleto}</option>  
                            </c:forEach>  
                        </select><br>
                        <th>Título da etiqueta</th><br>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="etiqueta" items="${etiquetas}">
                                <tr>
                                    <td>${etiqueta.usuario.nomecompleto}</td>
                                    <td>${etiqueta.titulo}</td>


                                </tr>
                            </c:forEach>          
                        </tbody>
                    </table>
                </div>
                <br>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>