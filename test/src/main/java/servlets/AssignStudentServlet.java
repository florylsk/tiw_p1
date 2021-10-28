package servlets;

import java.io.IOException;


import javax.persistence.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entities.Master;
import entities.Student;
import entities.Subscription;







@WebServlet(urlPatterns = {"/assignStudent" })
public class AssignStudentServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	
	
	public AssignStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		
		String _mID = req.getParameter("masterID");
		String _sNIA = req.getParameter("studentNIA");
		EntityManagerFactory emfactory = Persistence.createEntityManagerFactory( "tiw_JPA" );
	    EntityManager entitymanager = emfactory.createEntityManager();
	    Query query = entitymanager.createQuery( "Select s from student s where s.NIA = "+_sNIA);
	    
	    Student varS=(Student) query.getResultList().get(0);
	    query = entitymanager.createQuery("Select m from master m where m.id = "+_mID);
	    Master varM=(Master) query.getResultList().get(0);
		Subscription sub = new Subscription();
		sub.setMaster(varM);
		sub.setStudent(varS);
		entitymanager.persist(sub);
	    
	    entitymanager.close( );
	    emfactory.close( );
	    
	    req.getRequestDispatcher("master.jsp").forward(req, res);
	    
	    
	    
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}