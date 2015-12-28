<%@ page import="fa7tapiocadelivery.MontarTapioca" %>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'montarTapioca.label', default: 'MontarTapioca')}" />
<title>Montar Tapioca - Listar :: FA7 Tapioca Delivery</title>
</head>

<body>
<!--SUBMENU-->
<div class="nav">
	<span class="menuButton">
		<g:link class="create" action="create">Nova tapioca</g:link>
	</span>
</div>
<!--/SUBMENU-->

<div class="body">
	<h1>Tapiocas montadas</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<div class="list">
		<table>
		<!--TOPO TABELA-->
		<thead>
			<tr>
			<g:sortableColumn property="nome" title="${message(code: 'montarTapioca.nome.label', default: 'Nome')}" />
			<g:sortableColumn property="ingredientes" title="${message(code: 'montarTapioca.ingredientes.label', default: 'Ingredientes')}" />
			<g:sortableColumn property="preco" title="${message(code: 'montarTapioca.preco.label', default: 'Preço')}" />
			<th class="sortable"><a href="#">Excluir</a></td>
			</tr>
		</thead>
		<!--/TOPO TABELA-->
		<!--APRESENTA RESULTADOS-->
		<tbody>
			<g:each in="${montarTapiocaInstanceList}" status="i" var="montarTapiocaInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
				<td><g:link action="show" id="${montarTapiocaInstance.id}">${fieldValue(bean: montarTapiocaInstance, field: "nome")}</g:link></td>
				<td>${fieldValue(bean: montarTapiocaInstance, field: "ingredientes")}</td>
				<td>R$ ${fieldValue(bean: montarTapiocaInstance, field: "preco")}</td>
				<td>
					<g:form>
						<g:hiddenField name="id" value="${montarTapiocaInstance?.id}" />
						<input type="image" src="/Fa7TapiocaDelivery/images/skin/database_delete.png" 
						name="_action_delete" value="delete" class="delete"
						onclick="return confirm('Deseja deletar a essa tapioca?');" />
					</g:form>
				</td>
			</tr>
			</g:each>
		</tbody>
		<!--/APRESENTA RESULTADOS-->
	</table>
</div>
<div class="paginateButtons">
	<g:paginate total="${montarTapiocaInstanceTotal}" />
</div>
</div>
</body>
</html>
