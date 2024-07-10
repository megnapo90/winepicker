package com.kh.winepicker.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineImage;

public interface ProductDao {

	int insertWine(Wine wine);

	int insertWineImg(WineImage wineImage);

	int insertWinetaste(Characteristic characteristic);

	Wine selectWine(int wineNo);

	void deleteWine(int wineNo);

	WineImage getWineNum(int wineNo);

	

	int selectListCount(Map<String, Object> paramMap);

	List<WineExt> getWineList(PageInfo pi, Map<String, Object> paramMap);

	int getMaxPrice();

	int getMinPrice();

	List<WineExt> getwineList(List<Integer> volumes);

	List<WineExt> searchByVolume(Map<String, Object> params);

	WineExt selectProduct(int wineNo);

	List<WineExt> orderWineList(int wineNo);

	

	



	

	
	

}
