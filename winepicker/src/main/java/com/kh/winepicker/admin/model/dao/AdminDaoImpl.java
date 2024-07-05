package com.kh.winepicker.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineType;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AdminDaoImpl implements AdminDao{
	
	private final SqlSession sqlSession;

	@Override
	public List<Country> countryList() {
		return sqlSession.selectList("admin.selectCountry");
	}

	@Override
	public List<Grape> grapeList() {
		return sqlSession.selectList("admin.selectGrape");
	}

	@Override
	public int noticeEnroll(Notice n) {
		return sqlSession.insert("admin.noticeEnroll", n);
	}

	@Override
	public int insertInfo(Info i) {
		return sqlSession.insert("admin.insertInfo", i);
	}


	@Override
	public List<WineType> selectTypeList() {
		return sqlSession.selectList("admin.selectTypeList");
	}

	@Override
	public List<Info2> selectInfoList(Info2 info) {
		return sqlSession.selectList("admin.selectInfoList",info);
	}

	@Override
	public Info2 selectInfo(String infoName) {
		return sqlSession.selectOne("admin.selectInfo", infoName);
	}

	@Override
	public int updateInfo(Info2 i) {
		return sqlSession.update("admin.updateInfo", i);
	}

	@Override
	public List<Notice> noticeList() {
		return sqlSession.selectList("admin.noticeList");
	}

	@Override
	public Notice noticeDetail(int noticeNo) {
		return sqlSession.selectOne("admin.noticeDetail", noticeNo);
	}

	@Override
	public int deleteNotice(Notice n) {
		return sqlSession.update("admin.deleteNotice", n);
	}

	@Override
	public List<WineExt> selectWineList() {
		return sqlSession.selectList("admin.selectWineList");
	}

	@Override
	public int updateWine(WineExt wine) {
		return sqlSession.update("admin.updateWine", wine);
	}

	@Override
	public WineExt selectWine(int wineNo) {
		return sqlSession.selectOne("admin.selectWine", wineNo);
	}



}
