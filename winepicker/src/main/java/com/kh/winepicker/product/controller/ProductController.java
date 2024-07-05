package com.kh.winepicker.product.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineImage;
import com.kh.winepicker.product.model.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
@Slf4j
public class ProductController {
	
	private final ProductService productService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;

	
	
	/* 상품 등록 */
	@GetMapping("/enrollWine")
	public String enrollWineForm(
			
			) {
		
		return "product/productEnrollForm";
	}
	
	@PostMapping("/enrollWine")
	public String insertWine(
			Wine wine,
			RedirectAttributes ra,
			@RequestParam(value="upfile") MultipartFile upfile
			) {
			
		WineImage wi = null;
		
		if(upfile != null && !upfile.isEmpty()) {
			String webpath = "/resources/images/product/";
			String serverFolderPath = application.getRealPath(webpath);			

			File dir = new File(serverFolderPath);
			if(!dir.exists()) {
				dir.mkdirs();
			}

			String changeName = Utils.saveFile(upfile, serverFolderPath);
			
			wi = new WineImage();
			wi.setChangeName(changeName);
			wi.setOriginName(upfile.getOriginalFilename());
		
		}
		
		int result = 0;
	
		try {
			result = productService.insertWine(wine, wi);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
			
		String url = "";
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", wine.getWineName());
			url = "redirect:/admin";
		}else {
			
			url = "/product/productEnrollForm";
		}
		
		
			
		return url;
	}
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
