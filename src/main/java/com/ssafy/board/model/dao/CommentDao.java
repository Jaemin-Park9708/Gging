package com.ssafy.board.model.dao;

import java.util.List;

import com.ssafy.board.model.dto.Comment;

public interface CommentDao {
	
	int insert(Comment comment);
	
	int update(Comment comment);
	
	int delete(int commentNo);
	
	Comment selectByCommentNo(int commentNo);
	
	List<Comment> selectByUserId(String id);
	
	List<Comment> selectByBoardNo(int boardNo);
}
