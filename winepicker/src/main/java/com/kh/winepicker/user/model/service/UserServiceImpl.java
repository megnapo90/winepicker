package com.kh.winepicker.user.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
@Transactional
public class UserServiceImpl implements UserService {


	@Autowired
	private UserDao userDao;

	@Autowired
	private JavaMailSender mailSender;

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
	public String findPwd(String userId, String userEmail) {

		return userDao.findPwd(userId, userEmail);
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
	public List<History> searchMyPurchaseList(HashMap<String, String> paramMap) {
		return userDao.searchMyPurchaseList(paramMap);
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

	public void sendSimpleMessage(String to, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setFrom("winepickerservice@gmail.com");
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		mailSender.send(message);
	}

	@Override
	public User findUserByEmail(String userEmail) {
		return userDao.findUserByEmail(userEmail);
	}

	 @Override
	    public void save(User user) {
	        userDao.insertUser(user);
	    }

	@Override
	public List<String> findId(String userName, String userEmail) {
		return userDao.findId(userName,userEmail);
	}

	@Override
	public boolean validateUser(String userId, String userEmail) {
		// TODO Auto-generated method stub
		 return userDao.isUserValid(userId, userEmail);
	}

	@Override
	public boolean updatePassword(String userId, String newPwd) {
		// TODO Auto-generated method stub
		return userDao.updateUserPassword(userId, newPwd);
	}

}