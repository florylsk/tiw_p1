package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


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
		
		
		
		RequestDispatcher reqDis =req.getRequestDispatcher("index.jsp");
		reqDis.forward(req, res);

		
		/*PrintWriter pw = res.getWriter();
		String uName = req.getParameter(IAdminConstants.COLUMN_USERNAME);
		String pWord = req.getParameter(IAdminConstants.COLUMN_PASSWORD);
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("tiw_p1DS");
			Connection con = ds.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM " + IAdminConstants.TABLE_ADMINS + " WHERE  "
					+ IAdminConstants.COLUMN_USERNAME + "=? AND " + IAdminConstants.COLUMN_PASSWORD + "=?");
			ps.setString(1, uName);
			ps.setString(2, pWord);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				System.out.println("ahhhh");
				//req.getRequestDispatcher("pages/index.jsp").forward(req, res);
				
				
				//res.sendRedirect("/pages/index.jsp");
				Cookie ck = new Cookie("username",uName);
				
			} else {

				req.getRequestDispatcher("pages/access.jsp").forward(req, res);
				
				pw.println("<div class=\"tab\">Incorrect UserName or PassWord</div>");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}*/
		
		
	}
	protected void doGet(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException{
		PrintWriter pw = res.getWriter();
		pw.println("test");
	}
	
	
	
	
}