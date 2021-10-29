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
	<%@page import="java.util.*,entities.*,javax.persistence.*"%>  
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
					EntityManagerFactory emfactory = Persistence.createEntityManagerFactory( "tiw_JPA" );
				    EntityManager entitymanager = emfactory.createEntityManager();
				    Query query = entitymanager.createQuery( "Select m from master m");
				    List<Master> masters =query.getResultList();
				    request.setAttribute("masters",masters);
				    
				  
				    int contadorID=0;
				%>  
                <!-- Courses and management will be shown here -->
                <div class="w-400 m-auto my-20">
                	<form action="#modal-search-student" class="form-inline" method="post" >
 
   							<input type="text" id="searchInput" class="form-control " onkeyup="searchFunction()" placeholder="Búsqueda por NIA" title="Escribe un NIA">
   							<input class="btn btn-primary" type="submit" value="Busqueda">
                	</form>

                	<form action="#modal-search-avanced-student"  class="form-inline mt-20 ml-30" method="post">
                		<input class="btn btn-primary" type="submit" value="Busqueda Avanzada">		
 						
                	</form>
                </div>
                
                <div id="masters">
                <c:forEach items="${masters}" var="m">
                	

			                 
                	<div class="container-fluid mb-20">
                		<div class="row vertical-center">
                			<h5 class="col-8 mb-10 pl-15">${m.getNombre()} (${m.getEscuela()}, ${m.getCurso()})</h5>
                			<div class="col-4 text-right pr-15">
                			<a href="#modal-assign-student-${m.getID()}" class="btn mr-5" role="button"><i class="fas fa-user-plus"></i><span class="ml-5 d-none d-lg-inline"> Asignar usuario</span></a>

                			</div>
                		</div>
                		<table class="table table-striped">
                			<thead>
              				<tr>
                 				<th style="width: 25%">Nombre</th>
                 				<th style="width: 25%">Apellidos</th>
                 				<th style="width: 20%">NIA</th>
                 				<th style="width: 15%">Fecha Nacimiento</th>
                 				<th class="text-right" style="width: 15%">Acciones</th>
              				</tr>
		            		</thead>
		            		<tbody>
		            			
				                	<%  							
								    query = entitymanager.createQuery( "Select s from subscription s");
				                	List<Subscription> subscriptions=query.getResultList();
				                	List<Student> students = new ArrayList<Student>();
				                	for (Subscription s : subscriptions){
				                		if (s.getMaster().equals(masters.get(contadorID))){
				                			students.add(s.getStudent());
				                		}
				                	}
								    
								    request.setAttribute("students",students);
				                	List<Student> students_not_assigned = new ArrayList<Student>();								    
								    query = entitymanager.createQuery("Select s from student s");
				                	List<Student> all_students=query.getResultList();
				                	for (Student stu : all_students){
				                		if (!students.contains(stu)){
				                			students_not_assigned.add(stu);
				                		}
				                	}
				                	
				                	
								    request.setAttribute("students_not_assigned",students_not_assigned);
								    contadorID+=1;
								%>  
								<c:forEach items="${students}" var="s">
									<tr>
        		    				<td>
        		    					${s.getFirstname()}
        		    				</td>
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
        		    			   		<a href="#modal-unnasign-student-${s.getNIA()}-${m.getID()}" class="btn  btn-danger mr-5" role="button" ><i class="fas fa-user-minus"></i><span class="ml-5 d-none d-lg-inline"> Desasignar usuario</span></a>
           								
				           							<div class="modal" id="modal-unnasign-student-${s.getNIA()}-${m.getID()}" tabindex="-1" role="dialog">
				              							  <div class="modal-dialog" role="document">
				                   							 <div class="modal-content">
				                     						   <h5 class="modal-title text-center">Desasignar Estudiante</h5>
					                     						   <p class="text-left">
			                          							  ¿Está seguro de querer desasignar al estudiante ${s.getFirstname()} ${s.getSurnames()} del ${m.getNombre()}?
			                        								</p>
										                        <form id="unassign-student" action="unassignStudent" method="post">
										                             <input type="hidden" id="unassign-student-Master" name="_masterID" value="${m.getID()}">
										                             <input type="hidden" id="unassign-student-Student" name="_studentNIA" value="${s.getNIA()}">
										                            <div class="text-center mt-20">
										                            <a class="btn mr-5" href="#" type="button">Cancelar</a>
										                            <input class="btn btn-danger" type="submit" value="Desasignar estudiante">
										                      	    </div>
										                        </form>
				                        
												        </div>
												   </div>
												 </div>
				                		
                		
                				
        		    				</td>
        		    			</tr>
								</c:forEach>
                
                	
                			</tbody>
                			
                		</table>
                		<div class="modal" id="modal-assign-student-${m.getID()}" tabindex="-1" role="dialog">
              							  <div class="modal-dialog" role="document">
                   							 <div class="modal-content">
                     						   <h5 class="modal-title text-center">Asignar Estudiante</h5>
                       						   <h6 class="modal-text text-left">Master: ${m.getNombre()}</h6>
						                        <form id="assign-student" action="assignStudent" method="post">
						                             <input type="hidden" id="assign-student-Master" name="masterID" value="${m.getID()}">
						                           	 <select class="form-control" id="studentNIA" name="studentNIA">   
											            <c:forEach items="${students_not_assigned}" var="sna">
											            		<option value="${sna.getNIA()}">${sna.getFirstname()} ${sna.getSurnames()}</option>
	            
											            </c:forEach>       
											        </select>
						                            <div class="text-center mt-20">
						                            <a class="btn mr-5" href="#" type="button">Cancelar</a>
						                            <input class="btn btn-primary" type="submit" value="Asignar estudiante">
						                      	    </div>
						                        </form>
                        
								        </div>
								   </div>
								 </div>
                		<div class="divider mt-0 mb-5 border-bottom"></div>
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




            