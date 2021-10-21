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

import sql.IAdminConstants;


@WebServlet(urlPatterns = {"/adminlogout" })
public class AdminLogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public AdminLogoutServlet() {
        super();
    }
 
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
		Cookie ck_username = new Cookie("ck_username","");
		Cookie ck_nombre = new Cookie("ck_nombre","");
		Cookie ck_apellido=new Cookie("ck_apellido","");
		res.addCookie(ck_username);
		res.addCookie(ck_nombre);
		res.addCookie(ck_apellido);
		//req.getRequestDispatcher("access.jsp").forward(req, res);
		res.sendRedirect("access.jsp");
    	
    	
    }
	
	
	

	
	
	
	
}

