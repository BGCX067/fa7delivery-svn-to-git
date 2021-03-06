
<%@ page import="fa7tapiocadelivery.Ingrediente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'ingrediente.label', default: 'Ingrediente')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ingredienteInstance}">
            <div class="errors">
                <g:renderErrors bean="${ingredienteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="ingrediente.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${ingredienteInstance?.nome}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="qtdeCalorias"><g:message code="ingrediente.qtdeCalorias.label" default="Qtde Calorias" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'qtdeCalorias', 'errors')}">
                                    <g:textField name="qtdeCalorias" value="${fieldValue(bean: ingredienteInstance, field: 'qtdeCalorias')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="porcao"><g:message code="ingrediente.porcao.label" default="Porcao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'porcao', 'errors')}">
                                    <g:textField name="porcao" value="${ingredienteInstance?.porcao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo"><g:message code="ingrediente.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'tipo', 'errors')}">
                                    <g:textField name="tipo" value="${ingredienteInstance?.tipo}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="preco"><g:message code="ingrediente.preco.label" default="Preco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ingredienteInstance, field: 'preco', 'errors')}">
                                    <g:textField name="preco" value="${fieldValue(bean: ingredienteInstance, field: 'preco')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
