package com.kh.winepicker.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Notice;

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
	public int insertNotice(Notice n) {
		return sqlSession.insert("admin.insertNotice", n);
	}

}
