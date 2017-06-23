<%-- 
    Document   : cria-tarefa
    Created on : 12/06/2017, 20:43:13
    Author     : Adriano
--%>

<%@page errorPage="../ERROS/erro.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Tarefa</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Nova Tarefa!</h3>
            </div> 
            <div class="panel-body">
                <center>
                    <form method="post" style="width: 70%; text-align: left">
                        <label>Titulo:</label>
                        <input class="form-control" type="text" name="titulo"/>
                        <label>Descrição:</label>
                        <input class="form-control" type="text" name="descricao"/>
                        <label>Data prevista para conclusão:</label>
                        <input class="form-control" type="text" name="dt-concluir"/>
                        <br>
                        <div class="form-group col-md-3 col-sm-3 pull-right" >
                            <input type="submit" class="btn btn-primary" value="Cadastrar"/>
                        </div>
                    </form>
                </center>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>