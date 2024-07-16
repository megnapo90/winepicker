package com.kh.winepicker.user.model.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	String findPwd(String userId, String userEmail);

	User findUserByEmail(String userEmail);

	int updateUserVerificationStatus(String userEmail, boolean status);
  
	boolean isUserValid(String userId, String userEmail);

	boolean updateUserPassword(String userId, String newPwd);

	int myInfoChange(User user);
	
	List<String> findId(String userName, String userEmail);

	// --------------------------------------------------------------------------

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

	int insertWishItem(Map<String, Object> wishItem);

	
// ============================ 민욱 시작 =============================================
	List<User> getAllUsers();
    User getUserById(String userId);
    int deleteUser(String userId);
    int removeUser(String userId);
    List<User> searchUsers(String keyword);
    int deleteUsers(List<String> userIds);
    User selectUserByNo(int userNo);
    int updateUser(User user);
    public List<User> getUsersByNo(List<Integer> userNo);
// ============================ 민욱 끝 =============================================	

	
	

}

