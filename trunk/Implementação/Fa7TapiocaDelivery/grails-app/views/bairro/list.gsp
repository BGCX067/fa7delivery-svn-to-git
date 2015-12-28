
<%@ page import="fa7tapiocadelivery.Bairro" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'bairro.label', default: 'Bairro')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'bairro.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descricao" title="${message(code: 'bairro.descricao.label', default: 'Descricao')}" />
                        
                            <th><g:message code="bairro.estabelecimento.label" default="Estabelecimento" /></th>
                   	    
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${bairroInstanceList}" status="i" var="bairroInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${bairroInstance.id}">${fieldValue(bean: bairroInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: bairroInstance, field: "descricao")}</td>
                        
                            <td>${fieldValue(bean: bairroInstance, field: "estabelecimento")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${bairroInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
