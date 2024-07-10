package com.kh.winepicker.admin.controller;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.admin.model.service.AdminService;
import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineImage;
import com.kh.winepicker.model.vo.WineType;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
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
	
	
	@GetMapping("info/{infoName}")
	public String infoList(
			Model model,
			@PathVariable("infoName") String infoName,
			Info2 info
			) {
		
		List<Info2> iList = adminService.selectInfoList();
		
		model.addAttribute("iList", iList);
		
		infoName = infoName.toUpperCase();
		
		if(infoName.equals("COUNTRY")) {
			
			List<Country> cList = adminService.countryList();

			model.addAttribute("cList", cList);
			
			return "admin/info/countryPage";
			
		}else {
			info = adminService.selectInfo(infoName);
			
			model.addAttribute("info", info);
			
			return "admin/info/infoPage";
		}
		
	}
	
	
	
	
//	=============================== 정보글 수정 ============================================
	@PostMapping("/infoEnroll")
	public String updateInfo(
			Info2 i,
			RedirectAttributes ra
			) {
		
		
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
		
		List<Grape> gList = adminService.grapeList();
		model.addAttribute("gList", gList);
		
		List<Country> cList = adminService.countryList();
		model.addAttribute("cList", cList);
		
		List<WineType> wtList = adminService.selectTypeList();
		model.addAttribute("wtList", wtList);
		
		int wineNo = wine.getWineNo();
		
		wine = adminService.selectWine(wineNo);
		
		
		model.addAttribute("wine", wine);
		
		
		return "admin/updateWineForm2";
	}
	
	
	@PostMapping("/updateWine/{wineNo}")
	public String updateWine(
			Characteristic characteristic,
			Country country,
			Grape grape,
			WineImage wineImage,
			WineType wineType,
			WineExt wine,
			RedirectAttributes ra,
			@RequestParam(value="upfile", required = false) MultipartFile upfile
			) {
		
		System.err.println(upfile);
		
		if(upfile != null && !upfile.isEmpty()) {
			String webpath = "/resources/images/product/";
			String serverFolderPath = application.getRealPath(webpath);
			File dir = new File(serverFolderPath);
			
			if(!dir.exists()) {
				dir.mkdirs();
			}
			
			String changeName = serverFolderPath.replace("\\", "/") + Utils.saveFile(upfile, serverFolderPath);
			
			wineImage = new WineImage();
			wineImage.setChangeName(changeName);
			wineImage.setOriginName(upfile.getOriginalFilename());
			
			wine.setWineImage(wineImage);
		}
		
		System.err.println(wineImage);
		
		wine.setCharacteristic(characteristic);
		
		int result = 0;
		
		try {
			result = adminService.updateWine(wine);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", wine.getWineName()+"수정 성공 !!");
		}else {
			ra.addFlashAttribute("alertMsg", "수정 실패...");
		}
		
		return "redirect:/admin/adminPage";
	}
	
//	@PostMapping("/enrollWine")
//	public String insertWine(
//			Characteristic characteristic,
//			Country country,
//			Grape grape,
//			WineImage wineImage,
//			WineType wineType,
//			WineExt wineExt,
//			RedirectAttributes ra,
//			@RequestParam(value="upfile") MultipartFile upfile
//			) {
//		
//		
//		if(upfile != null && !upfile.isEmpty()) {
//			String webpath = "/resources/images/product/";
//			String serverFolderPath = application.getRealPath(webpath);
//			File dir = new File(serverFolderPath);
//			if(!dir.exists()) {
//				dir.mkdirs();
//			}
//			
//			String changeName = serverFolderPath.replace("\\", "/") + Utils.saveFile(upfile, serverFolderPath);
//			
//			wineImage = new WineImage();
//			wineImage.setChangeName(changeName);
//			wineImage.setOriginName(upfile.getOriginalFilename());
//		}
//		
//		
//		wineExt.setWineImage(wineImage);
//		wineExt.setCharacteristic(characteristic);
//		
//		int result = 0;
//		
//		try {
//			result = adminService.insertWine2(wineExt);
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
//		
//		String url = "";
//		if(result > 0) {
//			ra.addFlashAttribute("alertMsg", wineExt.getWineName()+"등록 성공 ");
//			url = "redirect:/admin/enrollWine";
//		}else {
//			
//			url = "/product/productEnrollForm";
//		}
//		
//		
//		
//		return url;
//	}
	

	
	
	
	
	
	
	
	
	
	
	
	
//	===================================== 정보글 등록 ==========================================
	@GetMapping("/infoEnroll")
	public String insertInfoForm() {
		return "admin/insertInfoForm";
	}
	
	@PostMapping("/enfoEnroll")
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
	
	@GetMapping("wineTypeList")
	@ResponseBody
	public List<Grape> wineTypeList(
			WineType wineType
			){
		
		List<Grape> gList = adminService.grapeList2(wineType.getWineTypeNo());
		
		
		return gList;
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
