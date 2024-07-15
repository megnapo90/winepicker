package com.kh.winepicker.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.winepicker.common.model.vo.PageInfo;
import com.kh.winepicker.model.vo.Ask;
import com.kh.winepicker.model.vo.Country;
import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.Grape;
import com.kh.winepicker.model.vo.Info;
import com.kh.winepicker.model.vo.Info2;
import com.kh.winepicker.model.vo.Notice;
import com.kh.winepicker.model.vo.Popup;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineType;

public interface AdminDao {

	List<Country> countryList();

	List<Grape> grapeList();


	int insertInfo(Info i);


	List<WineType> selectTypeList();

	List<Info2> selectInfoList();

	Info2 selectInfo(String infoName);

	int updateInfo(Info2 i);

	
	
	
	int noticeEnroll(Notice n);
	
	

	Notice noticeDetail(int noticeNo);

	int deleteNotice(Notice n);

	List<WineExt> selectWineList();


	WineExt selectWine(int wineNo);

	List<Grape> grapeList2(int wineTypeNo);

	int insertWine2(WineExt wineExt);

	int insertCharacteristic(WineExt wineExt);

	int insertWineImage(WineExt wineExt);

	
	
	int updateWine(WineExt wine);
	
	int updateCharacteristic(WineExt wine);

	int updateWineImage(WineExt wine);

	
	
	
	List<Notice> noticeList(PageInfo pi, Map<String, Object> param);
	
	int noticeListCount(Map<String, Object> param);
	
	
// ============================= 민욱 시작 ==========================================	
	// FAQ 관련 메서드
    List<Faq> selectAllFaqs();
    List<Faq> searchFaqs(String keyword);
    Faq selectFaq(int faqNo);
    int updateFaq(Faq faq);
    int deleteFaq(List<Integer> selectedFaqs);
    int insertFaq(Faq faq);

    // 문의 관련 메서드
    List<Ask> selectAllAsk();
    List<Ask> searchAsks(String keyword);
    int deleteAsk(List<Integer> selectedAsks);
    int insertAsk(Ask ask);
    Ask selectAskByNo(int askNo);
    int updateAsk(Ask ask);

    // 리뷰 관련 메서드
    List<Review> selectAllReviews();
    List<Review> searchReviews(String keyword);
    int insertReview(Review review);
    int deleteReview(List<Integer> selectedReviews);
    Review getReviewByNo(int reviewNo);
    int updateReviewReply(int reviewNo, String replyContent);
// ============================= 민욱 끝 ==========================================	

	List<Popup> popupList();

	int popupEnroll(Popup p);
	
	
	
	
	
	
	



}
