package com.kh.winepicker.admin.model.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.winepicker.admin.model.dao.AdminDao;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineType;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	private final AdminDao adminDao;
	private final ServletContext application;
	
	
	@Override
	public List<Country> countryList() {
		return adminDao.countryList();
	}
	@Override
	public List<Grape> grapeList() {
		return adminDao.grapeList();
	}
	@Override
	public int noticeEnroll(Notice n) {
		return adminDao.noticeEnroll(n);
	}
	@Override
	public int insertInfo(Info i) {
		return adminDao.insertInfo(i);
	}
	@Override
	public List<WineType> selectTypeList() {
		return adminDao.selectTypeList();
	}
	@Override
	public List<Info2> selectInfoList() {
		return adminDao.selectInfoList();
	}
	@Override
	public Info2 selectInfo(String infoName) {
		return adminDao.selectInfo(infoName);
	}
	@Override
	public int updateInfo(Info2 i) {
		return adminDao.updateInfo(i);
	}
	@Override
	public List<Notice> noticeList() {
		return adminDao.noticeList();
	}
	@Override
	public Notice noticeDetail(int noticeNo) {
		return adminDao.noticeDetail(noticeNo);
	}
	@Override
	public int deleteNotice(Notice n) {
		return adminDao.deleteNotice(n);
	}
	@Override
	public List<WineExt> selectWineList() {
		return adminDao.selectWineList();
	}
	@Override
	public int updateWine(WineExt wine) {
		return adminDao.updateWine(wine);
	}
	@Override
	public WineExt selectWine(int wineNo) {
		return adminDao.selectWine(wineNo);
	}
	@Override
	public List<Grape> grapeList2(int wineTypeNo) {
		return adminDao.grapeList2(wineTypeNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertWine2(WineExt wineExt) {
		int result = 1; 
		result *= adminDao.insertWine2(wineExt);
		result *= adminDao.insertCharacteristic(wineExt);
		result *= adminDao.insertWineImage(wineExt);
		
		if(result == 0) {
			throw new RuntimeException();
		}
		return result;
	}
	
	
	
}
