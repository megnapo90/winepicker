package com.kh.winepicker.admin.model.service;

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
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.WineExt;
import com.kh.winepicker.model.vo.WineType;

public interface AdminService {

	List<Country> countryList();

	List<Grape> grapeList();


	


	List<WineType> selectTypeList();

	List<Info2> selectInfoList();

	Info2 selectInfo(String infoName);
	
	
	int insertInfo(Info i);

	int updateInfo(Info2 i);

	
	
	
	int noticeEnroll(Notice n);
	
	

	Notice noticeDetail(int noticeNo);

	int deleteNotice(Notice n);

	List<WineExt> selectWineList();

	int updateWine(WineExt wine);

	WineExt selectWine(int wineNo);

	List<Grape> grapeList2(int wineTypeNo);

	int insertWine2(WineExt wineExt);

	
	
	
	int noticeListCount(Map<String, Object> param);

	List<Notice> noticeList(PageInfo pi, Map<String, Object> param);
	
	
	
// ============================= 민욱 시작 ==========================================	
	// FAQ 관련 메서드
    List<Faq> getAllFaqs();
    List<Faq> searchFaqs(String keyword);
    Faq getFaq(int faqNo);
    int updateFaq(Faq faq);
    int deleteFaq(List<Integer> selectedFaqs);
    int addFaq(Faq faq);

    // 문의 관련 메서드
    List<Ask> getAllAsk();
    List<Ask> searchAsks(String keyword);
    int deleteAsk(List<Integer> selectedAsks);
    int modifyAsk(Ask ask);
    int addAsk(Ask ask);
    public Ask getAskByNo(int askNo);
    public int updateAsk(Ask ask);

    // 리뷰 관련 메서드
    List<Review> getAllReviews();
    
    List<Review> searchReviews(String keyword);

    int addReview(Review review);

    int deleteReview(List<Integer> selectedReviews);

    Review getReviewByNo(int reviewNo);

    int updateReviewReply(int reviewNo, String replyContent);
// ============================= 민욱 끝 ==========================================	
	
	
	
	
	


}
