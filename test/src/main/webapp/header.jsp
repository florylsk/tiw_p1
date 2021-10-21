<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
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

</head>
<body class="with-custom-webkit-scrollbars with-custom-css-scrollbars" data-dm-shortcut-enabled="true" data-set-preferred-mode-onload="true">


	<div class="page-wrapper with-navbar with-sidebar" data-sidebar-type="overlayed-sm-and-down">

<!-- Navbar -->
            <nav class="navbar">
            	<div class="navbar-content">
        			 <button id="toggle-sidebar-btn" class="btn btn-action" type="button" onclick="halfmoon.toggleSidebar()">
            			 <img class="hidden-lm" src="${pageContext.request.contextPath}/resources/images/Hamburger_icon_dark.png" height="100%" width="70%" alt="missing file">
            			 <img class="hidden-dm" src="${pageContext.request.contextPath}/resources/images/Hamburger_icon_light.png" height="100%" width="70%" alt="missing file">
        				 </button>
      			 </div>
                <!-- Navbar brand -->
                <a href="index.jsp" class="navbar-brand font-size-16">
                    <img alt="UPFV Dark Mode Logo" class="hidden-lm" src="${pageContext.request.contextPath}/resources/images/logo_white_small.png">
                    <img alt="UPFV Light Mode Logo" class="hidden-dm" src="${pageContext.request.contextPath}/resources/images/logo_black_small.png">
                    Administración
                </a>
                <!-- Navbar form. Here, search, help and profile buttons are shown -->
                <div class="navbar-content d-none d-md-flex ml-auto">
                    <!-- Help button -->
                    <button class="btn btn-action ml-10">
                        <i class="fas fa-question"></i>
                        <span class="sr-only">Ayuda</span>
                    </button>
                    <!-- Profile dropdown -->
                    <div class="dropdown with-arrow">
                        <!-- Button -->
                        <button class="btn btn-action btn-primary ml-10" data-toggle="dropdown" type="button" id="navbar-dropdown-profile">
                            <i class="fas fa-user"></i>
                            <span class="sr-only">Perfil</span>
                        </button>
                        <!-- Content -->
                        <div class="dropdown-menu dropdown-menu-right w-300" aria-labelledby="navbar-dropdown-profile">
                            <div class="inline-block text-center mw-full mt-10">
                                <img alt="Profile image" src="${pageContext.request.contextPath}/resources/images/profile.jpeg" id="profile-image" class="inline w-150" />
                            </div>
                            <div class="dropdown-item text-center font-size-20" id="profile-name">${nombre} ${apellido}</div>
                            <a href="#" class="dropdown-item" onclick="halfmoon.toggleDarkMode()">
                                <span class="hidden-lm"><i class="fas fa-sun"></i> Modo claro</span>
                                <span class="hidden-dm"><i class="fas fa-moon"></i> Modo oscuro</span>
                            </a>
                            <a href="/test/adminlogout" class="dropdown-item text-danger"><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a>
                        </div>
                    </div>
                </div>
				
				<div class="navbar-content d-md-none ml-auto">
                    <!-- d-md-none = display: none on medium screens and up (width > 768px), ml-auto = margin-left: auto -->
                    <div class="dropdown with-arrow">
                        <button class="btn" data-toggle="dropdown" type="button" id="navbar-dropdown-mobile">
                            <i class="fa fa-angle-down" aria-hidden="true"></i>
                        </button>
                        <div class="dropdown-menu dropdown-menu-right w-300" aria-labelledby="navbar-dropdown-mobile">
                            <!-- Profile section -->
                            <div class="inline-block text-center mw-full mt-10">
                                <img alt="Profile image" src="${pageContext.request.contextPath}/resources/images/profile.jpeg" id="profile-image-responsive" class="inline w-150" />
                            </div>
                            <div class="dropdown-item text-center font-size-20" id="profile-name-responsive">Nombre y apellidos</div>
                            <a href="#" class="dropdown-item" onclick="halfmoon.toggleDarkMode()">
                                <span class="hidden-lm"><i class="fas fa-sun"></i> Modo claro</span>
                                <span class="hidden-dm"><i class="fas fa-moon"></i> Modo oscuro</span>
                            </a>
                            <a href="#" class="dropdown-item"><i class="fas fa-question"></i> Ayuda</a>
                            <a href="/test/adminlogout" class="dropdown-item text-danger"><i class="fas fa-sign-out-alt"></i> Cerrar sesión</a>
                        </div>
                    </div>
                </div>
            </nav>
            
            <!-- Sidebar overlay -->
      <div class="sidebar-overlay" onclick="halfmoon.toggleSidebar()"></div>

      <!-- Sidebar start -->
      <div class="sidebar">
        <div class="sidebar-menu">
          <!-- Sidebar links and titles -->
          <h5 class="sidebar-title">Funcionalidades</h5>
          <div class="sidebar-divider"></div>
          <a href="#" class="sidebar-link">Registro de accesos</a>
          <a href="#" class="sidebar-link">Control de accesos</a>
          <a href="#" class="sidebar-link">CRUD</a>
          <a href="#" class="sidebar-link">Gestión de inscripciones de máster</a>
      </div>
      </div>
      <!-- Sidebar end -->

