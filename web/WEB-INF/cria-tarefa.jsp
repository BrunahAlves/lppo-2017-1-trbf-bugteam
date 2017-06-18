<%-- 
    Document   : cria-tarefa
    Created on : 12/06/2017, 20:43:13
    Author     : Adriano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nova Tarefa</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <h1>Nova Tarefa</h1>
        <form method="post">
            <label>Titulo: <input type="text" name="titulo" /></label>
            <label>Descrição: <input type="text" name="descricao" /></label>
            <label>Data prevista para conclusão: <input type="datetime" name="dt_concluir" /></label>
            <input type="submit" />
        </form>
    </body>
</html>