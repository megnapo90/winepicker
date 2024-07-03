package com.kh.winepicker.product.model.dao;

import java.util.List;

import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineImage;

public interface ProductDao {

	int insertWine(Wine wine);

	int insertWineImg(WineImage wi);

	int insertWinetaste(Characteristic taste);

	Wine selectWine(int wineNo);

	void deleteWine(int wineNo);

	WineImage getWineNum(int wineNo);



	

	
	

}
