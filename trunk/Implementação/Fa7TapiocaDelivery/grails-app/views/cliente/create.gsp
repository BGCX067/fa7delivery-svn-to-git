<%@ page import="fa7tapiocadelivery.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <script LANGUAGE="JavaScript">
        <!--
        function Verifica_CPF(formulario) {
        var CPF = formulario.cpf.value; // Recebe o valor digitado no campo


        // Aqui começa a checagem do CPF
        var POSICAO, I, SOMA, DV, DV_INFORMADO;
        var DIGITO = new Array(10);
        DV_INFORMADO = CPF.substr(9, 2); // Retira os dois últimos dígitos do número informado

        // Desemembra o número do CPF na array DIGITO
        for (I=0; I<=8; I++) {
          DIGITO[I] = CPF.substr( I, 1);
        }

        // Calcula o valor do 10º dígito da verificação
        POSICAO = 10;
        SOMA = 0;
           for (I=0; I<=8; I++) {
              SOMA = SOMA + DIGITO[I] * POSICAO;
              POSICAO = POSICAO - 1;
           }
        DIGITO[9] = SOMA % 11;
           if (DIGITO[9] < 2) {
                DIGITO[9] = 0;
        }
           else{
               DIGITO[9] = 11 - DIGITO[9];
        }

        // Calcula o valor do 11º dígito da verificação
        POSICAO = 11;
        SOMA = 0;
           for (I=0; I<=9; I++) {
              SOMA = SOMA + DIGITO[I] * POSICAO;
              POSICAO = POSICAO - 1;
           }
        DIGITO[10] = SOMA % 11;
           if (DIGITO[10] < 2) {
                DIGITO[10] = 0;
           }
           else {
                DIGITO[10] = 11 - DIGITO[10];
           }

        // Verifica se os valores dos dígitos verificadores conferem
        DV = DIGITO[9] * 10 + DIGITO[10];
           if (DV != DV_INFORMADO) {
              alert('CPF inválido');
              formulario.cpf.value = '';
              formulario.cpf.focus();
              return false;
           }
        }

        //adiciona mascara ao telefone
       
       function MascaraTelefone(telefone){
        }
        if(mascaraInteiro(telefone)==false){
                event.returnValue = false;
        }
        return formataCampo(telefone,'(00)0000-0000', event);
        }


        //-->
        </script>


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
            <g:hasErrors bean="${clienteInstance}">
            <div class="errors">
                <g:renderErrors bean="${clienteInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" name="formulario">
                <div class="dialog">
                    <table align="center">
                      <tbody align="center">
                        
                        <tr class="prop" align="center">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="cliente.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" size="35" value="${clienteInstance?.nome}" />
                                </td>
                            </tr>

                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cpf"><g:message code="cliente.cpf.label" default="Cpf" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'cpf', 'errors')}">
                                    <g:textField name="cpf" maxlength="11" value="${clienteInstance?.cpf}" />
                                </td>
                            </tr>

                                 <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email"><g:message code="cliente.email.label" default="Email" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'email', 'errors')}">
                                    <g:textField name="email" size="35" value="${clienteInstance?.email}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="senha"><g:message code="cliente.senha.label" default="Senha" /></label>
                                </td>
                                <td valign="top"  class="value ${hasErrors(bean: clienteInstance, field: 'senha', 'errors')}">
                                    <input name="senha" type="password" value="${fieldValue(bean: clienteInstance, field: 'senha')}" />
                                </td>
                            </tr>

                             <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="endereco"><g:message code="cliente.endereco.label" default="Endereco" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'endereco', 'errors')}">
                                    <g:textField name="endereco" size="35" value="${clienteInstance?.endereco}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="bairro"><g:message code="cliente.bairro.label" default="Bairro" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'bairro', 'errors')}">
                                    <g:textField name="bairro" value="${clienteInstance?.bairro}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cidade"><g:message code="cliente.cidade.label" default="Cidade" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'cidade', 'errors')}">
                                    <g:textField name="cidade" value="${clienteInstance?.cidade}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="estado"><g:message code="cliente.estado.label" default="Estado" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'estado', 'errors')}">
                                    <g:textField name="estado" value="${clienteInstance?.estado}" />
                                </td>
                            </tr>
                        
                       
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="telefone"><g:message code="cliente.telefone.label" default="Telefone" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'telefone', 'errors')}">
                                    <g:textField name="telefone" maxlength="14" onkeypress="MascaraTelefone(form.telefone);"  value="${fieldValue(bean: clienteInstance, field: 'telefone')}" />
                                </td>
                            </tr>
                        
                                                                          
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="pontoDeReferencia"><g:message code="cliente.pontoDeReferencia.label" default="Ponto De Referencia" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: clienteInstance, field: 'pontoDeReferencia', 'errors')}">
                                    <g:textField name="pontoDeReferencia" size="35" value="${clienteInstance?.pontoDeReferencia}" />
                                </td>
                            </tr>
                        
                           
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton onclick="Verifica_CPF(this)" name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
