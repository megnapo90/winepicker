package com.kh.winepicker.user.model.dao;

import java.util.List;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;

public interface UserDao {

	List<User> selectUserList();

	List<Faq> selectFaqList();

	Faq selectFaq(int faqNo);

	List<Wine> selectMyWishList(int userNo);

}
