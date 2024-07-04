package com.kh.winepicker.ask.model.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.winepicker.model.vo.Ask;

public interface AskDao {

	int insertAsk(Ask ask);

	List<Ask> showAskList(int loginUserNo);

	Ask selectAskDetail(int askNo);

	int deleteAskDetail(int askNo);

	int updateAskDetail(Ask ask);

	int updateAskDetailExceptImg(Ask ask);

}
