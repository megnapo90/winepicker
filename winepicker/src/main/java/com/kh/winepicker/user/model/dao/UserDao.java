package com.kh.winepicker.user.model.dao;


import java.util.HashMap;
import java.util.List;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.Wish;

public interface UserDao {

	User login(User user);

	int insertUser(User user);

	List<User> selectUserList();

	int idCheck(String userId);

	String findId(String userName, String userEmail);

	List<Faq> selectFaqList();

	Faq selectFaq(int faqNo);

	List<Wine> selectMyWishList(int userNo);

	List<History> selectMyPurchaseList(int userNo);

	int deleteWishItem(Wish wishItem);

	List<History> searchMyPurchaseList(HashMap<String, String> paramMap);

	int insertMyReview(HashMap<String, Object> paramMap);

	History selectReviewItem(int orderNo);

	Review selectReviewOne(int orderNo);

	int updateMyReview(HashMap<String, Object> paramMap);

	int deleteMyReview(int orderNo);



}
