
<%@ page import="fa7tapiocadelivery.Pedido" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'pedido.label', default: 'Consultar Status Pedido')}" />
    </head>
    <body>
	<div class="nav">
		 <span class="menuButton"><a href="http://google.com/">Teste</a></span>
		</div>
	    <h1> Consultar Status </h1>
        <p> Entre com o numero do pedido para consultar o status </p>
		
		 <g:hasErrors bean="${pedido}">
			<div class="errors">
				<g:renderErrors bean="${pedido}"></g:renderErrors>
			</div>
	    </g:hasErrors>
        <div class="body">
			<g:form action="consultarstatus" name="consultarstatusForm">
			    <br>
				<div class="formField">            
					<label for="pedido">Numero Pedido:</label>
					<g:textField name="id" value="${pedidoInstance?.id}"/>
					<!-- <g:set var="numPedido" value="${pedidoInstance?.id}" />
					-->
				</div>
				<div class="buttons">
					<span class="button"><g:actionSubmit class="consultarstatus" action="consultarstatus" value="${message(code: 'default.button.status.label', default: 'Pesquisar Status')}" /></span>
				</div>
			</g:form>
			
			<g:if test="${pedido?.id != null}">
				<table>
					<tbody>
						<br>
							<tr class="prop">
							<td valign="top" class="name"><b>Status do pedido ${fieldValue(bean: pedido, field: "id")}:</td>	
							<td valign="top" class="value">${fieldValue(bean: pedido, field: "status")}</td>
						</tr>
					</tbody>
				</table>
			</g:if>	 	
        </div>
    </body>
</html>
