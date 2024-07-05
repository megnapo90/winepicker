package com.kh.winepicker.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineImage;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductDaoImpl implements ProductDao{

	private final SqlSessionTemplate sqlSession;

	@Override
	public int insertWine(Wine wine) {
		return sqlSession.insert("product.insertWine", wine);
	}

	@Override
	public int insertWineImg(WineImage wi) {
		return sqlSession.insert("product.insertWineImg", wi);
	}

	
	
	
}
