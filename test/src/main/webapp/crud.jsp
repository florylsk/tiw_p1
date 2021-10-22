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
        <script src="${pageContext.request.contextPath}/resources/js/halfmoon.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/fa.7465cf6e1c.js"></script>

</head>
<body class="with-custom-webkit-scrollbars with-custom-css-scrollbars" data-dm-shortcut-enabled="true" data-set-preferred-mode-onload="true">

	<div class="page-wrapper with-navbar" data-sidebar-type="overlayed-sm-and-down">
	

		<!-- Navbar -->
            <nav class="navbar">
                <!-- Navbar brand -->
                <a href="index.jsp" class="navbar-brand font-size-16">
                    <img alt="UPFV Dark Mode Logo" class="hidden-lm" src="${pageContext.request.contextPath}/resources/images/logo_white_small.png">
                    <img alt="UPFV Light Mode Logo" class="hidden-dm" src="${pageContext.request.contextPath}/resources/images/logo_black_small.png">
                    Administración
                </a>
                <ul class="navbar-nav d-none d-md-flex"> <!-- d-none = display: none, d-md-flex = display: flex on medium screens and up (width > 768px) -->
          			<li class="nav-item">
           				 <a href="index.jsp" class="nav-link">Home</a>
       			   </li>
        			  <li class="nav-item active">
         			  <a href="crud.jsp" class="nav-link">CRUD</a>
        			 </li>
        			  <li class="nav-item">
        			   <a href="master.jsp" class="nav-link">Buscador de Máster</a>
       			  </li>
      			  </ul>
                <!-- Navbar form. Here, search, help and profile buttons are shown -->
                <div class="navbar-content d-none d-md-flex ml-auto">
                    <!-- dark mode button -->
                    <button class="btn btn-action ml-10" onclick="halfmoon.toggleDarkMode()">
            				<i class="fas fa-moon"></i>
           				 <span class="sr-only">Modo oscuro</span>
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
				
            </nav>
            
            
            <div class="page-wrapper with-navbar with-navbar-fixed-bottom" data-sidebar-type="full-height overlayed-sm-and-down">
            <!-- Sticky alerts (toasts), empty container -->
            <!-- Reference: https://www.gethalfmoon.com/docs/sticky-alerts-toasts -->
            <div class="sticky-alerts"></div>
			<div class="w-250 m-auto">
               		<button onclick="addUser()" class="btn btn-square btn-primary w-150" type="button"><i class="fas fa-user-plus"></i>     Añadir usuario</button>                 
                </div>
          	<!-- Content -->
            <div class="content-wrapper ">
            
            	<div class="w-250 m-auto p-20">
               		<button onclick="addUser()" class="btn btn-square btn-primary w-150" type="button"><i class="fas fa-user-plus"></i>     Añadir usuario</button>                 
                </div>
                
                <div class="w-400 m-auto my-20">
                	<form action="..." class="form-inline">
 
   							<input type="text" class="form-control " id="Nia" placeholder="Nia" required="required">
 							<input  type="submit" class="btn btn-primary "value="Buscar usuario">				
 						
                	</form>
                </div>
                
                
                <!-- Courses and management will be shown here -->
                <div id="admin-courses">
                	<table class="table table-striped">
            			<thead>
              				<tr>
                 				<th style="width: 25%">Nombre</th>
                 				<th style="width: 25%">Apellidos</th>
                 				<th style="width: 20%">Nia</th>
                 				<th style="width: 15%">Fecha Nacimiento</th>
                 				<th style="width: 15%">Acciones</th>
              				</tr>
		            	</thead>
        		    	<tbody>
        		    		<tr>
        		    			<th><!--Añadir nombre alumnos -->
        		    				Luis  
        		    			</th>
        		    			<td><!--Añadir apellidos alumnos -->
        		    				Gomez Hernandez
        		    			</td>
        		    			<td><!--Añadir Nia alumnos -->
        		    				100406002
        		    			</td>
        		    			<td><!--Añadir fecha alumnos -->
        		    				20-03-2000
        		    			</td>
        		    			<td>
        		    			    <button onclick="modifyUser()"class="btn btn-square btn-primary ml-5" type="button"><i class="fas fa-edit"></i></button>
        		    				<button onclick="deleteUser()"class="btn btn-square btn-danger ml-5" type="button"><i class="fas fa-trash"></i></button>
        		    				
        		    			</td>
        		    			
        		    		</tr>
        		    		<!-- 
							<c:forEach items="${}" var="">
            					<tr>      
              					 	<td>${.get(i).getName()}</td>
                					<td>${.get(i).getLastName()}</td>
                					<td>${.get(i).getNia()}</td>
                					<td>${.get(i).getDate()}</td>
                					<td>
                						<button onclick="modifyUser()"class="btn btn-square btn-primary ml-5" type="button"><i class="fas fa-edit"></i></button>
        		    					<button onclick="deleteUser()"class="btn btn-square btn-danger ml-5" type="button"><i class="fas fa-trash"></i></button>
                					</td>  
            					</tr>
							</c:forEach> 
							-->
            			</tbody>
            		</table>
                </div>
            </div>
            
            
         



	</div>

		</div>




	</body>

</html>




            