package beans;

import java.util.Date;

public class Admin{
	private String username;
	private String password;
	private String firstname;
	private String lastname;
	private Date startTime;
	private Date endTime;

	
	
	
	
	public Admin(String username, String password) {
		  this.username=username;
		  this.password=password;
		 }
	
	
	public String getUsername() {
		return this.username;	
	}
	
	public void setUsername (String username) {
		this.username=username;
	}
	
	public String getPassword() {
		return this.password;	
	}
	
	public void setPassword(String password) {
		this.password=password;
	}
	
	public String getFirstname() {
		return this.firstname;	
	}
	
	public void setFirstname (String firstname) {
		this.firstname=firstname;
	}
	
	public String getLastname() {
		return this.lastname;	
	}
	
	public void setLastname(String lastname) {
		this.lastname=lastname;
	}


	public Date getStartTime() {
		return startTime;
	}


	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}


	public Date getEndTime() {
		return endTime;
	}


	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	

	
}
