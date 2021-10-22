package beans;

import java.sql.Blob;
import java.sql.Date;

public class Student{
	private String firstname;
	private String surnames;
	//No se si seria mejor que fuera solo 1 atributo que tuviera los dos apellidos para evitar problemas como tu caso
	private int NIA;
	private Date birth;
	private Blob photo; //lo quitaria al menos hata terminar lo obligatorio y luego si quieres lo podemos meter
	
	
	
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


	public Blob getPhoto() {
		return this.photo;
	}
	public void setPhoto(Blob photo) {
		this.photo=photo;
	}
	
	

	
	
	
}