package com.kh.winepicker.user.model.dao;

import com.kh.winepicker.model.vo.User;

import java.util.List;

public interface UserDao {

	User login(User user);

	int insertUser(User user);

	List<User> selectUserList();

	int idCheck(String userId);

	String findId(String userName, String userEmail);

	String findPwd(String userId, String userEmail);

	User findUserByEmail(String userEmail);

	int updateUserVerificationStatus(String userEmail, boolean status);


}
