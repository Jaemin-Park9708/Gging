package com.ssafy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.board.model.dao.CommentDao;
import com.ssafy.board.model.dto.Comment;

@Service
public class CommentServiceImpl implements CommentService {
	
	private CommentDao commentDao;
	
	@Autowired
	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	public CommentDao getCommentDao() {
		return this.commentDao;
	}

	@Override
	@Transactional
	public int insert(Comment comment) {
		return commentDao.insert(comment);
	}

	@Override
	@Transactional
	public int update(Comment comment) {
		return commentDao.update(comment);
	}

	@Override
	@Transactional
	public int delete(int commentNo) {
		return commentDao.delete(commentNo);
	}

	@Override
	public List<Comment> selectByBoardNo(int boardNo) {
		return commentDao.selectByBoardNo(boardNo);
	}

	@Override
	public Comment selectByCommentNo(int commentNo) {
		return commentDao.selectByCommentNo(commentNo);
	}

	@Override
	public List<Comment> selectByUserId(String id) {
		return commentDao.selectByUserId(id);
	}

}
