package com.kh.winepicker.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.HistoryExt;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
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

	


	@Override
	public int selectListCount(Map<String, Object> paramMap) {
		return sqlSession.selectOne("product.selectListCount", paramMap);
	}

	@Override
	public List<WineExt> getWineList(PageInfo pi, Map<String, Object> paramMap) {

		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowbounds = new RowBounds(offset,limit);
		return sqlSession.selectList("product.getwineList", paramMap, rowbounds);
	}

	@Override
	public int getMaxPrice() {
		return sqlSession.selectOne("product.getMaxPrice");
	}

	@Override
	public int getMinPrice() {
		return sqlSession.selectOne("product.getMinPrice");
	}

	@Override
	public List<WineExt> getwineList(List<Integer> volumes) {
		return sqlSession.selectList("product.getwineList", volumes);
	}

	@Override
	public List<WineExt> searchByAjax(Map<String, Object> params) {
		return sqlSession.selectList("product.searchByAjax", params);
	}

	@Override
	public List<WineExt> orderPage(Map<String, Object> params) {
		return sqlSession.selectList("product.getwineList", params);
	}

	@Override
	public int updateProductQty(Wine wine) {
		return sqlSession.update("product.updateProductQty",wine );
	}

	@Override
	public int orderPage2(HistoryExt historyExt) {
		return sqlSession.insert("product.insertHistroy",historyExt);
	}

	@Override
	public List<WineExt> getNewProductList(Map<String, Object> paramMap) {
		return sqlSession.selectList("product.getNewProductList",paramMap);
	}


	@Override
	public Wine getWineById(int wineNo) {
		return sqlSession.selectOne("product.cart",wineNo);
	}

	

	

	


	

	
	
	
}
