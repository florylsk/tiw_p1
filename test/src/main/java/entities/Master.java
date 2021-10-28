package entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

@Table(name="masters")
@Entity(name="master")
public class Master implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	private int id;
	

	@Column(name="nombre")
	private String nombre;
	
	@Column(name="escuela")
	private String escuela;
	
	@Column(name="descripcion")
	private String descripcion;
	

	@Column(name="curso")
	private String curso;
	
	public Master() {}
	
	public int getID() {
		return id;
	}


	public void setID(int iD) {
		id = iD;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getEscuela() {
		return escuela;
	}


	public void setEscuela(String escuela) {
		this.escuela = escuela;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public String getCurso() {
		return curso;
	}


	public void setCurso(String curso) {
		this.curso = curso;
	}


	
	
	
	
}