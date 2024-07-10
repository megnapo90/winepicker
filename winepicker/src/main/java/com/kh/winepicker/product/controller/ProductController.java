package com.kh.winepicker.product.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.admin.model.service.AdminService;
import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineImage;
import com.kh.winepicker.model.vo.WineType;
import com.kh.winepicker.product.model.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
@Slf4j
public class ProductController {
	
	private final AdminService adminService;
	private final ProductService productService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;

	
	
	/* 상품 등록 */
	@GetMapping("/enrollWine")
	public String enrollWineForm(
			Model model
			) {
		
		List<Grape> gList = adminService.grapeList();
		model.addAttribute("gList", gList);
		
		List<Country> cList = adminService.countryList();
		model.addAttribute("cList", cList);
		
		List<WineType> wtList = adminService.selectTypeList();
		model.addAttribute("wtList", wtList);
		
		return "product/productEnrollForm";
	}
	
//	@PostMapping("/enrollWine")
//	public String insertWine(
//			Wine wine,
//			Characteristic taste,
//			RedirectAttributes ra,
//			@RequestParam(value="upfile") MultipartFile upfile
//			) {
//		
//			
//		WineImage wi = null;
//		
//		
//		if(upfile != null && !upfile.isEmpty()) {
//			String webpath = "/resources/images/product/";
//			String serverFolderPath = application.getRealPath(webpath);			
//
//			File dir = new File(serverFolderPath);
//			if(!dir.exists()) {
//				dir.mkdirs();
//			}
//
//			String changeName = Utils.saveFile(upfile, serverFolderPath);
//			
//			wi = new WineImage();
//			wi.setChangeName(changeName);
//			wi.setOriginName(upfile.getOriginalFilename());
//		
//		}
//		
//		int result = 0;
//	
//		try {
//			result = productService.insertWine(wine, wi, taste);
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
//			
//		String url = "";
//		if(result > 0) {
//			ra.addFlashAttribute("alertMsg", wine.getWineName()+"등록 성공 ");
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
	
	
	@PostMapping("/enrollWine")
	public String insertWine(
			Characteristic characteristic,
			Country country,
			Grape grape,
			WineImage wineImage,
			WineType wineType,
			WineExt wineExt,
			RedirectAttributes ra,
			@RequestParam(value="upfile") MultipartFile upfile
			) {
		
		
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
		}
		
		
		wineExt.setWineImage(wineImage);
		wineExt.setCharacteristic(characteristic);
		
		int result = 0;
		
		try {
			result = adminService.insertWine2(wineExt);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		String url = "";
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", wineExt.getWineName()+"등록 성공 ");
			url = "redirect:/admin/enrollWine";
		}else {
			
			url = "/product/productEnrollForm";
		}
		
		
		
		return url;
	}
	
	
	
	
	
	
	
	
	@GetMapping("/updatewine/{wineNo}")
	public String updateWine(
			@PathVariable("wineNo") int wineNo,
			Model model
			) {
		
		WineExt wine = (WineExt)productService.selectWine(wineNo);
		wine.setContent(Utils.newLineclear(wine.getContent()));
		
		model.addAttribute("wine", wine);
		return "product/productUpdateForm";
		
	}
	
	
	
	
	
	@PostMapping("/deletewine/{wineNo}")
	public String deleteWine(
			@PathVariable("wineNo") int wineNo
			) {
		
				try {

					productService.deleteWine(wineNo);

				} catch (Exception e) {
					e.printStackTrace();
				}

		return "redirect:/admin/adminPage";
		
	}

	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

	
	
	
	
	
	
	
	
	
	
	
	
	
	

