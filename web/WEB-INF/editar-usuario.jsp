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
        <h1>Editar Usuario</h1>
        <form method="post">
            <label>Id: <input name="id" type="hidden" value="${usuario.id}" />${usuario.id}</label>
            <label>Nome Completo: <input name="nomecompleto" value="${usuario.nomecompleto}"/></label>
            <label>Email: <input name="email" value ="${usuario.email}"/></label>
            <label>Senha: <input name="senha" value="${usuario.senha}"/></label>
            <input type="submit" />
        </form>
    </body>
</html>
