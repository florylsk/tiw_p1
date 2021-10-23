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
	<%@page import="beans.*,java.util.*"%>  
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  

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
            <!-- Modal para crear usuario -->
             <div class="modal" id="modal-add-student" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <h5 class="modal-title">Añadir estudiante</h5>
                        <form id="add-student" action="addStudent" method="post">
                            <div class="form-group">
                                <label for="create-student-firstname" class="required">Nombre</label>
                                <input type="text" name="firstname" id="create-student-firstname" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="create-student-surnames" class="required">Apellidos</label>
                                <input type="text" name="surnames" id="create-student-surnames" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="create-student-NIA" class="required">NIA</label>
                                <input type="number" name="NIA" id="create-student-NIA" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="create-student-birth" class="required">Fecha de nacimiento</label>
                                <input type="date" name="birth" id="create-student-birth" class="date" required="required" />
                            </div>
                            <div class="text-right mt-20">
                            <button class="btn mr-5" data-dismiss="modal" type="button">Cancelar</button>
                            <input class="btn btn-primary" type="submit" value="Añadir estudiante">
                      	    </div>
                        </form>
                        
                    </div>
                </div>
            </div>
            
            <!-- Modal para modificar usuario -->
             <div class="modal" id="modal-update-student" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <h5 class="modal-title">Modificar estudiante</h5>
                        <h6 class="modal-text">(No puede modificar el NIA)</h6>
                        
                        <form id="add-student" action="updateStudent" method="post">
                        	<div class="form-group">
                                <label for="update-student-NIA" class="required">NIA del alumno a modificar</label>
                                <input type="number" name="NIA" id="update-student-NIA" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="update-student-firstname" class="required">Nombre</label>
                                <input type="text" name="firstname" id="update-student-firstname" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="update-student-surnames" class="required">Apellidos</label>
                                <input type="text" name="surnames" id="update-student-surnames" class="form-control" required="required" />
                            </div>
                            <div class="form-group">
                                <label for="update-student-birth" class="required">Fecha de nacimiento</label>
                                <input type="date" name="birth" id="update-student-birth" class="date" required="required" />
                            </div>
                            <div class="text-right mt-20">
                            <button class="btn mr-5" data-dismiss="modal" type="button">Cancelar</button>
                            <input class="btn btn-primary" type="submit" value="Modificar estudiante">
                      	    </div>
                        </form>
                        
                    </div>
                </div>
            </div>
            
            <!-- Sticky alerts (toasts), empty container -->
            <!-- Reference: https://www.gethalfmoon.com/docs/sticky-alerts-toasts -->
            <div class="sticky-alerts"></div>
			<div class="w-250 m-auto">
               		<!-- <button onclick="addUser()" class="btn btn-square btn-primary w-150" type="button"><i class="fas fa-user-plus"></i>     Añadir usuario</button> -->   
               		<a href="#modal-add-student" class="btn btn-primary btn-square w-150" role="button"><i class="fas fa-user-plus"></i>     Añadir estudiante</a>              
            </div>
          	<!-- Content -->
            <div class="content-wrapper ">
            
            	<div class="w-250 m-auto p-20">
               		<a href="#modal-add-student" class="btn btn-primary btn-square w-150" role="button"><i class="fas fa-user-plus"></i>     Añadir estudiante</a>                 
                </div>
                
                <div class="w-400 m-auto my-20">
                	<form action="..." class="form-inline">
 
   							<input type="text" class="form-control " id="Nia" placeholder="Nia" required="required">
 							<input  type="submit" class="btn btn-primary "value="Buscar usuario">				
 						
                	</form>
                </div>
                
                <%  
					List<Student> students=studentDAO.getAllStudents();
					request.setAttribute("students",students);  
				%>  
                <!-- Courses and management will be shown here -->
                <div id="admin-courses">
                	<table class="table table-striped">
            			<thead>
              				<tr>
                 				<th style="width: 25%">Nombre</th>
                 				<th style="width: 25%">Apellidos</th>
                 				<th style="width: 20%">Nia</th>
                 				<th style="width: 15%">Fecha Nacimiento</th>
                 				<th class="text-right" style="width: 15%">Acciones</th>
              				</tr>
		            	</thead>
        		    	<tbody>
        		    		<c:forEach items="${students}" var="s">
        		    			<tr>
        		    				<th>
        		    					${s.getFirstname()}
        		    				</th>
        		    				<td>
        		    					${s.getSurnames()}
        		    				</td>
        		    				<td>
        		    					${s.getNIA()}
        		    				</td>
        		    				<td>
        		    					${s.getBirth()}
        		    				</td>
        		    				<td class="text-right">
        		    			   		<a href="#modal-update-student" class="btn btn-square btn-primary ml-5" role="button"><i class="fas fa-edit"></i></a>
        		    					<form action="deleteStudent" method="post">
    										<button type="submit"name="NIA" value="${s.getNIA()}"class="btn btn-square btn-danger ml-5" type="button" ><i class="fas fa-trash"></i></button>
										</form>
        		    				
        		    				</td>
        		    			</tr>
        		    		</c:forEach>
        		    		
            			</tbody>
            			
            		</table>
            		<div class="divider mt-0 mb-5 border-bottom"></div>
                </div>
            </div>
            
            
         



	</div>

		</div>




	</body>

</html>




            