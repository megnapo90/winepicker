package com.kh.winepicker.user.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {
	
	private final UserService userService;
	private final BCryptPasswordEncoder encoder;
	private final ServletContext application;


	
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
	public String selectMyWishList(
			Model model,
			@ModelAttribute("loginUser") User loginUser
			) {
		int userNo = loginUser.getUserNo();
		userNo = 1;	//이후 지워야 함.
		
		List<Wine> wishList = userService.selectMyWishList(userNo);
		String path = "resource/images/wine";
		
		model.addAttribute("wishList", wishList);
		model.addAttribute("path", path);
		
		return "user/myWishList";
	}
	
	
		
	//mypage 메뉴 중 고객센터로 이동
	@GetMapping("/callCenter")
	public String selectFaqList(
			Model model
			) {
		
		List<Faq> faqList = userService.selectFaqList();
		
		model.addAttribute("faqList", faqList);
		
		log.info("faqList ? {}", faqList);
		
		return "user/callCenter";
	}
	
	@ResponseBody
	@GetMapping("/faqDetail/{faqNo}")
	public Faq showFaqContent(
			@PathVariable("faqNo") int faqNo,
			Model model
			) {
		
		Faq faq = userService.selectFaq(faqNo);
		
		model.addAttribute("faq", faq);
		
		log.info("faq ? {}", faq);
		
		return faq;
	}
	
	//mypage 메뉴 중 공지사항으로 이동
	@GetMapping("/userNotice")
	@ResponseBody
	public String userNotice() {
		return "user/userNotice";
	}
	
	
	
	
	
	
}





