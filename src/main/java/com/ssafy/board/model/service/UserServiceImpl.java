package com.ssafy.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.board.model.dao.UserDao;
import com.ssafy.board.model.dto.SearchCondition;
import com.ssafy.board.model.dto.User;

@Service
public class UserServiceImpl implements UserService {

	private UserDao userDao;

	@Autowired
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	public UserDao getUserDao() {
		return this.userDao;
	}

	@Override
	@Transactional
	public int insert(User user) {
		return userDao.insert(user);
	}

	@Override
	@Transactional
	public int delete(String id) {
		return userDao.delete(id);
	}
	
	@Override
	@Transactional
	public int  modifyUser(User user) {
		User selected = this.selectUserByID(user.getId());
		selected.setPassword(user.getPassword());
		selected.setAge(user.getAge());
		selected.setImg(user.getImg());
		return userDao.modifyUser(selected);
	}

	@Override
	public User selectUserByID(String id) {
		return userDao.selectUserByID(id);
	}
	
	@Override
	public User selectUserByEmail(String email) {
		return userDao.selectUserByEmail(email);
	}

	@Override
	public List<User> selectAll() {
		return userDao.selectAll();
	}

	@Override
	public List<User> searchByCondition(SearchCondition con) {
		return userDao.searchByCondition(con);
	}

	


}
