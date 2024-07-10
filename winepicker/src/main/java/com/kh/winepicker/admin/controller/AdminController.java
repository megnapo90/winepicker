package com.kh.winepicker.admin.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.admin.model.service.AdminService;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineType;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {

	private final AdminService adminService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;
	
	
//	============================== 관리자 페이지로 이동 =======================================
	@GetMapping("/adminPage")
	public String adminPage(
			Model model
			) {
		
		List<WineExt> wList = adminService.selectWineList();
		
		model.addAttribute("wList", wList);
		
		return "admin/adminPage";
	}
	
		
//	@GetMapping("/country")
//	public String countryList(
//			Model model
//			) {
//		
//		List<Country> cList = adminService.countryList();
//		
//		model.addAttribute("country", cList);
//		
//		return "info/info-country.jsp";
//	}
	
	@GetMapping("/grape")
	public String grapeList(
			Model model
			) {
		
		List<Grape> gList = adminService.grapeList();
		model.addAttribute("grape", gList);
		
		return "info/info-grape.jsp";
	}
	
//	========================== 공지글 게시판 ==========================================
	@GetMapping("/notice")
	public String noticeList(
			Notice n,
			Model model
			) {
		List<Notice> nList = adminService.noticeList();
		
		model.addAttribute("nList", nList);
		
		return "admin/notice/noticeListView";
	}
	
	@GetMapping("/notice/noticeDetail/{noticeNo}")
	public String noticeDetail(
			@PathVariable("noticeNo") int noticeNo,
			Model model
			) {
		Notice n = adminService.noticeDetail(noticeNo);
		
		model.addAttribute("notice", n);
		
		return "admin/notice/noticeDetailView";
	}
	
	
	@GetMapping("/noticeEnroll")
	public String noticeEnrollForm() {
		return "admin/notice/noticeEnrollForm";
	}
	
	@PostMapping("/noticeEnroll")
	public String noticeEnroll(
			Notice n,
			RedirectAttributes ra
			) {
		int result = adminService.noticeEnroll(n);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "공지 등록 성공");
		}else {
			ra.addFlashAttribute("alertMsg", "공지 등록 실패...");
		}
		
		return "redirect:/admin/notice";
	}
	
	@GetMapping("/deleteNotice/{noticeNo}")
	public String deletNotice(
			Notice n,
			RedirectAttributes ra
			) {
		int result = adminService.deleteNotice(n);
		
		if(result>0) {
			ra.addFlashAttribute("alertMsg", "공지사항 삭제 성공!");
		}else {
			ra.addFlashAttribute("alertMsg", "삭제 실패...");
		}
		return "redirect:/admin/notice";
	}
	
	
	
//	============================== 정보글 페이지로 이동 ==============================
	
//	@GetMapping("/info/{infoName}")
//	public String infoDept1(
//			@PathVariable("infoName") String infoName,
//			Model model,
//			Info2 info
//			) {
//		
//		if(infoName.toLowerCase().equals("country")) {
//			
//			List<Country> cList = adminService.countryList();
//
//			model.addAttribute("cList", cList);
//			
//			return "admin/info/countryPage";
//			
//		}else {
//			
//			infoName = infoName.toUpperCase();
//			
//			info = adminService.selectInfo(infoName); // FRANCE
//			
//			log.info("info : {}", info);
//			
//			int depth = info.getDepth() + 1 ; 
//			
//			info.setDepth(depth); // FRANCE 4
//			
//			
//			if(depth <= 3) {
//				List<Info2> iList = adminService.selectInfoList(info);
//				model.addAttribute("iList", iList); // d1 list
//			}
//			
//			model.addAttribute("info", info); // main 1, 
//			
//			log.info("info : {}", info);
//			
//			return "admin/info/infoPage";
//		}
//		
//	}
	
	
	@GetMapping("info/{infoName}")
	public String infoList(
			Model model,
			@PathVariable("infoName") String infoName,
			Info2 info
			) {
		
		List<Info2> iList = adminService.selectInfoList();
		
		model.addAttribute("iList", iList);
		
		
		infoName = infoName.toUpperCase();
		
		info = adminService.selectInfo(infoName);
		
		model.addAttribute("info", info);
		
		return "admin/info/infoPage";
	}
	
	
	
	
//	=============================== 정보글 수정 ============================================
	@PostMapping("/updateInfo")
	public String updateInfo(
			Info2 i,
			RedirectAttributes ra
			) {
		System.out.println(i);
		
		
		int result = adminService.updateInfo(i);
		
		if(result>0) {
			ra.addFlashAttribute("alertMsg", "정보글 수정 성공!");
		}else {
			ra.addFlashAttribute("alertMsg", "정보글 수정 실패...");
		}
		
		return "redirect:/admin/info/"+i.getInfoName();
		
	}
	
//	=============================== 상품정보 수정 ========================================
	
	@GetMapping("/updateWine/{wineNo}")
	public String updateWineForm(
			WineExt wine,
			Model model
			) {
		System.out.println(wine.getWineNo());
		
		int wineNo = wine.getWineNo();
		
		wine = adminService.selectWine(wineNo);
		
		
		model.addAttribute("wine", wine);
		
		log.info("wine : {}",wine);
		
		
		return "admin/updateWineForm";
	}
	
	
	@PostMapping("/updateWine/{wineNo}")
	public String updateWine(
			WineExt wine,
			Model model,
			RedirectAttributes ra
			) {
		
		int result = adminService.updateWine(wine);
		
		return "";
	}
	
	

	
	
	
	
	
	
	
	
	
	
	
	
//	===================================== 정보글 등록 ==========================================
	@GetMapping("/insertInfo")
	public String insertInfoForm() {
		return "admin/insertInfoForm";
	}
	
	@PostMapping("/insertInfo")
	public String insertInfo(
			Info i,
			RedirectAttributes ra
			) {
		
		int result = adminService.insertInfo(i);
		
		if(result>0) {
			ra.addFlashAttribute("alertMsg", "정보글 등록 성공!");
		}else {
			ra.addFlashAttribute("alertMsg", "정보글 등록 실패...");
		}
		return "redirect:/admin/adminPage";
	}
	
	@GetMapping("/insertInfo/selectInfoList")
	@ResponseBody
	public HashMap<String, Object> insertInfoSelect(
			Info2 info
			//@RequestParam(value = "infoName") String infoName
			) {
		String infoName = info.getInfoName();
		
		System.out.println(infoName);
		HashMap<String, Object> map = new HashMap<>();
		
		infoName = infoName.toUpperCase();
		
		info = adminService.selectInfo(infoName);
		
		log.info("info : {}", info);
		
		map.put("infoName", info.getInfoName());
		map.put("content", info.getContent());
		map.put("subtitle", info.getSubtitle());
		map.put("originName", info.getOriginName());
		map.put("changeName", info.getChangeName());
		map.put("countryNo", info.getCountryNo());
		map.put("wineTypeNo", info.getWineTypeNo());
		map.put("grapeNo", info.getGrapeNo());
		map.put("depth", info.getDepth());
		
		
		return map;
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
