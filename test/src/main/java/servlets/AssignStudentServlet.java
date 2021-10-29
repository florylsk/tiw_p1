package servlets;

import java.io.IOException;

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







@WebServlet(urlPatterns = {"/assignStudent" })
public class AssignStudentServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@PersistenceContext (unitName="tiw_JPA")
	EntityManager entitymanager;
	
	@Resource
	UserTransaction ut;
	
	
	public AssignStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void init() {

		ServletContext context = getServletContext();
	}
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		
		String _mID = req.getParameter("masterID");
		String _sNIA = req.getParameter("studentNIA");
	    Query query = entitymanager.createQuery( "Select s from student s where s.NIA = "+_sNIA);
	    
	    Student varS=(Student) query.getResultList().get(0);
	    query = entitymanager.createQuery("Select m from master m where m.id = "+_mID);
	    Master varM=(Master) query.getResultList().get(0);
	    try {
	    ut.begin();
		Subscription sub = new Subscription();
		sub.setMaster(varM);
		sub.setStudent(varS);
		entitymanager.persist(sub);
		ut.commit();
	    }
	    catch(Exception e) {
	    	e.printStackTrace();
	    	
	    }
	    req.getRequestDispatcher("master.jsp").forward(req, res);
	    
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}