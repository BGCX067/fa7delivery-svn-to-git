<html>
    <head>
        <title>Welcome to Grails</title>
		<meta name="layout" content="main" />
		<style type="text/css" media="screen">

			#nav {
				margin-top:20px;
				margin-left:30px;
				width:228px;
				float:left;

			}
			.homePagePanel * {
				margin:0px;
			}
			.homePagePanel .panelBody ul {
				list-style-type:none;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody h1 {
				text-transform:uppercase;
				font-size:1.1em;
				margin-bottom:10px;
			}
			.homePagePanel .panelBody {
			    background: url(images/leftnav_midstretch.png) repeat-y top;
				margin:0px;
				padding:15px;
			}
			.homePagePanel .panelBtm {
			    background: url(images/leftnav_btm.png) no-repeat top;
				height:20px;
				margin:0px;
			}

			.homePagePanel .panelTop {
			    background: url(images/leftnav_top.png) no-repeat top;
				height:11px;
				margin:0px;
			}
			h2 {
				margin-top:15px;
				margin-bottom:15px;
				font-size:1.2em;
			}
			#pageBody {
				margin-left:280px;
				margin-right:20px;
			}
		</style>
    </head>
    <body>
        <div id="nav">
			<div class="homePagePanel">
				<div class="panelTop">
                    ${flash.message}
				</div>
				<div class="panelBody">
					<h1>Fa7 Tapioca Delivery Access</h1>
                    <g:form controller="user" action="login">
                        <div style="width: 220px">
                            <label for="id_username">Username: </label>
                            <input id="id_usename" type="text" name="username" />
                            <label for="id_password">Password: </label>
                            <input id="id_password" type="password" name="password" />
                            <br />
                            <input id="id_submit" type="submit" name="submit" value="Acessar" />
                        </div>
                    </g:form>
				</div>
				<div class="panelBtm">
				</div>
			</div>


		</div>
		<div id="pageBody">
    
    
    
    
    
<!--
		<div id="nav">
			<div class="homePagePanel">
				<div class="panelTop">
                    
				</div>
				<div class="panelBody">
					<h1>Application Status</h1>
					<ul>
                      <g:each var="c" in="${grailsApplication.controllerClasses}">
                            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.name}</g:link></li>
                      </g:each>
                    </ul>
				</div>
				<div class="panelBtm">
				</div>
			</div>


		</div>
		<div id="pageBody">
-->
	        
		</div>
    </body>
</html>
