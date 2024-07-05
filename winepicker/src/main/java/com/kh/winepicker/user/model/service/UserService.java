package com.kh.winepicker.user.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;

public interface UserService {

	List<User> selectUserList();

	List<Faq> selectFaqList();

	Faq selectFaq(int faqNo);

	List<Wine> selectMyWishList(int userNo);

}
