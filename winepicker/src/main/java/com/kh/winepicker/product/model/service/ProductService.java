package com.kh.winepicker.product.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Wine;

public interface ProductService {

	List<Wine> selectList();

	int enrollWine();

	int deleteWine();


}
