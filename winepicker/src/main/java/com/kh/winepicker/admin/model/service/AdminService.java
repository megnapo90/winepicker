package com.kh.winepicker.admin.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineType;

public interface AdminService {

	List<Country> countryList();

	List<Grape> grapeList();


	int insertInfo(Info i);


	List<WineType> selectTypeList();

	List<Info2> selectInfoList();

	Info2 selectInfo(String infoName);

	int updateInfo(Info2 i);

	
	
	
	int noticeEnroll(Notice n);
	
	List<Notice> noticeList();

	Notice noticeDetail(int noticeNo);

	int deleteNotice(Notice n);

	List<WineExt> selectWineList();

	int updateWine(WineExt wine);

	WineExt selectWine(int wineNo);

	List<Grape> grapeList2(int wineTypeNo);

	int insertWine2(WineExt wineExt);




}
