package com.ssafy.board.model.dto;

public class EmailAndMsg {
	private String email;
	private String msg;
	EmailAndMsg(){
	}
	public EmailAndMsg(String email, String msg) {
		super();
		this.email = email;
		this.msg = msg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	@Override
	public String toString() {
		return "EmailAndMsg [email=" + email + ", msg=" + msg + "]";
	}
	
}
