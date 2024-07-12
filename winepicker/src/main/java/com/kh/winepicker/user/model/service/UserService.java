package com.kh.winepicker.user.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;

import com.kh.winepicker.model.vo.Review;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.Wish;

public interface UserService {

	
	User login(User user);

	int insertUser(User user);

	List<User> selectUserList();

	int idCheck(String userId);

	String findPwd(String userId, String userEmail);

	void save(User user);

	List<String> findId(String userName, String userEmail);

	boolean validateUser(String userId, String userEmail);

	void sendSimpleMessage(String userEmail, String subject, String text);

	boolean updatePassword(String userId, String newPwd);

	User findUserByEmail(String userEmail);

	int myInfoChange(User user);

	//-----------------------------------------------------------------
	
	List<Faq> selectFaqList();
	
	Faq selectFaq(int faqNo);
	
	List<Wine> selectMyWishList(int userNo);

	List<History> selectMyPurchaseList(int userNo);

	int deleteWishItem(Wish wishItem);

	List<History> searchMyPurchaseList(HashMap<String, String> paramMap);

	int insertMyReview(Review review);

	History selectReviewItem(int orderNo);

	Review selectReviewOne(int orderNo);

	int updateMyReview(Review review);

	int deleteMyReview(int orderNo);

	Wine selectWine(int wineNo);

	int updateUserStatus(int userNo);

	
	



}