package com.kh.winepicker.user.model.service;

import com.kh.winepicker.model.vo.User;

import java.util.List;

public interface UserService {

	User login(User user);

	int insertUser(User user);

	List<User> selectUserList();

	int idCheck(String userId);

	String findId(String userName, String userEmail);

	String findPwd(String userId, String userEmail);

	void sendSimpleMessage(String userEmail, String subject, String text);

	User findUserByEmail(String userEmail);



}