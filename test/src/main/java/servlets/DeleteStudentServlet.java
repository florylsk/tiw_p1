package servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import beans.*;
import sql.IStudentConstants;



@WebServlet(urlPatterns = {"/deleteStudent" })
public class DeleteStudentServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DeleteStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		String _NIA= req.getParameter(IStudentConstants.COLUMN_NIA);
		int NIA=Integer.parseInt(_NIA);
		Student s = studentDAO.getStudentByNIA(NIA);
		int status = studentDAO.deleteStudent(s);	
		req.getRequestDispatcher("crud.jsp").forward(req, res);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}