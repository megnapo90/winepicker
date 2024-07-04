package com.kh.winepicker.user.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class UserDaoImpl implements UserDao{

	private final SqlSessionTemplate sqlSession;

	@Override
	public List<User> selectUserList() {
		return sqlSession.selectList("user.selectUserList");
	}

	@Override
	public List<Faq> selectFaqList() {
		return sqlSession.selectList("user.selectFaqList");
	}

	@Override
	public Faq selectFaq(int faqNo) {
		return sqlSession.selectOne("user.selectFaq", faqNo);
	}

	@Override
	public List<Wine> selectMyWishList(int userNo) {
		return sqlSession.selectList("user.selectMyWishList", userNo);
	}
	
}
