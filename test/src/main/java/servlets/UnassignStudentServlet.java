package servlets;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.persistence.*;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import javax.transaction.UserTransaction;

import entities.Master;
import entities.Student;
import entities.Subscription;







@WebServlet(urlPatterns = {"/unassignStudent" })
public class UnassignStudentServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@PersistenceContext (unitName="tiw_JPA")
	EntityManager entitymanager;
	
	@Resource
	UserTransaction ut;
	
	
	public UnassignStudentServlet() {
		super();
	}
	
	public void init() {

		// lee el contexto del servlet para crear el manager 
		ServletContext context = getServletContext();
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		
		//coge los parametros del post request
		String _mID = req.getParameter("_masterID");
		String _sNIA = req.getParameter("_studentNIA");    
		int mID=Integer.parseInt(_mID);
		int sNIA=Integer.parseInt(_sNIA);
		//coge todos los estudiantes de la bd
	    Query query = entitymanager.createQuery( "Select s from subscription s");
	    //lista de subscripciones vacia
	    List<Subscription> subscriptions = query.getResultList();
	    Subscription test = null;
	    //busca si hay alguna subscripcion con ese nia y master
	    for (Subscription s : subscriptions) {
	    	if (s.getMaster().getID()==mID && s.getStudent().getNIA()==sNIA) {
	    		test=s;
	    	}
	    }
	    //borra la subscripcion
	    try {
	    	ut.begin();
	    	query=entitymanager.createQuery("Delete from subscription s where s.id = :id");
	    	query.setParameter("id", test.getId());
	    	int rows=query.executeUpdate();
	    	ut.commit();
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	
	    }
	    //para el modal del jsp
	    req.setAttribute("student_unassigned", true);
	    req.getRequestDispatcher("master.jsp").forward(req, res);
	    
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}