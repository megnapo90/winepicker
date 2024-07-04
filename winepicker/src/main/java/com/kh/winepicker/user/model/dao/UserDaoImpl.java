package com.kh.winepicker.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.User;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertUser(User user) {
		return sqlSession.insert("user.insertUser", user);
	}

	@Override
	public User login(User user) {
		return sqlSession.selectOne("user.login", user);
	}



	@Override
	public List<User> selectUserList() {
		return sqlSession.selectList("user.selectUserList");
	}


	@Override
	public int idCheck(String userId) {
		return sqlSession.selectOne("user.idCheck", userId);
	}

}
