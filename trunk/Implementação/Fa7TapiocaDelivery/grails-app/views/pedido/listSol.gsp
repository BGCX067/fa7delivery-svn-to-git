
<%@ page import="fa7tapiocadelivery.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
        <title><g:message code="Pedido Solicitado" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Novo Pedido" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="listExe" action="listExe"><g:message code="Pedidos em Execução" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="listCan" action="listCan"><g:message code="Pedidos Cancelados" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="listCan" action="preparestatus"><g:message code="Acompanhar Status Pedido" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="Pedidos Solicitados" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="listSol">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'pedido.id.label', default: 'Id')}" />

                            <th><g:message code="pedido.cliente.label" default="Cliente" /></th>

                            <g:sortableColumn property="descricao" title="${message(code: 'pedido.descricao.label', default: 'Descricao')}" />

                            <g:sortableColumn property="quantidade" title="${message(code: 'pedido.quantidade.label', default: 'Quantidade')}" />
                        
                            <g:sortableColumn property="valor" title="${message(code: 'pedido.valor.label', default: 'Valor')}" />
                        
                            <g:sortableColumn property="status" title="${message(code: 'pedido.status.label', default: 'Status')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${pedidoInstanceList}" status="i" var="pedidoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="edit" id="${pedidoInstance.id}">${fieldValue(bean: pedidoInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: pedidoInstance, field: "cliente.nome")}</td>

                            <td>${fieldValue(bean: pedidoInstance, field: "descricao")}</td>

                            <td>${fieldValue(bean: pedidoInstance, field: "quantidade")}</td>
                        
                            <td>${fieldValue(bean: pedidoInstance, field: "valor")}</td>
                        
                            <td>${fieldValue(bean: pedidoInstance, field: "status")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${pedidoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
