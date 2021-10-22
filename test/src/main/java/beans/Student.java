package beans;

import java.sql.Blob;
import java.time.LocalDate;

public class Student{
	private String firstname;
	private String surname1;
	//No se si seria mejor que fuera solo 1 atributo que tuviera los dos apellidos para evitar problemas como tu caso
	private int NIA;
	private LocalDate birth;
	private Blob photo; //lo quitaria al menos hata terminar lo obligatorio y luego si quieres lo podemos meter
	
	
	
	public Student(String firstname, String surname1,  int NIA, LocalDate birth) {
		  this.firstname=firstname;
		  this.surname1=surname1;
		  this.NIA=NIA;
		  this.birth=birth;
		 }
	
	
	public String getFirstname() {
		return this.firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname=firstname;
	}
	
	public String getSurname1() {
		return this.surname1;
	}
	public void setSurname1(String surname1) {
		this.surname1=surname1;
	}
	
	
	public int getNIA() {
		return this.NIA;
	}
	public void setNIA(int NIA) {
		this.NIA=NIA;
	}
	
	public LocalDate getBirth() {
		return birth;
	}


	public void setBirth(LocalDate birth) {
		this.birth = birth;
	}


	public Blob getPhoto() {
		return this.photo;
	}
	public void setPhoto(Blob photo) {
		this.photo=photo;
	}
	
	

	
	
	
}