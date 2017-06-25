<%--
    Document   : index
    Created on : 18/06/2017, 22:42:45
    Author     : Adriano
--%>
<%@page errorPage="ERROS/erro.jsp"%>
<%@include file="WEB-INF/jspf/menu.jspf" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="panel panel-primary" style="margin:20px;">
    <center>
        <img src="imagens/logo.png" class="img-responsive">
    <br>
    <br>
    <table class="table-responsive table-condensed text-primary " style="font-size: 20px; margin-left: 45px;" >
        <thead>
            <tr>
                <th>Alunos</th>
                <th>&nbsp;&nbsp;&nbsp;</th>
                <th>Matrícula</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Adriano Xavier</td>
                <td></td>
                <td>02539624</td>
            </tr>
            <tr>
                <td>Bruna Alves</td>
                <td></td>
                <td>02536269</td>
            </tr>
        </tbody>
    </table>
    </center>
</div>
<%@include file="WEB-INF/jspf/rodape.jspf" %>
