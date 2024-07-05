package com.kh.winepicker.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.User;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao{

	private final SqlSessionTemplate sqlSession;

	@Override
	public List<User> selectUserList() {
		return sqlSession.selectList("user.selectUserList");
	}
	
}
