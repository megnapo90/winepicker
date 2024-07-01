package com.kh.winepicker.user.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.user.model.dao.UserDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{

	private final UserDao memberDao;

	@Override
	public List<User> selectUserList() {
		return memberDao.selectUserList();
	}
}
