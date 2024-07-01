package com.kh.winepicker.admin.model.service;

import java.util.List;

import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Notice;

public interface AdminService {

	List<Country> countryList();

	List<Grape> grapeList();

	int insertNotice(Notice n);

}
