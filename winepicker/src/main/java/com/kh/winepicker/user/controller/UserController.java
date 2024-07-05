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
	
	
	
	
	
	
	
	
	
}





