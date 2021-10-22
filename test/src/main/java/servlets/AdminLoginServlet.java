package servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import beans.Admin;
import beans.loginDAO;
import sql.IAdminConstants;



@WebServlet(urlPatterns = {"/adminlog" })
public class AdminLoginServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AdminLoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		PrintWriter pw = res.getWriter();
		String uName = req.getParameter(IAdminConstants.COLUMN_USERNAME);
		String pWord = req.getParameter(IAdminConstants.COLUMN_PASSWORD);
		Admin admin = new Admin(uName,pWord);
		boolean login=loginDAO.validate(admin);
		

			if (login) {	
				HttpSession session = req.getSession();
				session.setAttribute("nombre", admin.getFirstname());
				session.setAttribute("apellido", admin.getLastname());
				req.getRequestDispatcher("index.jsp").forward(req, res);
				
				
			} else {
				req.getRequestDispatcher("access.jsp").forward(req, res);
				
				pw.println("<div class=\"tab\">Incorrect UserName or PassWord</div>");
			}
		
		
	}
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		RequestDispatcher reqDis =req.getRequestDispatcher("access.jsp");
		reqDis.forward(req, res);
	}
	
	
	
	
}