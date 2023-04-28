package com.ssafy.board.model.dto;

import org.springframework.stereotype.Component;

@Component
public class Board {

	private int no;
	private String title;
	private String id;
	private String content;
	private String generatedDate;
	private String modifiedDate;

	public Board() {

	}
	
	public Board(int no, String title, String id, String content, String generatedDate, String modifiedDate) {
		this.no = no;
		this.title = title;
		this.id = id;
		this.content = content;
		this.generatedDate = generatedDate;
		this.modifiedDate = modifiedDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGeneratedDate() {
		return generatedDate;
	}

	public void setGeneratedDate(String generatedDate) {
		this.generatedDate = generatedDate;
	}

	public String getModifiedDate() {
		return modifiedDate;
	}

	public void setModifiedDate(String modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

	@Override
	public String toString() {
		return "Board [no=" + no + ", title=" + title + ", id=" + id + ", content=" + content + ", generatedDate="
				+ generatedDate + ", modifiedDate=" + modifiedDate + "]";
	}

}
