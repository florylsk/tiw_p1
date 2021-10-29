package entities;

import java.io.Serializable;

import javax.persistence.*;


@Table(name="subscriptions")
@Entity(name="subscription")
public class Subscription implements Serializable{
	 
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue( strategy = GenerationType.AUTO )
	@Column(name="id")
	private int id;
	
	@JoinColumn(name="student")
	private Student student;
	
	@JoinColumn(name="master")
	private Master master;
	
	public Subscription () {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Master getMaster() {
		return master;
	}

	public void setMaster(Master master) {
		this.master = master;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}