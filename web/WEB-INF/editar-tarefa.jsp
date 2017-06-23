<%-- 
    Document   : editar-tarefa
    Created on : 12/06/2017, 21:41:19
    Author     : Adriano
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page errorPage="../ERROS/erro.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Tarefa</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Editar Tarefa!</h3>
            </div> 
            <div class="panel-body">
                <center>
                    <form method="post" style="width: 70%; text-align: left">
                        <label>Id:</label>
                        <input class="form-control" name="id" value="${tarefas.id}" readonly="readonly" />
                        <label>Titulo:</label>
                        <input class="form-control" type="text" name="titulo" value="${tarefas.titulo}" />
                        <label>Descrição:</label>
                        <input class="form-control" type="text" name="descricao" value="${tarefas.descricao}" />
                        <label>Data prevista para conclusão:</label>
                        <input class="form-control" type="text" name="dt-concluir" value="<fmt:formatDate value="${tarefas.data_concluir}" type="date" dateStyle="default" />" />
                        <label>Data da conclusão:</label>
                        <input class="form-control" type="text" name="dt-concluida" value="<fmt:formatDate value="${tarefas.data_conclusao}" type="date" dateStyle="default" />"/>
                        <br>
                        <div class="form-group col-md-3 col-sm-3 pull-right" >
                            <input type="submit" class="btn btn-primary" value="Cadastrar"/>
                        </div>
                    </form>
                </center>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>