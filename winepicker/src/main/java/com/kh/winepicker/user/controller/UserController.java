package com.kh.winepicker.user.controller;

import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	private final BCryptPasswordEncoder encoder;
	
//	public UserController(UserService userService, BCryptPasswordEncoder encoder) {
//		this.userService = userService;
//		this.encoder = encoder;
//	}
	

	
	@GetMapping("/userList")
	public String selectMemberList(
			Model model
			) {
		List<User> uList = userService.selectUserList();
		
		model.addAttribute("uList", uList);
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//마이페이지로 이동
	@GetMapping("/myPage")
	public String showMyPage() {
		return "user/myPage";
	}
	
	//리뷰관리로 이동
	@GetMapping("/myReview")
	public String showMyReview() {
		return "user/myReview";
	}
	
	//최근 본 상품으로 이동
	@GetMapping("/myRecentProduct")
	public String showMyRecentProduct() {
		return "user/myRecentProduct";
	}

	//관심상품으로 이동
	@GetMapping("/myWishList")
	public String showMyWishList() {
		return "user/myWishList";
	}
		
	//mypage 메뉴 중 고객센터로 이동
	@GetMapping("/callCenter")
	public String userCallCenter() {
		return "user/callCenter";
	}
	
	//mypage 메뉴 중 공지사항으로 이동
	@GetMapping("/userNotice")
	public String userNotice() {
		return "user/userNotice";
	}
	
	
	
	
	
	
}





