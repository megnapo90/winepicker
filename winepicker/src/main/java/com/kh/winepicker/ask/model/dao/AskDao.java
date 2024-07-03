package com.kh.winepicker.ask.model.dao;

import java.util.List;

import com.kh.winepicker.model.vo.Ask;

public interface AskDao {

	int insertAsk(Ask ask);

	List<Ask> showAskList(int loginUserNo);

}
