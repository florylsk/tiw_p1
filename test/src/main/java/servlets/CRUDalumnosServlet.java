package servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

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
import beans.Student;
import beans.loginDAO;
import sql.IAdminConstants;




public class CRUDalumnosServlet extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CRUDalumnosServlet() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
		    throws ServletException, IOException{
		
		//al crear nuevo estudiante pulsando Añadir usuario
		
		/*
		String uName = req.getParameter();
		String uLastName = req.getParameter();
		int uNia = req.getParameter();
		LocalDate uBirth = req.getParameter();
		Student nuevo = new Student(uName,uLastName,uNia,uBirth);*/
		
		//al buscar por nia


		//mostrar todos los alumnos en la tabla
		
		
		req.getRequestDispatcher("crud.jsp").forward(req, res);

		
	}
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		
		req.getRequestDispatcher("crud.jsp").forward(req, res);

	}
	
	
	
	
}