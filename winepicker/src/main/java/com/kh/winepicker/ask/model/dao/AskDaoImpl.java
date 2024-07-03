package com.kh.winepicker.ask.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.winepicker.model.vo.Ask;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class AskDaoImpl implements AskDao {
	
	private final SqlSession session;

	@Override
	public int insertAsk(Ask ask) {
		return session.insert("ask.insertAsk", ask);
	}

	@Override
	public List<Ask> showAskList(int loginUserNo) {
		
		return session.selectList("ask.showAskList", loginUserNo);
		
	}
}
