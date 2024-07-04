package com.kh.winepicker.user.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.user.model.dao.UserDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

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

}