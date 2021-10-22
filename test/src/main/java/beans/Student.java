package beans;

import java.sql.Blob;

public class Student{
	private String firstname;
	private String surname1;
	private String surname2;
	private int NIA;
	private Blob photo;
	
	
	
	public Student(String firstname, String surname1, String surname2, int NIA) {
		  this.firstname=firstname;
		  this.surname1=surname1;
		  this.surname2=surname2;
		  this.NIA=NIA;
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
	
	public String getSurname2() {
		return this.surname2;
	}
	public void setSurname2(String surname2) {
		this.surname2=surname2;
	}
	
	public int getNIA() {
		return this.NIA;
	}
	public void setNIA(int NIA) {
		this.NIA=NIA;
	}
	
	public Blob getPhoto() {
		return this.photo;
	}
	public void setPhoto(Blob photo) {
		this.photo=photo;
	}
	
	

	
	
	
}