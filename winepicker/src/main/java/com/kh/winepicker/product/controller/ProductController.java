package com.kh.winepicker.product.controller;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.product.model.service.ProductService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/product")
public class ProductController {
	
	private final ProductService productService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;

	@GetMapping("/list")
	public String selectList(
			Model model
			) {
		
		List<Wine> wineList = productService.selectList();
		
		model.addAttribute("wineList", wineList);
		
		return "product/productListView";
	}
	
	@GetMapping("/enrollWine")
	public String enrollWine(
			Model model
			) {
		
		int result = productService.enrollWine();
		
		return "";
	}
	
	@GetMapping("/deleteWine")
	public String deleteWine() {
		
		int result = productService.deleteWine();
		
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
