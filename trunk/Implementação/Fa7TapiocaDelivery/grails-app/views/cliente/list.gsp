
<%@ page import="fa7tapiocadelivery.Cliente" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'cliente.label', default: 'Cliente')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>




                            <g:sortableColumn property="id" title="${message(code: 'cliente.id.label', default: 'Id')}" />

                            <g:sortableColumn property="nome" title="${message(code: 'cliente.nome.label', default: 'Nome')}" />

                            <g:sortableColumn property="cpf" title="${message(code: 'cliente.cpf.label', default: 'CPF')}" />

                            <g:sortableColumn property="email" title="${message(code: 'cliente.email.label', default: 'Email')}" />

                            <g:sortableColumn property="senha" title="${message(code: 'cliente.senha.label', default: 'Senha')}" />

                            <g:sortableColumn property="endereco" title="${message(code: 'cliente.endereco.label', default: 'Endereco')}" />
                        
                            <g:sortableColumn property="bairro" title="${message(code: 'cliente.bairro.label', default: 'Bairro')}" />
                        
                            <g:sortableColumn property="cidade" title="${message(code: 'cliente.cidade.label', default: 'Cidade')}" />
                        
                            <g:sortableColumn property="estado" title="${message(code: 'cliente.estado.label', default: 'Estado')}" />

                           <g:sortableColumn property="pontoDeReferencia" title="${message(code: 'cliente.pontoDeReferencia.label', default: 'Ponto de Referencia')}" />

                            
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${clienteInstanceList}" status="i" var="clienteInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${clienteInstance.id}">${fieldValue(bean: clienteInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "nome")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "cpf")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "email")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "senha")}</td>
                        
                            <td>${fieldValue(bean: clienteInstance, field: "endereco")}</td>

                            <td>${fieldValue(bean: clienteInstance, field: "bairro")}</td>

                            <td>${fieldValue(bean: clienteInstance, field: "cidade")}</td>

                            <td>${fieldValue(bean: clienteInstance, field: "estado")}</td>

                            <td>${fieldValue(bean: clienteInstance, field: "pontoDeReferencia")}</td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${clienteInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
