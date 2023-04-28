package com.ssafy.board.model.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.board.model.dao.BoardDao;
import com.ssafy.board.model.dto.Board;
import com.ssafy.board.model.dto.SearchCondition;

@Service
public class BoardServiceImpl implements BoardService {

	private BoardDao boardDao;

	@Autowired
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	public BoardDao getBoardDao() {
		return this.boardDao;
	}

	@Override
	@Transactional
	public int insert(Board board) {
		return boardDao.insert(board);
	}

	@Override
	@Transactional
	public int update(Board board) {
		Board selected = this.selectByNo(board.getNo());
		selected.setTitle(board.getTitle());
		selected.setContent(board.getContent());
		Date now = new Date();
		SimpleDateFormat nowFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		selected.setModifiedDate(nowFormat.format(now));
		return boardDao.update(selected);
	}

	@Override
	@Transactional
	public int delete(int no) {
		return boardDao.delete(no);
	}

	@Override
	public Board selectByNo(int no) {
		return boardDao.selectByNo(no);
	}

	@Override
	public List<Board> selectByUserId(String id) {
		return boardDao.selectByUserId(id);
	}
	
	@Override
	public List<Board> selectExceptNotice() {
		return boardDao.selectExceptNotice();
	}

	@Override
	public List<Board> selectAll() {
		return boardDao.selectAll();
	}

	@Override
	public List<Board> searchByCondition(SearchCondition con) {
		return boardDao.searchByCondition(con);
	}

}
