
<%@ page import="fa7tapiocadelivery.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="listSol" action="listSol"><g:message code="Pedidos Solicitados" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="Novo Pedido" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pedidoInstance}">
            <div class="errors">
                <g:renderErrors bean="${pedidoInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${pedidoInstance?.id}" />
                <g:hiddenField name="version" value="${pedidoInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cliente">Cliente</label>
                                </td>
                                <td valign="top" class="value">
                                        ${session.user.nome}
                                        <g:hiddenField name="cliente.id" value="${session?.user?.id}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="dataPedido"><g:message code="pedido.dataPedido.label" default="Data Pedido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'dataPedido', 'errors')}">
                                    <g:textField name="dataPedido" value="${pedidoInstance?.dataPedido}"  readonly="true" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descricao"><g:message code="pedido.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${pedidoInstance?.descricao}"  readonly="true" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="quantidade"><g:message code="pedido.quantidade.label" default="Quantidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'quantidade', 'errors')}">
                                    <g:textField name="quantidade" value="${fieldValue(bean: pedidoInstance, field: 'quantidade')}" readonly="true" />
                                </td>
                            </tr>
                            <!--
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="valor"><g:message code="pedido.valor.label" default="Valor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'valor', 'errors')}">
                                    <g:textField name="valor" value="${fieldValue(bean: pedidoInstance, field: 'valor')}"  readonly="true" />
                                </td>
                            </tr>
                            -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="status"><g:message code="pedido.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="${pedidoInstance?.status}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cardapios"><g:message code="pedido.cadapios.label" default="Itens Cardapio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: cardapioInstance, field: 'cardapios', 'errors')}">
                                    <g:select name="cardapios" from="${fa7tapiocadelivery.Cardapio.list()}" multiple="yes" optionKey="id" size="5" value="${pedidoInstance?.cardapios}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
