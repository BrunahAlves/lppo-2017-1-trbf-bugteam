<%-- 
    Document   : listar-tarefas
    Created on : 12/06/2017, 21:35:28
    Author     : Adriano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listar Tarefas</title>
    </head>
    <body>
        <%@include file="jspf/menu.jspf" %>
        <h1>Listar Tarefas</h1>
        <table>
            <tr>
                <th>Id</th>
                <th>Titulo da tarefa</th><br>
                <th>Descrição da tarefa</th><br>
                <th>Data Prevista para conclusão</th><br>
                <th>Ações</th>
            </tr>
        <c:forEach var="tarefa" items="${tarefas}">
            <tr>
                <td><a href="editarTarefa.html?id=${tarefa.id}">${tarefa.id}</a></td>
                <td>${tarefa.titulo}</td>
                <td>${tarefa.descricao}</td>
                <td>${tarefa.data_concluir}</td>
                <td><a href="excluirTarefa.html?id=${tarefa.id}">&#128465;</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
