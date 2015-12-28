
<%@ page import="fa7tapiocadelivery.Funcionario" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'funcionario.label', default: 'Funcionario')}" />
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
            <g:hasErrors bean="${funcionarioInstance}">
            <div class="errors">
                <g:renderErrors bean="${funcionarioInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" onSubmit="return Verifica_CPF(this)">
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cpf"><g:message code="funcionario.cpf.label" default="Cpf" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'cpf', 'errors')}">
                                    <g:textField name="cpf" maxlength="11" value="${funcionarioInstance?.cpf}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome"><g:message code="funcionario.nome.label" default="Nome" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'nome', 'errors')}">
                                    <g:textField name="nome" maxlength="225" size="35" value="${funcionarioInstance?.nome}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="senha"><g:message code="funcionario.senha.label" default="Senha" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'senha', 'errors')}">
                                    <g:textField name="senha" type="password" value="${fieldValue(bean: funcionarioInstance, field: 'senha')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="cargo"><g:message code="funcionario.cargo.label" default="Cargo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: funcionarioInstance, field: 'cargo', 'errors')}">
                                    <g:textField name="cargo" value="${funcionarioInstance?.cargo}" />
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
