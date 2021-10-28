package entities;

import javax.persistence.*;

import beans.*;

@Table(name="subscriptions")
@Entity(name="sub")
public class Subscription{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@Column(name = "id")
	private int subID;
	
	@Column(name="studentID")
	private int estudiante;
	
	@Column(name="masterID")
	private int master;
	
	
	
	public int getStudentID() {
		return this.estudiante;
	}
	
	public void setStudentID(int estudiante) {
		this.estudiante=estudiante;
	}
	
	public int getMasterID() {
		return this.master;
	}
	public void setMasterID(int master) {
		this.master=master;
	}
}