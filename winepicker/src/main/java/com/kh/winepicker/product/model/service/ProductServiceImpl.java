package com.kh.winepicker.product.model.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;

import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.product.model.dao.ProductDao;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{
	
	private final ProductDao productDao;
	private final ServletContext application;
	
	@Override
	public List<Wine> selectList() {
		return productDao.selectList();
	}

	@Override
	public int enrollWine() {
		return productDao.enrollWine();
	}

	@Override
	public int deleteWine() {
		return productDao.deleteWine();
	}
	
	
	
	
	
}
