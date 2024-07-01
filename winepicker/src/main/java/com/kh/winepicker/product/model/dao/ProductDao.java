package com.kh.winepicker.product.model.dao;

import java.util.List;

import com.kh.winepicker.model.vo.Wine;

public interface ProductDao {

	List<Wine> selectList();

	int enrollWine();

	int deleteWine();

}
