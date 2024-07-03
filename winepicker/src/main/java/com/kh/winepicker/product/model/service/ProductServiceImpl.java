package com.kh.winepicker.product.model.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineImage;
import com.kh.winepicker.product.model.dao.ProductDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{
	
	private final ProductDao productDao;
	private final ServletContext application;
	
	
	@Override
	@Transactional(rollbackFor = {Exception.class})
	public int insertWine(Wine wine, WineImage wi) throws Exception {
		String wineName = wine.getWineName();
		String content = wine.getContent();
		
		wineName = Utils.XSSHandling(wineName);
		content = Utils.XSSHandling(content);
		content = Utils.newLineHandling(content);
		
		wine.setWineName(wineName);
		wine.setContent(content);
		
		int result = productDao.insertWine(wine);
		
		int wineNo = wine.getWineNo();
		wi.setWineNo(wineNo);
		
		if(wi != null) {
			result *= productDao.insertWineImg(wi);
		}
		
		if(result == 0) {
			throw new Exception("예외 발생");
		}
		
		return result;
		
		
	}
	
	

	
	
	
	
}
