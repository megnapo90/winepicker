package com.kh.winepicker.admin.model.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Service;

import com.kh.winepicker.admin.model.dao.AdminDao;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Notice;

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
	public int insertNotice(Notice n) {
		return adminDao.insertNotice(n);
	}
	
	
	
}
