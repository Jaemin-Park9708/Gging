package com.ssafy.board.model.service;

import org.springframework.stereotype.Service;

import com.ssafy.board.model.dto.Email;

@Service
public interface EmailService {
	
	void sendMail(Email email);

}