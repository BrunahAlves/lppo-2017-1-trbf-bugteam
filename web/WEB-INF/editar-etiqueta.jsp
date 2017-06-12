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
        <h1>Editar etiqueta!</h1>
        <form method="post">
            <label>Id: <input name="id" type="hidden" value="${etiqueta.id}" />${etiqueta.id}</label>
            <label>Referência para um autor: <input name="referencia_autor" value="${etiqueta.referencia_autor}"/></label>
            <label>Referência para uma tarefa: <input name="referencia_tarefa" value ="${etiqueta.referencia_tarefa}"/></label>
            <label>Titulo: <input name="titulo" value="${etiqueta.titulo}"/></label>
            <input type="submit" />
        </form>
    </body>
</html>
