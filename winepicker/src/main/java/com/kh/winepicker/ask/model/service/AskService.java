package com.kh.winepicker.ask.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.winepicker.model.vo.Ask;

public interface AskService {

	int insertAsk(Ask ask, MultipartFile upfile);

	List<Ask> showAskList(int loginUserNo);

	Ask selectAskDetail(int askNo);

	int deleteAskDetail(int askNo);

	int updateAskDetail(Ask ask, MultipartFile upfile, String deleteImageName);

}
