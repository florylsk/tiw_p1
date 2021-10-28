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
        <title>Gestión de Masters - AulaMaster</title>

        <!-- CSS and JS-->
        <link href="${pageContext.request.contextPath}/resources/css/halfmoon-variables.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/resources/js/halfmoon.min.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/fa.7465cf6e1c.js"></script>

</head>
<body class="with-custom-webkit-scrollbars with-custom-css-scrollbars" data-dm-shortcut-enabled="true" data-set-preferred-mode-onload="true">
	<%@page import="beans.*,java.util.*,entities.*,javax.persistence.*"%>  
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
        			  <li class="nav-item">
         			  <a href="crud.jsp" class="nav-link">CRUD</a>
        			 </li>
        			  <li class="nav-item active">
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
            
            
            
            
            
            
            <div class="content-wrapper ">
            
                
                <%  
					List<Master> masters = masterDAO.getAllMasters();
					request.setAttribute("masters",masters);
					EntityManagerFactory emfactory = Persistence.createEntityManagerFactory( "tiw_JPA" );
				    EntityManager entitymanager = emfactory.createEntityManager();
					
				%>  
                <!-- Courses and management will be shown here -->
                <div class="w-400 m-auto my-20">
                	<form action="#modal-search-student" class="form-inline" method="post" >
 
   							<input type="text" id="searchInput" class="form-control" onkeyup="searchFunction()" placeholder="Búsqueda por NIA" title="Escribe un NIA">		
 						
                	</form>
                </div>
                
                <div id="masters">
                <c:forEach items="${masters}" var="m">
                	

			                 
                	<div class="container-fluid mb-20">
                		<div class="row vertical-center">
                			<h4 class="col-8 mb-10 pl-15">${m.getNombre()}</h4>
                			<div class="col-4 text-right pr-15">
                			<a href="#modal-assign-student-${m.getId()}" class="btn mr-5" role="button"><i class="fas fa-user-plus"></i></a>
                			</div>
                		</div>
                		<table class="table table-striped">
                			<thead>
              				<tr>
                 				<th style="width: 25%">Nombre</th>
                 				<th style="width: 25%">Apellidos</th>
                 				<th style="width: 20%">NIA</th>
                 				<th style="width: 15%">Fecha Nacimiento</th>
                 				<th class="text" style="width: 15%">Acciones</th>
              				</tr>
		            		</thead>
		            		<tbody>
	                				<%  
	                				Query query = entitymanager.createQuery( "Select s " + "from Subscription s " + "where s.master=1");
	                		      	List<Subscription> subscripciones=query.getResultList();
	                		      	List<Student> students = new ArrayList<Student>();
	                		      	for (Subscription sub : subscripciones){
	                		      		Student stu = studentDAO.getStudentByNIA(sub.getStudentID());
	                		      		students.add(stu);     		      		
	                		      	}
	                		      	request.setAttribute("estudiantes",students);
	                		      	
									%> 
	                				<c:forEach items="${estudiantes}" var="est">
	                					<tr>
        		    				<th>
        		    					${est.getFirstname()}
        		    				</th>
        		    				<td>
        		    					${est.getSurnames()}
        		    				</td>
        		    				<td>
        		    					${est.getNIA()}
        		    				</td>
        		    				<td>
        		    					${est.getBirth()}
        		    				</td>
        		    				<td class="text">
        		    			   		<a href="#modal-unnasign-student-${m.getId()}-${est.getNIA()}" class="btn btn-square btn-primary ml-5" role="button"><i class="fas fa-edit"></i></a>
	                				
	                				
	                				</td>
	                				</tr>
	                				
	                				
	                				</c:forEach>
                				
                	
                	
                	
                	
                	
                
                
                
                
                
                			</tbody>
                		</table>
               		 </div>
                </c:forEach>
                
                
                
                
                
                
                
                
                
                
                
                </div>
                
                
                
                
                
                
                
                
                
                
                
            </div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            

          
	<nav class="navbar navbar-fixed-bottom">
                	<div class="container-fluid">
                   	 <ul class="navbar-nav ml-auto">
                      	  <li class="nav-item">
                        	    <a href="#" class="nav-link">Política de privacidad</a>
                      	  </li>
                  	  </ul>
                  	  <span class="navbar-text"> &copy; AulaMaster </span>
               	 </div>
			</nav>



	</div>

		</div>




	</body>

</html>




            