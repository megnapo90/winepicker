package com.kh.winepicker.user.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.user.model.dao.UserDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

	private final UserDao userDao;

	@Override
	public List<User> selectUserList() {
		return userDao.selectUserList();
	}

	@Override
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
}
