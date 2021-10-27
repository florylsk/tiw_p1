package entities;

import javax.persistence.*;

import beans.*;

@Table(name="subscriptions")
@Entity(name="sub")
public class Subscription{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@Column(name = "ID")
	private Long subID;
	
	@Column(name="alumno")
	private Student estudiante;
	
	@Column(name="master")
	private Master master;
	
}