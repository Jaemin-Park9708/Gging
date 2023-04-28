package com.ssafy.board.model.dto;

import java.util.List;

public class BoardAndComments {
	private Board board;
	private List<Comment> comments;
	
	public BoardAndComments() {
		
	}
	
	public BoardAndComments(Board board, List<Comment> comments) {
		super();
		this.board = board;
		this.comments = comments;
	}

	public Board getBoard() {
		return board;
	}

	public void setBoard(Board board) {
		this.board = board;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "BoardAndComments [board=" + board + ", comments=" + comments + "]";
	}
	
}
