package com.kh.winepicker.user.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.Wish;

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

	@Override
	public List<History> selectMyPurchaseList(int userNo) {
		return sqlSession.selectList("user.selectMyPurchaseList", userNo);
	}


	@Override
	public int deleteWishItem(Wish wishItem) {
		return sqlSession.delete("user.deleteWishItem", wishItem);
	}

	@Override
	public List<History> searchMyPurchaseList(HashMap<String, String> paramMap) {
		return sqlSession.selectList("user.searchMyPurchaseList", paramMap);
	}

	@Override
	public int insertMyReview(HashMap<String, Object> paramMap) {
		return sqlSession.insert("user.insertMyReview", paramMap);
	}

	@Override
	public History selectReviewItem(int orderNo) {
		return sqlSession.selectOne("user.selectReviewItem", orderNo);
	}

	@Override
	public Review selectReviewOne(int orderNo) {
		return sqlSession.selectOne("user.selectReviewOne", orderNo);
	public List<String> findId(String userName, String userEmail) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userName", userName);
		paramMap.put("userEmail", userEmail);
		return sqlSession.selectList("user.findId", paramMap);
	}

	@Override
	public int updateMyReview(HashMap<String, Object> paramMap) {
		return sqlSession.update("user.updateMyReview", paramMap);
	public boolean isUserValid(String userId, String userEmail) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("userEmail", userEmail);
		Integer count = sqlSession.selectOne("user.isUserValid", paramMap);
		return count != null && count > 0;
	}

	@Override
	public int deleteMyReview(int orderNo) {
		return sqlSession.delete("user.deleteMyReview", orderNo);
	public boolean updateUserPassword(String userId, String newPwd) {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userId", userId);
		paramMap.put("newPwd", newPwd);
		int rowsAffected = sqlSession.update("user.updateUserPassword", paramMap);
		return rowsAffected > 0;
	}

}
