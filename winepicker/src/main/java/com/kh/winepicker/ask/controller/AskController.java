package com.kh.winepicker.ask.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
@SessionAttributes({"loginUser"})
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
		
		return "ask/askListView";
	}
	
	//1:1문의사항 작성화면
	@GetMapping("/askInsert")
	public String askInsertForm() {
		return "ask/askInsertForm";
	}
	
	//1:1문의사항 작성 후 등록
	@PostMapping("/askInsert")
	public String insertAsk(
			Ask ask,
			@ModelAttribute("loginUser") User loginUser,
			Model model,
			RedirectAttributes ra,
			//첨부파일
			@RequestParam(value="upfile", required=false) MultipartFile upfile
			) {
		
		ask.setUserNo(loginUser.getUserNo());

		int result = 0;
		
		try {
			result = askService.insertAsk(ask, upfile);
		} catch(Exception e){
			e.printStackTrace();
		}
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "글 등록이 성공하였습니다.");
			//성공시 detail view로 이동?
		}else {
			model.addAttribute("errorMsg", "글 작성이 실패하였습니다.");
		}
		return "redirect:/ask/askPage";
	}
	
	
	@GetMapping("/detail/{askNo}")
	public String selectAskDetail(
			@PathVariable("askNo") int askNo,
			Model model,
			@ModelAttribute("loginUser") User loginUser
			) {
		//문의글 번호 이용하여 문의글 정보 조회
		Ask ask = askService.selectAskDetail(askNo);
		
		model.addAttribute("ask", ask);
		
		return "ask/askDetailView";
	}
	
	
	
	@GetMapping("/delete/{askNo}")
	public String deleteAskDetail(
			@PathVariable("askNo") int askNo,
			Model model,
			@ModelAttribute("loginUser") User loginUser,
			RedirectAttributes ra
			){
		
		int result = 0;
		result = askService.deleteAskDetail(askNo);
		
		if(result > 0) {
			model.addAttribute("alertMsg", "삭제 성공하였습니다.");
		}else {
			model.addAttribute("errorMsg", "삭제 실패하였습니다.");
		}
		
		return "redirect:/ask/askPage";
	}
	
	@GetMapping("/update/{askNo}")
	public String updateAsk(
			@PathVariable("askNo") int askNo,
			Model model
			) {
		
		//Utils의 개행, xxs 파싱.. 처리한 후의 텍스트를 다시 ask의 content에 set하는 작업이 필요
		Ask ask = askService.selectAskDetail(askNo);
		model.addAttribute("ask", ask);
		
		return "ask/askUpdateForm";
	}
	
	@PostMapping("/update/{askNo}")
	public String updateAskDetail(
			Ask ask,
			Model model,
			RedirectAttributes ra,
			@RequestParam(value="upfile", required=false) MultipartFile upfile,
			String deleteImageName
			) {
		log.info("ask ? {}", ask);
		
		int result = askService.updateAskDetail(ask, upfile, deleteImageName);
		
		model.addAttribute("ask", ask);
		
		String url = "";
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "수정에 성공하였습니다.");
			url = "redirect:/ask/detail/"+ask.getAskNo();
		}else {
			model.addAttribute("errorMsg", "수정에 실패하였습니다.");
			url = "ask/askUpdateForm";
		}
		log.info("ask ? {}", ask);
		
		return url;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}