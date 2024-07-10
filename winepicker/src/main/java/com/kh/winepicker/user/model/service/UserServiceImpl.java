package com.kh.winepicker.user.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.Wish;
import com.kh.winepicker.user.model.dao.UserDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {


	private final UserDao userDao;

	@Override
	public User login(User user) {
		return userDao.login(user);
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public List<User> selectUserList() {
		return userDao.selectUserList();
	}

	@Override
	public int idCheck(String userId) {
		return userDao.idCheck(userId);
	}
	
	public List<Faq> selectFaqList() {
		return userDao.selectFaqList();
	}

	@Override
	public Faq selectFaq(int faqNo) {
		return userDao.selectFaq(faqNo);
	}

	@Override
	public List<Wine> selectMyWishList(int userNo) {
		return userDao.selectMyWishList(userNo);

	}

	@Override
	public String findId(String userName, String userEmail) {
		return userDao.findId(userName,userEmail);
	}

	@Override
	public List<History> selectMyPurchaseList(int userNo) {
		return userDao.selectMyPurchaseList(userNo);
	}

	@Override
	public int deleteWishItem(Wish wishItem) {
		return userDao.deleteWishItem(wishItem);
	}

	@Override
	public List<History> searchMyReview(HashMap<String, String> paramMap) {
		return userDao.searchMyReview(paramMap);
	}

	@Override
	public int insertMyReview(HashMap<String, Object> paramMap) {
		return userDao.insertMyReview(paramMap);
	}

	@Override
	public History selectReviewItem(int orderNo) {
		return userDao.selectReviewItem(orderNo);
	}

	@Override
	public Review selectReviewOne(int orderNo) {
		return userDao.selectReviewOne(orderNo);
	}

	@Override
	public int updateMyReview(HashMap<String, Object> paramMap) {
		return userDao.updateMyReview(paramMap);
	}

	@Override
	public int deleteMyReview(int orderNo) {
		return userDao.deleteMyReview(orderNo);
	}

	

	


}