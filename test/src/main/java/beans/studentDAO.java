package beans;

import java.sql.*;  
import java.util.ArrayList;  
import java.util.List;  



public class studentDAO{
	
	
	public static int createStudent(Student student) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps= con.prepareStatement("insert into students(firstname,surname1,surname2,NIA) values(?,?,?,?)");
			ps.setString(1, student.getFirstname());
			ps.setString(2, student.getSurname1());
			ps.setInt(3, student.getNIA());
			ps.setDate(4, student.getBirth());  //formato de la fecha

			status=ps.executeUpdate();
			con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return status;
	}
	
	
	public static int updateStudent(Student student) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("update students set firstname=?,surname1=?,surname2=?,NIA=? where NIA=?");
			ps.setString(1, student.getFirstname());
			ps.setString(2, student.getSurname1());
			ps.setInt(3, student.getNIA());
			ps.setInt(4, student.getNIA());
			status=ps.executeUpdate();
			con.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	
		
	}
	
	
	public static int deleteStudent(Student student) {
		int status=0;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("delete from students where NIA=?");
			ps.setInt(1, student.getNIA());
			status=ps.executeUpdate();
			con.close();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}
	
	
	public static List<Student> getAllStudents(){
		List<Student> students = new ArrayList<Student>();
		try {
			Connection con= connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from students");
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				Student s = new Student(rs.getString("firstname"),rs.getString("surname1"),rs.getInt("NIA"),rs.getLocalDate("birth")); //Formato fecha
				students.add(s);
			}
			con.close();
		
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}

		
		return students;
	}
	
	
	public static Student getStudentByNIA(int NIA) {
		Student s = null;
		try {
			Connection con=connectionDB.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from students where NIA=?");
			ps.setInt(1, NIA);
			ResultSet rs=ps.executeQuery();  
			while(rs.next()) {
				s=new Student(rs.getString("firstname"),rs.getString("surname1"),rs.getString("surname2"),rs.getInt("NIA"));
			}	
			con.close();
		}
		
		catch (Exception e) {
			e.printStackTrace();
		}	
		return s;
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}