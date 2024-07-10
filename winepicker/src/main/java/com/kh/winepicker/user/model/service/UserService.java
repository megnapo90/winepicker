package com.kh.winepicker.user.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;

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

	List<Faq> selectFaqList();
	
	Faq selectFaq(int faqNo);
	
	List<Wine> selectMyWishList(int userNo);

	List<History> selectMyPurchaseList(int userNo);

}