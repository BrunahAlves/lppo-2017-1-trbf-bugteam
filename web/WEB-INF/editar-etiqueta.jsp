<%-- 
    Document   : editar-etiqueta
    Created on : 11/06/2017, 21:16:32
    Author     : Bruna Alves
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar etiqueta</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Editar etiqueta!</h3>
            </div> 
            <div class="panel-body">
                <center>
                    <form method="post" style="width: 70%; text-align: left">
                        <label>Id:</label>
                        <input class="form-control" name="id" type="hidden" value="${etiqueta.id}" readonly="readonly" />
                        <label>Referência para um autor:</label>
                        <input class="form-control" name="usuario_id" value="${etiqueta.usuario.id}"/>
                        <label>Referência para uma tarefa:</label>
                        <input class="form-control" name="tarefa_id" value ="${etiqueta.tarefa.id}"/>
                        <label>Titulo:</label>
                        <input class="form-control" name="titulo" value="${etiqueta.titulo}"/>
                        <br>
                        <div class="form-group col-md-3 col-sm-3 pull-right" >
                            <input type="submit" class="btn btn-primary" value="Cadastrar"/>
                        </div>
                    </form>
                </center>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>          