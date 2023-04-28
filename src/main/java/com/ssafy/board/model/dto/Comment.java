package com.ssafy.board.model.dto;

import org.springframework.stereotype.Component;

@Component
public class Comment {
	private int commentNo;
	private int boardNo;
	private String id;
	private String content;
	private String generatedDate;
	private String modifiedDate;
	
	public Comment() {
		
	}

	public Comment(int commentNo, int boardNo, String id, String content, String generatedDate, String modifiedDate) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.id = id;
		this.content = content;
		this.generatedDate = generatedDate;
		this.modifiedDate = modifiedDate;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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
		return "Comment [commentNo=" + commentNo + ", boardNo=" + boardNo + ", id=" + id + ", content=" + content
				+ ", generatedDate=" + generatedDate + ", modifiedDate=" + modifiedDate + "]";
	}
	
	
}
