package com.ssafy.board.model.service;

import java.util.List;

import com.ssafy.board.model.dto.SearchCondition;
import com.ssafy.board.model.dto.User;

public interface UserService {

	int insert(User user);
	
	int delete(String id);
	
	int modifyUser(User user);
	
	User selectUserByID(String id);
	
	User selectUserByEmail(String email);
	
	List<User> selectAll();
	
	List<User> searchByCondition(SearchCondition con);
	
}
