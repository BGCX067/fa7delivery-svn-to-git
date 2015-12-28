
<%@ page import="fa7tapiocadelivery.Cardapio" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cardapio.label', default: 'Cardapio')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${cardapioInstance}">
            <div class="errors">
                <g:renderErrors bean="${cardapioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="cardapio.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardapioInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" value="${cardapioInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="porcao"><g:message code="cardapio.porcao.label" default="Porcao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardapioInstance, field: 'porcao', 'errors')}">
                                    <g:textField name="porcao" value="${fieldValue(bean: cardapioInstance, field: 'porcao')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo"><g:message code="cardapio.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardapioInstance, field: 'tipo', 'errors')}">
                                    <g:textField name="tipo" value="${cardapioInstance?.tipo}" />
                                </td>
                            </tr>
                        
                            

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="ingredientes"><g:message code="cardapio.ingredientes.label" default="Ingredientes" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardapioInstance, field: 'ingredientes', 'errors')}">
                                    <g:select name="ingredientes" from="${fa7tapiocadelivery.Ingrediente.list()}" multiple="yes" optionKey="id" size="5" value="${cardapioInstance?.ingredientes}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
                <br/>
            </g:form>

        </div>
    </body>
</html>
