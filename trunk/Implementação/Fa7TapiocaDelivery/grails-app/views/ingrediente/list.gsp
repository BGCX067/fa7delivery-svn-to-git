<%@ page import="fa7tapiocadelivery.Ingrediente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ingrediente.label', default: 'Ingrediente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
	    <div class="nav">
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
                            <g:sortableColumn property="id" title="${message(code: 'ingrediente.id.label', default: 'Id')}" />

                            <g:sortableColumn property="nome" title="${message(code: 'ingrediente.nome.label', default: 'Nome')}" />
                        
                            <g:sortableColumn property="preco" title="${message(code: 'ingrediente.preco.label', default: 'Preco')}" />
                        
                            <g:sortableColumn property="qtdeCalorias" title="${message(code: 'ingrediente.qtdeCalorias.label', default: 'Qtde Calorias')}" />
                        
                            <g:sortableColumn property="porcao" title="${message(code: 'ingrediente.porcao.label', default: 'Porcao')}" />
                        
                            <g:sortableColumn property="tipo" title="${message(code: 'ingrediente.tipo.label', default: 'Tipo')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ingredienteInstanceList}" status="i" var="ingredienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ingredienteInstance.id}">${fieldValue(bean: ingredienteInstance, field: "id")}</g:link></td>
                    
                            <td>${fieldValue(bean: ingredienteInstance, field: "nome")}</td>

                            <td>${fieldValue(bean: ingredienteInstance, field: "preco")}</td>
                        
                            <td>${fieldValue(bean: ingredienteInstance, field: "qtdeCalorias")}</td>
                        
                            <td>${fieldValue(bean: ingredienteInstance, field: "porcao")}</td>
                        
                            <td>${fieldValue(bean: ingredienteInstance, field: "tipo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ingredienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
