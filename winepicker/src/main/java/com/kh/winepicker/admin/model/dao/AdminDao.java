package com.kh.winepicker.admin.model.dao;

import java.util.List;

import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Notice;

public interface AdminDao {

	List<Country> countryList();

	List<Grape> grapeList();

	int insertNotice(Notice n);

}
