package entities;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.*;


@Table(name="students")
@Entity(name="student")
public class Student implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "NIA")
	private int NIA;
	
	@Column(name="firstname")
	private String firstname;
	
	@Column(name="surnames")
	private String surnames;
	
	@Column(name="birth")
	private Date birth;
	
	
	
	public Student() {
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
	
	
	
	
}