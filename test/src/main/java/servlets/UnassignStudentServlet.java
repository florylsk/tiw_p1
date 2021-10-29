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
		// TODO Auto-generated constructor stub
	}
	public void init() {

		// Lee del contexto de servlet (Sesi�n a nivel de aplicaci�n)
		ServletContext context = getServletContext();
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		
		
		String _mID = req.getParameter("_masterID");
		String _sNIA = req.getParameter("_studentNIA");    
		int mID=Integer.parseInt(_mID);
		int sNIA=Integer.parseInt(_sNIA);
	    Query query = entitymanager.createQuery( "Select s from subscription s");
	    List<Subscription> subscriptions = query.getResultList();
	    Subscription test = null;
	    for (Subscription s : subscriptions) {
	    	if (s.getMaster().getID()==mID || s.getStudent().getNIA()==sNIA) {
	    		test=s;
	    	}
	    }
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
	    req.getRequestDispatcher("master.jsp").forward(req, res);
	    
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}