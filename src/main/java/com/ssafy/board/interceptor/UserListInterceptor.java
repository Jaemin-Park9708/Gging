package com.ssafy.board.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.ssafy.board.model.dto.User;

@Component
public class UserListInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) {
			session.setAttribute("msg", "로그인을 해주세요.");
			response.sendRedirect("inappropriateAccess");
			return false;
		}
		if (loginUser.getId().equals("administrator")) {
			return true;
		}
		session.setAttribute("msg", "허가된 사용자가 아닙니다.");
		response.sendRedirect("inappropriateAccess");
		return false;
	}

}
