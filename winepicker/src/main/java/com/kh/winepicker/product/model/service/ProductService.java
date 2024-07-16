package com.kh.winepicker.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.HistoryExt;
import com.kh.winepicker.model.vo.ProductFilters;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineImage;

public interface ProductService {

	int insertWine(Wine wine, WineImage wineImage, Characteristic characteristic) throws Exception;

	Wine selectWine(int wineNo);

	void deleteWine(int wineNo);

	WineImage getWineNum(int wineNo);

	List<WineExt> getWineList(PageInfo pi, Map<String, Object> paramMap);

	int selectListCount(Map<String, Object> paramMap);

	int getMaxPrice();

	int getMinPrice();

	List<WineExt> getwineList(List<Integer> volumes);

	List<WineExt> searchByAjax( Map<String, Object> params);

	List<WineExt> orderPage(Map<String, Object> paramss);

	int orderPage2(HistoryExt historyExt);

	List<WineExt> getNewProductList(Map<String, Object> paramMap);



	Wine getWineById(int wineNo);

	

	
	
	

	




	

	


	




}
