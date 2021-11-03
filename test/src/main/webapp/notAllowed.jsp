<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
        <%-- Meta tags --%>
        <meta charset="utf-8" />
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport" />
        <meta name="viewport" content="width=device-width" />

        <%-- Title --%>
        <title>Home - AulaMaster</title>

        <%-- CSS and JS--%>
        <link href="${pageContext.request.contextPath}/resources/css/halfmoon-variables.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/halfmoon.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/fa.7465cf6e1c.js"></script>

</head>
<body class="dark-mode with-custom-webkit-scrollbars with-custom-css-scrollbars" data-dm-shortcut-enabled="true" data-set-preferred-mode-onload="true">

	<div class="page-wrapper with-navbar" data-sidebar-type="overlayed-sm-and-down">
	

		<%-- Navbar --%>
            <nav class="navbar">
                <%-- Navbar brand --%>
                <a href="index.jsp" class="navbar-brand font-size-16">
                    <img alt="UPFV Dark Mode Logo" class="hidden-lm" src="${pageContext.request.contextPath}/resources/images/logo_white_small.png">
                    <img alt="UPFV Light Mode Logo" class="hidden-dm" src="${pageContext.request.contextPath}/resources/images/logo_black_small.png">
                    Administración
                </a>
                
                <%-- Navbar form. Here, search, help and profile buttons are shown --%>
                <div class="navbar-content d-none d-md-flex ml-auto">
                    <%-- dark mode button --%>
                    <button class="btn btn-action ml-10" onclick="halfmoon.toggleDarkMode()">
            				<i class="fas fa-moon"></i>
           				 <span class="sr-only">Modo oscuro</span>
      				  </button>
                    
                </div>
				
            </nav>

       
				<div class="page-wrapper with-navbar with-navbar-fixed-bottom" data-sidebar-type="full-height overlayed-sm-and-down">
           	 			<%-- Sticky alerts (toasts), empty container --%>
           			<div class="sticky-alerts"></div>	
           			<div class="content-wrapper mw-full text-center" style="position:relative;display:flex;align-items:center;justify-content:center;">				
						<div class="card w-lg-550" style="position:absolute">	
	          				 <h3>Acceso no autorizado</h3>
	          				 <h6>Esta usted intentando acceder a la página sin estar autorizado para ello. Si desea acceder inicie sesión</h6>
																			
							 <a class="btn btn-primary" href="access.jsp">Iniciar sesión</a>
	
	
						</div>
					</div>
				</div>

		</div>
		




	</body>

</html>
























