package com.kh.winepicker.product.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineImage;

public interface ProductService {

	int insertWine(Wine wine, WineImage wi, Characteristic taste) throws Exception;




}
