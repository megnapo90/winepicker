package com.kh.winepicker.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Wine;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ProductDaoImpl implements ProductDao{

	private final SqlSessionTemplate sqlSession;

	@Override
	public List<Wine> selectList() {
		return sqlSession.selectList("product.selectList");
	}

	@Override
	public int enrollWine() {
		return sqlSession.insert("product.enrollWine");
	}

	@Override
	public int deleteWine() {
		return sqlSession.update("product.deleteWine");
	}
}
