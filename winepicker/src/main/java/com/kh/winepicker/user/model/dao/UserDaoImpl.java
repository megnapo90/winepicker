package com.kh.winepicker.user.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public String findId(String userName, String userEmail) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userName", userName);
		paramMap.put("userEmail", userEmail);

		return sqlSession.selectOne("user.findId", paramMap);
	}

	@Override
	public String findPwd(String userId, String userEmail) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("userEmail", userEmail);

		return sqlSession.selectOne("user.findPwd", paramMap);
	}

	@Override
	public User findUserByEmail(String email) {
		return sqlSession.selectOne("userMapper.findUserByEmail", email);
	}

	@Override
	public int updateUserVerificationStatus(String userEmail, boolean status) {
		User user = new User();
		user.setUserEmail(userEmail);
		user.setVerified(status);
		return sqlSession.update("UserMapper.updateUserVerificationStatus", user);
	}

	
}
