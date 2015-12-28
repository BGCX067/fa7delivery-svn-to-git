<%@ page import="fa7tapiocadelivery.MontarTapioca" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'montarTapioca.label', default: 'MontarTapioca')}" />

<title>${fieldValue(bean: montarTapiocaInstance, field: "nome")} - Detalhes</title>
</head>

<body>
<!--MENU-->
<div class="nav">
	<span class="menuButton">
		<g:link class="list" action="list">Tapiocas Montadas</g:link>
	</span>
	<span class="menuButton">
		<g:link class="create" action="create">Nova Tapioca</g:link>
	</span>
</div>
<!--MENU-->
	
<!--CONTENT-->
<div class="body">
<h1>Detalhes da <strong>${fieldValue(bean: montarTapiocaInstance, field: "nome")}</strong></h1>
<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if>
<div class="dialog">
	<table>
		<tbody>
		<tr class="prop">
			<td valign="top" class="name"><g:message code="montarTapioca.id.label" default="Id" /></td>
			<td valign="top" class="value">${fieldValue(bean: montarTapiocaInstance, field: "id")}</td>
		</tr>
		<tr class="prop">
			<td valign="top" class="name"><g:message code="montarTapioca.nome.label" default="Nome" /></td>
			<td valign="top" class="value">${fieldValue(bean: montarTapiocaInstance, field: "nome")}</td>
		</tr>
		<tr class="prop">
			<td valign="top" class="name">
			<g:message code="montarTapioca.ingredientes.label" default="Ingredientes" />
			</td>
			<td valign="top" class="value">${fieldValue(bean: montarTapiocaInstance, field: "ingredientes")}</td>
		</tr>
		<tr class="prop">
			<td valign="top" class="name"><g:message code="montarTapioca.preco.label" default="Preco" /></td>
			<td valign="top" class="value">${fieldValue(bean: montarTapiocaInstance, field: "preco")}</td>
		</tr>
		</tbody>
	</table>
</div>

<!--BOTOES-->
<div class="buttons">
	<g:form>
		<g:hiddenField name="id" value="${montarTapiocaInstance?.id}" />
		<!--span class="button">
			<g:actionSubmit class="edit" action="edit" value="Editar" />
		</span-->
		<span class="button">
			<g:actionSubmit class="delete" action="delete" value="Deletar" 
			onclick="return confirm('Deseja deletar essa Tapioca?');" />
		</span>
	</g:form>
</div>
</div>
<!--CONTENT-->
</body>
</html>