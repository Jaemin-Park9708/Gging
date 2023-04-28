package com.ssafy.board.model.service;

import java.util.List;

import com.ssafy.board.model.dto.Comment;

public interface CommentService {

	int insert(Comment comment);

	int update(Comment comment);

	int delete(int commentNo);

	List<Comment> selectByBoardNo(int boardNo);
	
	List<Comment> selectByUserId(String id);
	
	Comment selectByCommentNo(int commentNo);
}
