package servlets;


import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
import javax.naming.InitialContext;




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
		 //IMPORTANTE:DEBE SER QUEUECONNECTIONFACTORY EN PAYARA
	      QueueConnectionFactory f=(QueueConnectionFactory)ctx.lookup("tiwconnectionfactory");  
	     QueueConnection con=f.createQueueConnection();  
	     con.start(); 
        //2) create queue session  
        QueueSession ses=con.createQueueSession(false, Session.DUPS_OK_ACKNOWLEDGE);  
        //3) get the Queue object  
        Queue t=(Queue)ctx.lookup("tiwqueue");  
        //4)create QueueSender object         
        QueueSender sender=ses.createSender(t);  
        sender.setDisableMessageID(false);
        sender.setDisableMessageTimestamp(false);
        //5) create TextMessage object  
        TextMessage msg=ses.createTextMessage(); 
		//6) write message 
        String username = (String) session.getAttribute("username");
        String name=(String) session.getAttribute("nombre");
        String lastName=(String) session.getAttribute("apellido");
        Date _inicio = new Date(session.getCreationTime());
        Date _fin = new Date(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String inicio = sdf.format(_inicio);
        String fin = sdf.format(_fin);      
        msg.setText(username+";"+name+";"+lastName+";"+inicio+";"+ fin+";");
        //7) send message  
        sender.send(msg);  
        //8) connection close  
        ses.close();
        con.close();
        session.invalidate();
		}catch
			(Exception e){System.out.println(e);
		}
		
		res.sendRedirect("access.jsp");
	
    	
    	
    }
	
    
	 
	

	
	
	
	
}