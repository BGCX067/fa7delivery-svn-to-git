
<%@ page import="fa7tapiocadelivery.Cardapio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'cardapio.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="porcao" title="${message(code: 'cardapio.porcao.label', default: 'Porcao')}" />
                        
                            <g:sortableColumn property="tipo" title="${message(code: 'cardapio.tipo.label', default: 'Tipo')}" />
                        
                            <g:sortableColumn property="nome" title="${message(code: 'cardapio.nome.label', default: 'Nome')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${cardapioInstanceList}" status="i" var="cardapioInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${cardapioInstance.id}">${fieldValue(bean: cardapioInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: cardapioInstance, field: "porcao")}</td>
                        
                            <td>${fieldValue(bean: cardapioInstance, field: "tipo")}</td>
                        
                            <td>${fieldValue(bean: cardapioInstance, field: "nome")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${cardapioInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
