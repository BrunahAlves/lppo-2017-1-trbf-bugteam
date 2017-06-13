<%-- 
    Document   : editar-tarefa
    Created on : 12/06/2017, 21:41:19
    Author     : Adriano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Tarefa</title>
    </head>
    <body>
        <h1>Editar Tarefa</h1>
        <form method="post">
            <label>Id: <input name="id" type="hidden" value="${tarefa.id}" />${tarefa.id}</label>
            <label>Titulo: <input type="text" name="titulo" /></label>
            <label>Descrição: <input type="text" name="descricao" /></label>
            <label>Data prevista para conclusão: <input type="datetime" name="dt_concluir" /></label>
            <label>Data da conclusão: <input type="datetime" name="dt_concluida" /></label>
            <input type="submit" />
        </form>

    </body>
</html>
