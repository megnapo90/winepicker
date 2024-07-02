package com.kh.winepicker.ask.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.ask.model.service.AskService;
import com.kh.winepicker.model.vo.Ask;
import com.kh.winepicker.model.vo.User;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ask")
@RequiredArgsConstructor
//@SessionAttributes({"loginUser"})
public class AskController {

	private final AskService askService;
	
	//1:1문의사항화면 -> 문의글 조회
	@GetMapping("/askPage")
	public String showAskList(
			Model model,
			@ModelAttribute("loginUser") User loginUser
			) {
		int loginUserNo = loginUser.getUserNo();
		
		List<Ask> askList = askService.showAskList(loginUserNo);
		
		model.addAttribute("askList", askList);
		
		return "ask/askPage";
	}
	
	//1:1문의사항 작성
	@GetMapping("/askInsert")
	public String askInsertForm() {
		return "ask/askInsertForm";
	}
	
	@PostMapping("/askInsert")
	public String insertAsk(
			Ask ask,
			@ModelAttribute("loginUser") User loginUser,
			Model model,
			RedirectAttributes ra,
			@RequestParam(value="upfile", required=false) MultipartFile upfile
			) {
		
//		ask.setUserNo(loginUser.getUserNo());
		
		int result = 0;
		
		try {
			result = askService.insertAsk(ask);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		String url = "";
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "글 등록이 실패하였습니다.");
			url="ask/askPage";
		}else {
			model.addAttribute("errorMsg", "글 작성이 실패하였습니다.");
			url="ask/askInsertForm";
		}

		return url;
	}
	
	
	
}