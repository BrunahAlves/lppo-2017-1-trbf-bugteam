<%-- 
    Document   : editar-usuario
    Created on : 11/06/2017, 12:10:30
    Author     : Bruna Alves
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Usuario</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <div class="panel panel-primary" style="margin:20px;">
            <div class="panel-heading">
                <h3 class="panel-title" style="text-align: center;">Editar Usuário!</h3>
            </div> 
            <div class="panel-body">
                <center>
                    <form method="post" style="width: 70%; text-align: left">
                        <label>Id:</label>
                        <input class="form-control" name="id" value="${usuario.id}" readonly="readonly"/>
                        <label>Nome Completo:</label>
                        <input class="form-control" name="nomecompleto" value="${usuario.nomecompleto}"/>
                        <label>Email:</label>
                        <input class="form-control" name="email" value ="${usuario.email}"/>
                        <label>Senha:</label>
                        <input class="form-control" name="senha" value="${usuario.senha}"/>
                        <br>
                        <div class="form-group col-md-3 col-sm-3 pull-right" >
                            <input type="submit" class="btn btn-primary" value="Cadastrar"/>
                        </div>
                    </form>
                </center>
            </div>
        </div>
        <%@include file="jspf/rodape.jspf" %>