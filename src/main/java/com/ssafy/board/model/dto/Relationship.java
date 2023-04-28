package com.ssafy.board.model.dto;

import org.springframework.stereotype.Component;

@Component
public class Relationship {
	private String idA;
	private String idB;
	
	public Relationship(){
	}

	public Relationship(String idA, String idB) {
		super();
		this.idA = idA;
		this.idB = idB;
	}

	public String getIdA() {
		return idA;
	}

	public void setIdA(String idA) {
		this.idA = idA;
	}

	public String getIdB() {
		return idB;
	}

	public void setIdB(String idB) {
		this.idB = idB;
	}

	@Override
	public String toString() {
		return "Relationship [idA=" + idA + ", idB=" + idB + "]";
	}
	
	
}
