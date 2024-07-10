package com.kh.winepicker.product.controller;

import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.winepicker.common.Pagination;
import com.kh.winepicker.common.Utils;
import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.ProductFilters;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.product.model.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class ProductUserController {

	private final ProductService productService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;

	@GetMapping("/product/list")
	public String getWineList(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage, Model model) {
		// sortOption이 없으면 기본값 'recent'로 설정
		String sortOption = (String) paramMap.getOrDefault("sortOption", "recent");
		paramMap.put("sortOption", sortOption);

		// 페이징 처리
		int listCount = productService.selectListCount(paramMap);
		int pageLimit = 16;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		// 최소값 최대값 처리
		int maxPrice = productService.getMaxPrice();
		int minPrice = productService.getMinPrice();

		List<WineExt> list = (List<WineExt>) productService.getWineList(pi, paramMap);

		// 넘버 포멧팅 (1000->1,000)
		NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.US);

		for (WineExt wine : list) {
			String formattedPrice = currencyFormat.format(wine.getPrice());
			wine.setFormattedPrice(formattedPrice); // 포맷된 가격을 WineExt 객체에 추가
		}

		model.addAttribute("list", list);
		model.addAttribute("sortOption", sortOption);
		model.addAttribute("pi", pi);
		model.addAttribute("maxPrice", maxPrice);
		model.addAttribute("minPrice", minPrice);
		return "product/productUserListView";
	}


	@GetMapping("/product/search")
	public String getMainPage(@RequestParam Map<String, Object> paramMap,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword, Model model) {
		// sortOption이 없으면 기본값 'recent'로 설정
		String sortOption = (String) paramMap.getOrDefault("sortOption", "recent");
		paramMap.put("sortOption", sortOption);

		// 페이징 처리
		int listCount = productService.selectListCount(paramMap);
		int pageLimit = 16;
		int boardLimit = 10;

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

		List<WineExt> list = (List<WineExt>) productService.getWineList(pi, paramMap);

		// 넘버 포멧팅 (1000->1,000)
		NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.US);

		for (WineExt wine : list) {
			String formattedPrice = currencyFormat.format(wine.getPrice());
			wine.setFormattedPrice(formattedPrice); // 포맷된 가격을 WineExt 객체에 추가
		}

		//
		model.addAttribute("list", list);
		model.addAttribute("sortOption", sortOption);
		model.addAttribute("pi", pi);
		model.addAttribute("keyword", keyword);
		return "product/productUserSearchView";
	}

	@GetMapping("/product/detail/{wineNo}")
	public String selectProduct(@PathVariable("wineNo") int wineNo, Model model) {
		WineExt wine = (WineExt) productService.selectWine(wineNo);
		wine.setContent(Utils.newLineclear(wine.getContent()));

		NumberFormat currencyFormat = NumberFormat.getNumberInstance(Locale.US);
		String formattedPrice = currencyFormat.format(wine.getPrice());

		model.addAttribute("wine", wine);
		model.addAttribute("price", formattedPrice);
		return "product/productDetailView";

	}
	
	//오더페이지 화면처리 
	@GetMapping("/product/order/userNo")
	public String orderProduct(
			@RequestParam(value = "orders[0].wineNo") int wineNo,
			@RequestParam(value="orders[0].wineCount") int wineCount,
			Model model
			) {
	

		List<WineExt> list = (List<WineExt>)productService.orderWineList(wineNo);
		
		model.addAttribute("list", list);
		model.addAttribute("wineCount", wineCount);
		
		return "product/productOrder";
		
		
	}
	
	
	
}
