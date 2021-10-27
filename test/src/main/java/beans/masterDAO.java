package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class masterDAO{
	
	
	
	
	public static List<Master> getAllMasters(){
		List<Master> masters = new ArrayList<Master>();
		try {
			Connection con= connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from masters");
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				Master m = new Master(); //Formato fecha
				m.setId(rs.getInt("id"));
				m.setNombre(rs.getString("nombre"));
				m.setCurso(rs.getString("curso"));
				m.setEscuela(rs.getString("escuela"));
				m.setDescripcion(rs.getString("descripcion"));
				masters.add(m);
			}
			con.close();
		
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		
		return masters;
	}
	
	
	public static Master getMasterById(int id) {
		Master m = null;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from masters where id=?");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()) {
				m=new Master();
				m.setId(rs.getInt("id"));
				m.setNombre(rs.getString("nombre"));
				m.setCurso(rs.getString("curso"));
				m.setEscuela(rs.getString("escuela"));
				m.setDescripcion(rs.getString("descripcion"));
			}	
			con.close();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}	
		return m;
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}