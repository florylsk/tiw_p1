package beans;

import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.util.Base64;

public class Student{
	private String firstname;
	private String surnames;
	private int NIA;
	private Date birth;
	private byte[] photo;
	
	
	public Student(String firstname, String surnames,  int NIA, Date birth) {
		  this.firstname=firstname;
		  this.surnames=surnames;
		  this.NIA=NIA;
		  this.birth=birth;
		 }
	
	
	public String getFirstname() {
		return this.firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname=firstname;
	}
	
	public String getSurnames() {
		return this.surnames;
	}
	public void setSurname1(String surnames) {
		this.surnames=surnames;
	}
	
	
	public int getNIA() {
		return this.NIA;
	}
	public void setNIA(int NIA) {
		this.NIA=NIA;
	}
	
	public Date getBirth() {
		return birth;
	}


	public void setBirth(Date birth) {
		this.birth = birth;
	}


	public byte[] getPhoto() {
		
		return photo;
	}
	
	public boolean hasPhoto() {
		boolean temp=false;
		if (photo !=null) {
			temp=true;
		}
		return temp;
	}
	public String getPhotoB64() {
		byte[] temp=Base64.getEncoder().encode(photo);
		String B64 = new String(temp);
		return B64;
	}

	public void setPhoto(byte[] photo) {
		this.photo = photo;
	}



	
	

	
	
	
}