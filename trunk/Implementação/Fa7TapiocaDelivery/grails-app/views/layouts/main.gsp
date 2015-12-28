<html>
    <head>
		<title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'menu.css')}" />
		<g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
		<div id="spinner" class="spinner" style="display:none;">
			<img src="${resource(dir:'images',file:'spinner.gif')}" alt="Spinner" />
		</div>
		<div id="grailsLogo" class="logo">
			<a class="home" href="${createLink(uri: '/')}">
				<img src="${resource(dir:'images',file:'logo-tapioca.png')}" alt="Fa7 Tapioca Delivery" border="0" />
			</a>
		</div>
		
		<div class="nav">
			<!--span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span-->
			<g:each var="c" in="${grailsApplication.controllerClasses}">
				<span class="menuButton">
				<g:if test="${c.name == 'MontarTapioca'}">
					<g:link controller="${c.logicalPropertyName}">Montar Tapioca</g:link>
				</g:if>
				<g:else>
					<g:if test="${c.name != 'BaseController'}">
                        <g:if test="${c.name != 'User'}">
                            <g:if test="${c.name != 'Usuario'}">
                                <g:link controller="${c.logicalPropertyName}">${c.name}</g:link>
                            </g:if>
                        </g:if>
					</g:if>
				</g:else>
				</span>
			</g:each>
        </div>
		<g:layoutBody />
    </body>
</html>
