
<%@ page import="fa7tapiocadelivery.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Pedido')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="listSol"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${pedidoInstance}">
              <div class="errors">
                <g:renderErrors bean="${pedidoInstance}" as="list" />
            </div>
            </g:hasErrors>

            <g:if test="${session.user}">
              <br />
              Logado como: ${session.user.nome} | <g:link action="logout">logout</g:link>
            </g:if>

            <g:form action="save" method="post" >
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
                                    <label for="quantidade"><g:message code="pedido.quantidade.label" default="Quantidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'quantidade', 'errors')}">
                                    <g:textField name="quantidade" value="${fieldValue(bean: pedidoInstance, field: 'quantidade')}" />
                                </td>
                            </tr>

                            <!--
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="valor"><g:message code="pedido.valor.label" default="Valor" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'valor', 'errors')}">
                                    <g:textField name="valor" value="${fieldValue(bean: pedidoInstance, field: 'valor')}" />
                                </td>
                            </tr>
                            -->
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="pedido.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'status', 'errors')}">
                                    <g:textField name="status" value="S" readonly="yes"/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="descricao"><g:message code="pedido.descricao.label" default="Descricao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'descricao', 'errors')}">
                                    <g:textField name="descricao" value="${pedidoInstance?.descricao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dataPedido"><g:message code="pedido.dataPedido.label" default="Data Pedido" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoInstance, field: 'dataPedido', 'errors')}">
                                    <g:textField name="dataPedido" value="10/06/2010" readonly="yes"/>
                                </td>
                            </tr>


                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="cardapios"><g:message code="pedido.cardapios.label" default="Itens Cardapio" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: pedidoIntance, field: 'cardapios', 'errors')}">
                                    <g:select name="cardapios" from="${fa7tapiocadelivery.Cardapio.list()}" multiple="yes" optionKey="id" size="5" value="${pedidoInstance?.cardapios}" />
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
