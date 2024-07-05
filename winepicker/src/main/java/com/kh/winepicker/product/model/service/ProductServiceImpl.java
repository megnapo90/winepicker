package com.kh.winepicker.product.model.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.Characteristic;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineImage;
import com.kh.winepicker.product.model.dao.ProductDao;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {

	private final ProductDao productDao;
	private final ServletContext application;

	@Override
	@Transactional(rollbackFor = { Exception.class })
	public int insertWine(Wine wine, WineImage wi, Characteristic taste) throws Exception {
		String wineName = wine.getWineName();
		String content = wine.getContent();

		wineName = Utils.XSSHandling(wineName);
		content = Utils.XSSHandling(content);
		content = Utils.newLineHandling(content);

		wine.setWineName(wineName);
		wine.setContent(content);

		int result = productDao.insertWine(wine);

		int wineNo = wine.getWineNo();

		wi.setWineNo(wineNo);
		taste.setWineNo(wineNo);

		if (wi != null) {
			result *= productDao.insertWineImg(wi);
		}

		if (taste != null) {
			result *= productDao.insertWinetaste(taste);
		}

		if (result == 0) {
			throw new Exception("예외 발생");
		}

		return result;

	}

	@Override
	public Wine selectWine(int wineNo) {
		return productDao.selectWine(wineNo);
	}

	@Override
	@Transactional(rollbackFor = { Exception.class })
	public void deleteWine(int wineNo) {

//		WineExt wine = (WineExt)productDao.selectWine(wineNo);
//		
//		WineImage wi= wine.getAttachment();
//
//		String saveDir = application.getRealPath("/resources/images/product/");
//		
//		File file = new File(saveDir, wi.getChangeName());
//		
//		
//		if(file.exists()) {
//			productDao.deleteWine(wineNo);
//			file.delete();		
//			
//		}else {
//			return "product/productUpdateForm";
//		}

		try {
			// 1. wineNo로 Wine 객체를 조회합니다.
			WineExt wine = (WineExt) productDao.selectWine(wineNo);
			if (wine == null) {
				throw new RuntimeException("Wine with id " + wineNo + " not found.");
			}

			// 2. WineImage 객체를 가져옵니다.
			WineImage wi = wine.getAttachment();
			if (wi == null) {
				throw new RuntimeException("No image attachment for wine with id " + wineNo);
			}

			// 3. 이미지 파일 경로를 얻습니다.
			String saveDir = application.getRealPath("/resources/images/product/");
			File file = new File(saveDir, wi.getChangeName());

			// 4. 파일이 존재하면 삭제합니다.
			if (file.exists()) {
				boolean isDeleted = file.delete();
				if (!isDeleted) {
					throw new RuntimeException("Failed to delete the image file.");
				}
			} else {
				throw new RuntimeException("Image file does not exist.");
			}

			// 5. 데이터베이스에서 와인 정보를 삭제합니다.
			productDao.deleteWine(wineNo);
		} catch (Exception e) {
			// Exception 발생 시 트랜잭션이 롤백됩니다.
			throw e; // RuntimeException을 발생시켜 트랜잭션을 롤백합니다.
		}

	}

	@Override
	public WineImage getWineNum(int wineNo) {
		return productDao.getWineNum(wineNo);
	}

}
