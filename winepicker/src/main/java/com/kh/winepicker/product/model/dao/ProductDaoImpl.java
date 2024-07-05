package com.kh.winepicker.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Characteristic;
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
	public int insertWineImg(WineImage wineImage) {
		return sqlSession.insert("product.insertWineImg", wineImage);
	}

	@Override
	public int insertWinetaste(Characteristic characteristic) {
		return sqlSession.insert("product.insertTaste", characteristic);
	}

	@Override
	public Wine selectWine(int wineNo) {
		return sqlSession.selectOne("product.selectWine",wineNo);
	}

	@Override
	public void deleteWine(int wineNo) {
		sqlSession.delete("product.deleteWine", wineNo);
	}

	@Override
	public WineImage getWineNum(int wineNo) {
		
		return sqlSession.selectOne("product.getWineNum",wineNo);
	}

	



	

	
	
	
}
