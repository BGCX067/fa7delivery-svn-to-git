<%@ page import="fa7tapiocadelivery.MontarTapioca" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName" value="${message(code: 'montarTapioca.label', default: 'MontarTapioca')}" />
<title>Montar Tapioca - Cadastro</title>

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
</div>
<!--/SUBMENU-->

<div class="body">
<h1>Montar nova tapioca</h1>
<g:if test="${flash.message}">
	<div class="message">${flash.message}</div>
</g:if>

<g:hasErrors bean="${montarTapiocaInstance}">
	<div class="errors">
		<g:renderErrors bean="${montarTapiocaInstance}" as="list" />
	</div>
</g:hasErrors>

<!--FORMULARIO-->
<g:form action="save" method="post" name="cadastro" id="cadastro">
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
					<tr class="prop">
						<td valign="top" class="name">
							<label for="ingredientes">
								<g:message code="cardapio.ingredientes.label" default="Ingredientes" />
							</label>
						</td>
						<td valign="top" 
						class="value ${hasErrors(bean: cardapioInstance, field: 'ingredientes', 'errors')}">
							<g:select name="ingredientes" id="ingredientes" onchange="qtdIngredientes(this)"
							from="${fa7tapiocadelivery.Ingrediente.list()}" multiple="yes" optionKey="id" 
							size="5" value="${cardapioInstance?.ingrediente}" />
						</td>
					</tr>
				</td>
			</tr>
			
			<tr class="prop">
				<td valign="top" class="name">
					<label for="preco"><g:message code="montarTapioca.preco.label" default="Preco" /></label>
				</td>
				
				<td valign="top" class="value ${hasErrors(bean: montarTapiocaInstance, field: 'preco', 'errors')}">
					<g:textField readonly="readonly" name="preco" id="preco" 
					value="${fieldValue(bean: montarTapiocaInstance, field: 'preco')}" /> 
					<span class="button">
					<input type="button" name="calcular" class="calcular" value="Calcular preço" 
					onclick="calcularPreco(preco)" >
					</span>
				</td>
			</tr>
			</tbody>
		</table>
	</div>
	
	<!--BOTOES-->
	<div class="buttons">
		<span class="button">
		<g:submitButton name="create" class="save" value="Montar" />
		</span>
	</div>
	<!--/BOTOES-->
	
</g:form>
<!--/FORMULARIO-->
</div>
</body>
</html>