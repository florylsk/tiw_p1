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
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import beans.*;
import sql.IAdminConstants;
import sql.IStudentConstants;



@WebServlet(urlPatterns = {"/addStudent" })
public class CreateStudentServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CreateStudentServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		
		PrintWriter pw = res.getWriter();
		String _firstname= req.getParameter(IStudentConstants.COLUMN_FIRSTNAME);
		String _surnames= req.getParameter(IStudentConstants.COLUMN_SURNAMES);
		String _NIA= req.getParameter(IStudentConstants.COLUMN_NIA);
		int NIA=Integer.parseInt(_NIA);
		String _birth= req.getParameter(IStudentConstants.COLUMN_BIRTH);
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date dtt=null;
		try {
			dtt = df.parse(_birth);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Date birth= new Date(dtt.getTime());
		Student s = new Student (_firstname,_surnames,NIA,birth);
		int status = studentDAO.createStudent(s);
		req.setAttribute("student_added", true);
		req.getRequestDispatcher("crud.jsp").forward(req, res);
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}