package com.kh.winepicker.user.model.dao;

import java.util.List;

import com.kh.winepicker.model.vo.User;

public interface UserDao {

	List<User> selectUserList();

}
