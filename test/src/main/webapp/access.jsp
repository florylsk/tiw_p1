<%@page contentType="text/html;charset=UTF-8" language="java" %>


<html>
    <head>
        <!-- Meta tags -->
        <meta charset="utf-8" />
        <!-- W3C validator will probably warn here, but this is needed by Halfmoon -->
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta name="viewport" content="width=device-width" />

        <!-- Title -->
        <title>Iniciar Sesión - AulaMaster</title>

        <!-- CSS and JS-->
        <link href="${pageContext.request.contextPath}/resources/css/halfmoon-variables.min.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/halfmoon.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/fa.7465cf6e1c.js"></script>
        <script type="text/javascript">
 			 // Toasts a default alert
  			function toastAlert() {
  		  	var alertContent = "ajimenez:Y9gMQe&3A?\njalvarez:_m6A!GVqVe\nphernandez:+gnMN7Ve93";
    		// Built-in function
    		halfmoon.initStickyAlert({
      		content: alertContent,      
      		title: "Usuario:Contraseña"      
    		})
  		}
  		</script>

    </head>
    <body class="with-custom-webkit-scrollbars with-custom-css-scrollbars" data-dm-shortcut-enabled="true" data-set-preferred-mode-onload="true">
        <!-- Top right toggle -->
        <button class="btn btn-action mt-10 mr-10 position-fixed top-0 right-0 dark-mode" onclick="halfmoon.toggleDarkMode()">
            <i class="fas fa-moon"></i>
            <span class="sr-only">Modo oscuro</span>
        </button>

        <div class="page-wrapper with-navbar-fixed-bottom">
            <!-- Sticky alerts (toasts), empty container -->
            <div class="sticky-alerts"></div>

            <!-- Content wrapper -->
            <div class="content-wrapper mw-full text-center" style="position:relative;display:flex;align-items:center;justify-content:center;">
            	<img alt="fondo" src="${pageContext.request.contextPath}/resources/images/fondov3.jpg" style="width: 100%;height:100%;">
                <div class="card mw-800 w-lg-600 left-auto right-auto d-inline-block" style="position:absolute;">
                    <!-- When responsive mode is active, this div is shown hiding the left column -->
                    <div class="text-center d-inline-block d-lg-none">
                        <img alt="AulaMaster Dark Mode Logo" class="w-150 mr-20 hidden-lm" src="${pageContext.request.contextPath}/resources/images/AulaMaster-logos_white.png" style="width:20rem;"/>
                        <img alt="AulaMaster Light Mode Logo" class="w-150 mr-20 hidden-dm" src="${pageContext.request.contextPath}/resources/images/AulaMaster-logos_black.png" style="width:20rem;"/>
                    </div>
                    
                    <div class="container-fluid">
                    	<p style="font-size:3rem;line-height:1.3;">¡Bienvenido a AulaMaster!</p>
                        
                        <button class="btn" type="button" onclick="toastAlert()">Perfiles por Defecto</button>
                        <div class="row">

                            <!-- This column is only shown when in desktop mode, and hides in the next step of the registration form -->
                            <div class="col text-center mt-20 pt-20 d-none d-lg-block" id="access-logo">
                                <img alt="AulaMaster Dark Mode Logo" class="w-150 mr-20 hidden-lm" src="${pageContext.request.contextPath}/resources/images/AulaMaster-logos_white.png" style="width:22rem!important;margin-right: 1rem!important;" />
                                <img alt="AulaMaster Light Mode Logo" class="w-150 mr-20 hidden-dm" src="${pageContext.request.contextPath}/resources/images/AulaMaster-logos_black.png" style="width:22rem!important;margin-right: 1rem!important;" />
                            </div>
                            <div class="col">

                                <!-- Login form -->
                                <form id="login" class="mt-20 text-center mr-10 ml-10" action="adminlog" method="post">
                                    <h4>Acceder</h4>
                                    <div class="form-group">
                                        <label for="username" class="required">Usuario</label>
                                        <div class="input-group mw-full text-center">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            </div>
                                            <input type="text" class="form-control" required placeholder="Usuario" id="username" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="login-password" class="required">Contraseña</label>
                                        <div class="input-group mw-full text-center">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                                            </div>
                                            <input type="password" class="form-control" required placeholder="Contraseña" id="login-password" />
                                        </div>
                                    </div>
                                    <input class="btn btn-primary" type="submit" value="Iniciar sesión">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            
        </div>


<%@include file="footer.jsp" %>