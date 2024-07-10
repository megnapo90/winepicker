package com.kh.winepicker.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.core.io.ResourceLoader;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.ProductFilters;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.product.model.service.ProductService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequiredArgsConstructor
@Slf4j
public class ProductFilter {

	private final ProductService productService;
	private final ServletContext application;
	private final ResourceLoader resourceLoader;
	
	
	@GetMapping("/product/searchByVolume")
    public List<WineExt>searchByVolume(@RequestParam(value="volumes", required = false) List<Integer> volumes,
    		@RequestParam(value="countries", required = false) List<Integer> countries,
    		Model model
    		
    		) {
		
		if (volumes == null) volumes = new ArrayList<>();
	    if (countries == null) countries = new ArrayList<>();
		
		Map<String, Object> params = new HashMap<>();
	    params.put("volumes", volumes);
	    params.put("countries", countries);
		
	    System.out.println("Received volumes: " + volumes);  
	    System.out.println("Received types: " + countries);  
		
	    
		List<WineExt> result = productService.searchByVolume(params);
		
		model.addAttribute("wine", result);
		
		return result;
	}
	
	
	
	
}
