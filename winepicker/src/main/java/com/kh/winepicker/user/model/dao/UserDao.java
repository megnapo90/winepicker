package com.kh.winepicker.user.model.dao;


import java.util.List;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;

public interface UserDao {

	User login(User user);

	int insertUser(User user);

	List<User> selectUserList();

	int idCheck(String userId);

	String findId(String userName, String userEmail);

	String findPwd(String userId, String userEmail);

	User findUserByEmail(String userEmail);

	int updateUserVerificationStatus(String userEmail, boolean status);
  
	List<Faq> selectFaqList();

	Faq selectFaq(int faqNo);

	List<Wine> selectMyWishList(int userNo);

	List<History> selectMyPurchaseList(int userNo);



}
