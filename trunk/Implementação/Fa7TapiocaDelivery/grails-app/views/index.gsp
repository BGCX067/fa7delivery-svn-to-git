<html>
    <head>
        <title>FA7 Tapioca Delivery</title>
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
				height:135px;
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
                    <g:if test="${flash.message}">
                        <div class="message">
                            ${flash.message}
                        </div>
                    </g:if>
                    <g:if test="${session.user}">
                        <br />
                        <g:link controller="user" action="logout">logout</g:link>
                    </g:if>
                    <g:else>
                        <div class="panelBody">
                            <h1>Fa7 Tapioca Delivery</h1>
                            <g:form controller="user" action="login">
                                <div style="width: 220px">
                                    <label for="id_username">Username: </label>
                                    <input id="id_usename" type="text" name="username" size="16"  />
									<br/><br/>
                                    <label for="id_password">Password: </label>
                                    <input id="id_password" type="password" name="password" size="17" />
                                    <br /><br />
                                    <input id="id_submit" type="submit" name="submit" value="Acessar" />
                                </div>
                            </g:form>
                        </div>
                    </g:else>
				</div>
				
				<div class="panelBtm">
				</div>
			</div>
		</div>
	</body>
</html>
