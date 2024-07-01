package com.kh.winepicker.admin.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.admin.model.service.AdminService;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Notice;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final AdminService adminService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;
	
	
	@GetMapping("/adminPage")
	public String adminPage() {
		return "admin/adminPage";
	}
	
		
	@GetMapping("/country")
	public String countryList(
			Model model
			) {
		
		List<Country> cList = adminService.countryList();
		
		model.addAttribute("country", cList);
		
		return "info/info-country.jsp";
	}
	
	@GetMapping("/grape")
	public String grapeList(
			Model model
			) {
		
		List<Grape> gList = adminService.grapeList();
		
		model.addAttribute("grape", gList);
		
		return "info/info-grape.jsp";
	}
	
	@GetMapping("/insertNotice")
	public String insertNoticeForm(
			) {
		return "admin/insertNoticeForm";
	}
	
	@PostMapping("/insertNotice")
	public String insertNotice(
			Notice n,
			RedirectAttributes ra
			) {
		int result = adminService.insertNotice(n);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "공지 등록 성공");
		}else {
			ra.addFlashAttribute("alertMsg", "공지 등록 실패...");
		}
		
		return "redirect:/admin/adminPage";
	}
	
	@GetMapping("/insertInfo")
	public String insertInfoForm(
			Info i,
			RedirectAttributes ra
			) {
		
		return "admin/insertInfoForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
