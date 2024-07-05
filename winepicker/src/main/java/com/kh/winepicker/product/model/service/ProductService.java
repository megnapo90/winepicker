package com.kh.winepicker.product.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineImage;

public interface ProductService {

	int insertWine(Wine wine, WineImage wineImage, Characteristic characteristic) throws Exception;

	Wine selectWine(int wineNo);

	void deleteWine(int wineNo);

	WineImage getWineNum(int wineNo);


	




}
