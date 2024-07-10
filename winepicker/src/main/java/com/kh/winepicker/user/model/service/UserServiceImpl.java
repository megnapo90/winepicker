package com.kh.winepicker.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.user.model.dao.UserDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class UserServiceImpl implements UserService {

	private final UserDao userDao;


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
	public String findId(String userName, String userEmail) {
		return userDao.findId(userName, userEmail);
	}

	@Override
	public String findPwd(String userId, String userEmail) {

		return userDao.findPwd(userId, userEmail);
	}

	@Override
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
	public List<History> selectMyPurchaseList(int userNo) {
		return userDao.selectMyPurchaseList(userNo);
	}



}