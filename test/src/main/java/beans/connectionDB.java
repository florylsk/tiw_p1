package beans;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import sql.IAdminConstants;



public class connectionDB{
	
	public static Connection getConnection() {
	
		Connection con = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("tiw_p1DS");
			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	
	
	}
	
	
	
	
	
}