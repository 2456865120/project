package nuc.ss.bean;

import java.io.Serializable;

public class Completion implements Serializable{

	private Integer id;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Completion() {
		super();
	}
	public Completion(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	
}
