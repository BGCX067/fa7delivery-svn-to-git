<%@ page import="fa7tapiocadelivery.MontarTapioca" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'montarTapioca.label', default: 'MontarTapioca')}" />
<title>${fieldValue(bean: montarTapiocaInstance, field: "nome")} - Editar</title>
<script type="text/javascript">
	function qtdIngredientes(idForm) {
		var marcados = 0;
		for (i = 0; i < idForm.options.length; i++) {
			if (idForm.options[i].selected) {
				marcados++;
			}
		}
		if (marcados > 3) {
			for (var j = idForm.options.length - 1; j >= 0; j--){
				if (idForm.options[j].selected == true) {
					idForm.options[j].selected = false;
				}
			}
			alert("Foram marcados "+marcados+" ingredientes. Limite: 3.");
		}
	}
	function calcularPreco(preco) {
		var precoFinal = 1.0;
		
		for (var j = ingredientes.options.length - 1; j >= 0; j--){
			if (ingredientes.options[j].selected == true) {
				var nomePreco = document.cadastro.ingredientes.options[j].text;
				var preco = nomePreco.split(" - ");
				
				precoFinal = precoFinal + parseFloat(preco[1]);
			}
		}
		
		//var randomnumber = Math.random() * (5 - 2) + 2;
		//randomnumber = Math.round(randomnumber*100)/100;
		document.getElementById('preco').value = precoFinal;
	}
</script>
</head>
<body>
<!--SUBMENU-->
<div class="nav">
	<span class="menuButton">
		<g:link class="list" action="list">Tapiocas Montadas</g:link>
	</span>
	<span class="menuButton">
		<g:link class="create" action="create">Nova tapioca</g:link>
	</span>
</div>
<!--/SUBMENU-->

<div class="body">
	<h1>${fieldValue(bean: montarTapiocaInstance, field: "nome")} - Editar</h1>
	<g:if test="${flash.message}">
		<div class="message">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${montarTapiocaInstance}">
		<div class="errors">
			<g:renderErrors bean="${montarTapiocaInstance}" as="list" />
		</div>
	</g:hasErrors>
	
	<!--FORMULARIO-->
	<g:form method="post" name="cadastro" id="cadastro" >
	<g:hiddenField name="id" value="${montarTapiocaInstance?.id}" />
	<g:hiddenField name="version" value="${montarTapiocaInstance?.version}" />
	<div class="dialog">
		<table>
		<tbody>
			<tr class="prop">
				<td valign="top" class="name">
					<label for="nome"><g:message code="montarTapioca.nome.label" default="Nome" /></label>
				</td>
				<td valign="top" class="value ${hasErrors(bean: montarTapiocaInstance, field: 'nome', 'errors')}">
				<g:textField name="nome" value="${montarTapiocaInstance?.nome}" />
				</td>
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name">
				<label for="ingredientes">
					<g:message code="cardapio.ingredientes.label" default="Ingredientes" />
				</label>
				</td>
				<td class="value ${hasErrors(bean: cardapioInstance, field: 'ingredientes', 'errors')}" 
				valign="top" >
					<g:select name="ingredientes" id="ingredientes" onchange="qtdIngredientes(this)"
					from="${fa7tapiocadelivery.Ingrediente.list()}" multiple="yes" optionKey="id" size="5"
					value="${cardapioInstance?.ingrediente}" id="ingredientes" />
				</td>
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name">
					<label for="preco"><g:message code="montarTapioca.preco.label" default="Preco" /></label>
				</td>
				<td valign="top" class="value ${hasErrors(bean: montarTapiocaInstance, field: 'preco', 'errors')}">
					<g:textField name="preco" value="${fieldValue(bean: montarTapiocaInstance, field: 'preco')}" />
					<span class="button">
					<input type="button" name="calcular" class="calcular" value="Calcular preço" 
					onclick="calcularPreco(preco)">
					</span>
				</td>
			</tr>
		</tbody>
		</table>
	</div>
	<div class="buttons">
		<span class="button">
			<g:actionSubmit class="save" action="update" value="Concluir" />
		</span>
		<span class="button">
			<g:actionSubmit class="delete" action="delete" value="Deletar" 
			onclick="return confirm('Deseja deletar essa Tapioca?');" />
		</span>
	</div>
	</g:form>
	<!--/FORMULARIO-->
</div>
</body>
</html>
