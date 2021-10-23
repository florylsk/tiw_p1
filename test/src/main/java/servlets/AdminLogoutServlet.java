package servlets;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.jms.Queue;
import javax.jms.QueueConnection;
import javax.jms.QueueConnectionFactory;
import javax.jms.QueueSender;
import javax.jms.QueueSession;
import javax.jms.Session;
import javax.jms.TextMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import beans.Admin;
import sql.IAdminConstants;


@WebServlet(urlPatterns = {"/adminlogout" })
public class AdminLogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	 
    public AdminLogoutServlet() {
        super();
    }
 
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
    	HttpSession session = req.getSession();
		
		try {
		InitialContext ctx=new InitialContext();  
        QueueConnectionFactory f=(QueueConnectionFactory)ctx.lookup("myQueueConnectionFactory");  
        QueueConnection con=f.createQueueConnection();  
        con.start();  
        //2) create queue session  
        QueueSession ses=con.createQueueSession(false, Session.AUTO_ACKNOWLEDGE);  
        //3) get the Queue object  
        Queue t=(Queue)ctx.lookup("myQueue");  
        //4)create QueueSender object         
        QueueSender sender=ses.createSender(t);  
        //5) create TextMessage object  
        TextMessage msg=ses.createTextMessage(); 
		//6) write message 
        
        String name=(String) session.getAttribute("nombre");
        String lastName=(String) session.getAttribute("apellido");
        Date inicio = new Date(session.getCreationTime());
        Date fin = new Date(System.currentTimeMillis());
        DateFormat dtf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        msg.setText(name+" "+lastName+" "+dtf.format(inicio)+" "+ dtf.format(fin) );
        //7) send message  
        sender.send(msg);  
          
        //8) connection close  
        con.close();
        session.invalidate();
		}catch
			(Exception e){System.out.println(e);
		}
		
		res.sendRedirect("access.jsp");
	
    	
    	
    }
	
    
	 
	

	
	
	
	
}
