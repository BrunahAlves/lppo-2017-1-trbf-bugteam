<%-- 
    Document   : cria-etiqueta
    Created on : 11/06/2017, 21:07:41
    Author     : Bruna Alves
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cria Etiqueta</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <h1>Cria etiqueta!</h1>
        <form method="post">
            <label>Referencia para um autor: <input name="usuario_id" /></label>
            <label>Referência para uma tarefa: <input name="tarefa_id" /></label>
            <label>Titulo: <input name="titulo" /></label>
            <input type="submit" />
    </body>
</html>
