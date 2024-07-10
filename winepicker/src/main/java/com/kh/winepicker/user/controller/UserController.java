package com.kh.winepicker.user.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;


import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.Wish;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;

@Slf4j
@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser"})
@RequiredArgsConstructor
public class UserController {

	private final BCryptPasswordEncoder encoder;
	private final UserService userService;

	private final JavaMailSender mailSender;


	@GetMapping("/userList")
	public String selectUserList(Model model) {
		List<User> uList = userService.selectUserList();
		model.addAttribute("uList", uList);

		return "";
	}

	@GetMapping("/loginPage")
	public String loginPage() {
		return "user/login";
	}

	@GetMapping("/register")
	public String register() {
		return "user/register";
	}

	@GetMapping("/findId")
	public String findId() {
		return "user/findId";
	}

	@GetMapping("/findPwd")
	public String findPwd() {
		return "user/findPwd";
	}

	@GetMapping("/newPwd")
	public String newPwd() {
		return "user/newPwd";
	}

	// 마이페이지 기본화면 - 주문내역 조회 이동
	@GetMapping("/myPage")
	public String showMyPage(
			Model model,
			@ModelAttribute("loginUser") User loginUser
			) {
		
		int userNo = loginUser.getUserNo();
		//userNo = 1; // 이후 지워야 함.

		List<History> pList = userService.selectMyPurchaseList(userNo);

		model.addAttribute("purchaseList", pList);

		log.info("purchaseList ? {}", pList);

		String path = "resource/images/wine";
		model.addAttribute("path", path);
		
		return "user/myPage";
	}
	
	// 마이페이지 기본화면 - 날짜 필터 조회
		@PostMapping("/myPage")
		public String searchMyPurchaseList(
				Model model, 
				@ModelAttribute("loginUser") User loginUser,
				@RequestParam("startDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate, 
				@RequestParam("endDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
				RedirectAttributes ra) {
			
			int userNo = loginUser.getUserNo();
			//userNo = 1;
			//날짜를 설정하지 않고 검색하려고 한 경우
			if(startDate == null || endDate == null) { 
				
				model.addAttribute("errorMsg", "날짜를 입력해주세요.");
				return "user/myPage";
			}
			
			log.info("startDate ? {}", startDate);
			log.info("endDate ? {}", endDate);
			
			Calendar now = Calendar.getInstance();
			
			long gap = now.getTimeInMillis() - startDate.getTime();
			int dateGap =  (int) (gap / (1000 * 60 * 60 * 24));
			
			log.info("dateGap ? {}", gap);
			log.info("dateGapInDay ? {}", dateGap);
			
			// 검색 시작일자를 종료일자보다 크게 설정한 경우
			if(startDate.getTime() > endDate.getTime()) {
				
				model.addAttribute("errorMsg", "검색 시작일자가 종료일자보다 큽니다.");
				return "user/myPage";
			
				// 오늘부터 1년 전의 날짜를 검색하려고 한 경우 
			}else if(dateGap > 365) {
				model.addAttribute("errorMsg", "오늘부터 1년 이내의 주문 내역만 조회 가능합니다.");
				return "user/myPage";
			}
			
			HashMap<String, String> paramMap = dateFormatting(startDate, endDate);

			log.info("paramMap ? {}", paramMap);

			paramMap.put("userNo", String.valueOf(userNo));
			
			List<History> pList = userService.searchMyPurchaseList(paramMap);
			model.addAttribute("purchaseList", pList);

			String path = "resource/images/wine";
			model.addAttribute("path", path);

			log.info("purchaseList ? {}", pList);

			return "user/myPage";
		}
		
	
	
	// 리뷰관리 페이지 이동
	@GetMapping("/myReview")
	public String selectMyPurchaseList(Model model, 
			@ModelAttribute("loginUser") User loginUser) {

		int userNo = loginUser.getUserNo();
		//userNo = 1; // 이후 지워야 함.

		List<History> rList = userService.selectMyPurchaseList(userNo);

		model.addAttribute("reviewList", rList);

		log.info("reviewList ? {}", rList);

		String path = "resource/images/wine";
		model.addAttribute("path", path);

		return "user/myReview";
	}

	// 리뷰관리 페이지 상에서 날짜 필터 검색
	@PostMapping("/searchMyReview")
	public String searchMyReview(
			Model model, 
			@ModelAttribute("loginUser") User loginUser,
			@RequestParam("startDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date startDate, 
			@RequestParam("endDate") @DateTimeFormat(pattern="yyyy-MM-dd") Date endDate,
			RedirectAttributes ra) {
		
		int userNo = loginUser.getUserNo();
		//userNo = 1;	//지워야 함.

		//날짜를 설정하지 않고 검색하려고 한 경우
		if(startDate == null || endDate == null) { 
			
			model.addAttribute("errorMsg", "날짜를 입력해주세요.");
			return "user/myReview";
		}
		
		log.info("startDate ? {}", startDate);
		log.info("endDate ? {}", endDate);
		
		System.out.println();
		
		Calendar now = Calendar.getInstance();
		
		long gap = now.getTimeInMillis() - startDate.getTime();
		int dateGap =  (int) (gap / (1000 * 60 * 60 * 24));
		
		log.info("dateGap ? {}", gap);
		log.info("dateGapInDay ? {}", dateGap);
		
		// 검색 시작일자를 종료일자보다 크게 설정한 경우
		if(startDate.getTime() > endDate.getTime()) {
			
			model.addAttribute("errorMsg", "검색 시작일자가 종료일자보다 큽니다.");
			return "user/myReview";
		
			// 오늘부터 30일 전의 날짜를 검색하려고 한 경우 
		}else if(dateGap > 30) {
			model.addAttribute("errorMsg", "오늘부터 30일 이내 주문 내역만 리뷰 가능합니다.");
			return "user/myReview";
		}
		
		HashMap<String, String> paramMap = dateFormatting(startDate, endDate);

		log.info("paramMap ? {}", paramMap);

		paramMap.put("userNo", String.valueOf(userNo));
		
		List<History> rList = userService.searchMyPurchaseList(paramMap);
		model.addAttribute("reviewList", rList);

		String path = "resource/images/wine";
		model.addAttribute("path", path);

		log.info("reviewList ? {}", rList);

		return "user/myReview";
	}
	
	// 리뷰 작성 페이지로 이동
	@GetMapping("/review/enroll/{orderNo}")
	public String enrollReviewForm(
			Model model,
			@PathVariable("orderNo") int orderNo
			) {

		History item = userService.selectReviewItem(orderNo);
		
		model.addAttribute("review", item);
		
		log.info("item ? ", item);
		
		return "user/review/reviewEnrollForm";
	}
	
	// 리뷰 작성한 내용 등록 하기
	@PostMapping("/review/insert/{orderNo}")
	public String insertMyReview(
			Model model,
			@PathVariable("orderNo") int orderNo,
			@RequestParam("reveiwContent") String content,
			@RequestParam("reveiwPoint") int point,
			RedirectAttributes ra
			) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("orderNo", orderNo);
		paramMap.put("content", content);
		paramMap.put("point",point);
		
		int result = userService.insertMyReview(paramMap);
		
		String url = "";
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "리뷰 등록이 완료되었습니다.");
			url = "redirect:/user/myReview";
		}else {
			model.addAttribute("errorMsg", "리뷰 등록이 실패하였습니다.");
			url = "user/review/enrollForm";
		}
		return url;
	}
	
	// 리뷰 작성한 내용 조회 하기
	@GetMapping("/review/detail/{orderNo}")
	public String selectReviewOne(
			@PathVariable("orderNo") int orderNo,
			Model model
			) {
		
		History item = userService.selectReviewItem(orderNo);
		Review review = userService.selectReviewOne(orderNo);
		
		if(review == null) {
			model.addAttribute("errorMsg", "등록된 리뷰가 없습니다.");
			return "user/review/reviewDetailView";
		}
		
		model.addAttribute("item", item);
		model.addAttribute("review", review);
		
		
		return "user/review/reviewDetailView";
	}
	
	// 리뷰 수정 페이지로 이동
	@GetMapping("/review/update/{orderNo}")
	public String updateReviewForm(
			Model model,
			@PathVariable("orderNo") int orderNo
			) {

		History item = userService.selectReviewItem(orderNo);
		Review review = userService.selectReviewOne(orderNo);
		
		model.addAttribute("item", item);
		model.addAttribute("review", review);
		
		log.info("item ? ", item);
		
		return "user/review/reviewUpdateForm";
	}
	
	// 리뷰 수정 등록
	@PostMapping("/review/update/{orderNo}")
	public String updateMyReview(
			Model model,
			@PathVariable("orderNo") int orderNo,
			@RequestParam("reveiwContent") String content,
			@RequestParam("reveiwPoint") int point,
			RedirectAttributes ra
			) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("orderNo", orderNo);
		paramMap.put("content", content);
		paramMap.put("point",point);
		
		int result = userService.updateMyReview(paramMap);
		
		String url = "";
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "리뷰 수정이 완료되었습니다.");
			url = "redirect:/user/myReview";
		}else {
			model.addAttribute("errorMsg", "리뷰 수정이 실패하였습니다.");
			url = "user/review/reviewUpdateForm";
		}
		return url;
	}
	
	//등록된 리뷰 삭제
	@GetMapping("/review/delete/{orderNo}")
	public String deleteMyReview(
			@PathVariable("orderNo") int orderNo,
			Model model,
			RedirectAttributes ra
			) {
		int result = userService.deleteMyReview(orderNo);
		
		if(result > 0) {
			ra.addFlashAttribute("alertMsg", "삭제 성공하였습니다.");
			return "redirect:/user/myReview";
		} else {
			model.addAttribute("errorMsg", "삭제 실패하였습니다.");
			return "user/review/detail/"+orderNo;
		}
	}
	
	
	

	// 최근 본 상품으로 이동
	@GetMapping("/myRecentProduct")
	public String showMyRecentProduct() {
		return "user/myRecentProduct";
	}

	// 관심상품으로 이동
	@GetMapping("/myWishList")
	public String selectMyWishList(Model model, @ModelAttribute("loginUser") User loginUser) {
		int userNo = loginUser.getUserNo();
		userNo = 1; // 이후 지워야 함.

		List<Wine> wishList = userService.selectMyWishList(userNo);
		String path = "resource/images/wine";

		model.addAttribute("wishList", wishList);
		model.addAttribute("path", path);

		return "user/myWishList";
	}

	// 관심상품에서 삭제
	@GetMapping("/delete/myWishItem")
	@ResponseBody
	public String deleteWishItem(Model model, @ModelAttribute("loginUser") User loginUser,
			@RequestParam("no") int wineNo) {

		int userNo = loginUser.getUserNo();
		userNo = 1; // 이후 지워야 함.

		Wish wishItem = new Wish();

		wishItem.setUserNo(userNo);
		wishItem.setWineNo(wineNo);

		int result = userService.deleteWishItem(wishItem);

		if (result > 0) {
			return "";
		} else {
			model.addAttribute("errorMsg", "삭제 실패하였습니다.");
			return "";
		}
	}

	// mypage 메뉴 중 고객센터로 이동
	@GetMapping("/callCenter")
	public String selectFaqList(Model model) {

		List<Faq> faqList = userService.selectFaqList();

		model.addAttribute("faqList", faqList);

		log.info("faqList ? {}", faqList);

		return "user/callCenter";
	}

	@ResponseBody
	@GetMapping("/faqDetail/{faqNo}")
	public Faq showFaqContent(@PathVariable("faqNo") int faqNo, Model model) {

		Faq faq = userService.selectFaq(faqNo);

		model.addAttribute("faq", faq);

		log.info("faq ? {}", faq);

		return faq;
	}
  
	// mypage 메뉴 중 공지사항으로 이동
	@GetMapping("/userNotice")
	public String userNotice() {
		return "user/userNotice";
	}

	// SimpleDateFormat을 사용하여 포맷팅 (시작일자, 종료일자) 입력
	private HashMap<String, String> dateFormatting(Date date1, Date date2) {
			
		Date startDate = new Date();
		Date endDate = new Date();
		
		if(date1.getTime() < date2.getTime()) {
			startDate = date1;
			endDate = date2;
		}else {
			startDate = date2;
			endDate = date1;
		}
		
		SimpleDateFormat formatterS = new SimpleDateFormat("yyyy-MM-dd 00:00:00");
		Timestamp timestampStart = new Timestamp(startDate.getTime());
		String formattedStartDate = formatterS.format(timestampStart);
			SimpleDateFormat formatterE = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
		Timestamp timestampEnd = new Timestamp(endDate.getTime());
		String formattedEndDate = formatterE.format(timestampEnd);
		HashMap<String, String> paramMap = new HashMap<String, String>();
		
		paramMap.put("startDate", formattedStartDate);
		paramMap.put("endDate", formattedEndDate);

			return paramMap;
	}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//---------------------------------------------------------------------------------------------------//
	 

	@PostMapping("/login")
	public String login(User user, Model model, RedirectAttributes ra, HttpSession session) {
		User loginUser = userService.login(user);
		String viewName = "";

		if (loginUser != null && encoder.matches(user.getUserPwd(), loginUser.getUserPwd())) {
			ra.addFlashAttribute("alertMsg", "로그인 완료, 어서오세요.");
			model.addAttribute("loginUser", loginUser);
			viewName = "redirect:/";
		} else {
			model.addAttribute("errorMsg", "로그인 실패, 다시 시도해주세요.");
			viewName = "common/errorPage";
		}

		return viewName;
	}

	@GetMapping("/insertUser")
	public String enrollForm() {
		return "user/register";
	}

	@PostMapping("/insertUser")
	public String insertUser(User user, String address, String verificationCode, RedirectAttributes ra, Model model,
			HttpSession session) {
		// 이메일 인증 여부 확인
		String sessionVerificationCode = (String) session.getAttribute("verificationCode");
		if (sessionVerificationCode == null || !sessionVerificationCode.equals(verificationCode)) {
			model.addAttribute("errorMsg", "이메일 인증을 먼저 진행해주세요.");
			return "user/register";
		}

		// 비밀번호 암호화
		String encodedPwd = encoder.encode(user.getUserPwd());
		user.setUserPwd(encodedPwd);
		user.setAddress(address);

		// 사용자 정보 DB에 저장
		int result = userService.insertUser(user);

		if (result > 0) {
			// 회원가입 성공 페이지로 리다이렉트 혹은 이동할 경로로 수정
			model.addAttribute("msg", "회원가입이 완료되었습니다.");
			return "user/registerSuccess";
		} else {
			model.addAttribute("msg", "회원가입 실패. 다시 시도해주세요.");
			return "user/register";
		}
	}

	public String generateVerificationCode() {
		Random random = new Random();
		int code = 100000 + random.nextInt(900000); // 6자리 인증 코드 생성
		return String.valueOf(code);
	}

	public void sendVerificationEmail(String userEmail, String code) throws MessagingException {
		if (userEmail == null || userEmail.isEmpty()) {
			throw new IllegalArgumentException("To address must not be null or empty");
		}
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
		helper.setTo(userEmail);
		helper.setSubject("회원가입 이메일 인증 코드");
		helper.setText("인증 코드는 " + code + " 입니다.", true);
		mailSender.send(message);
	}

	@PostMapping("/sendVerificationEmail")
	public String sendVerificationEmail(@RequestParam("userEmail") String userEmail, HttpSession session) {
		String code = generateVerificationCode();

		try {
			sendVerificationEmail(userEmail, code);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "errorPage";
		}
		session.setAttribute("verificationCode", code);
		return "redirect:/user/verifyEmail";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(User user, HttpSession session) {
		String code = generateVerificationCode();
		try {
			sendVerificationEmail(user.getUserEmail(), code);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "errorPage";
		}
		session.setAttribute("verificationCode", code);
		session.setAttribute("user", user); // 사용자 정보를 세션에 저장
		return "redirect:/user/verifyEmail"; // 이메일 인증 페이지로 리디렉션
	}

	@GetMapping("/verifyEmail")
	public String verifyEmailPage() {
		return "user/verifyEmail"; // verifyEmail.jsp 혹은 verifyEmail.html 등 페이지의 실제 경로로 수정해야 함
	}

	@PostMapping("/verifyEmail")
	public String verifyEmail(@RequestParam("verificationCode") String code, HttpSession session, Model model) {
		String sessionCode = (String) session.getAttribute("verificationCode");

		if (sessionCode != null && sessionCode.equals(code)) {
			// Code matches, continue with registration
			User user = (User) session.getAttribute("user");
			userService.save(user); // Save user to database
			session.removeAttribute("verificationCode"); // Remove verification code from session
			session.removeAttribute("user"); // Remove user from session
			return "redirect:/"; // Redirect to main page or success page
		} else {
			model.addAttribute("errorMsg", "Verification code is incorrect. Please try again.");
			return "user/register"; // Redirect to registration page
		}
	}

	@GetMapping("/idCheck")
	@ResponseBody
	public int idCheck(String userId) {
		int result = userService.idCheck(userId);
		return result;
	}

	@PostMapping("/selectOne")
	public ResponseEntity<Map<String, Object>> selectOne(User user) {
		if (true) {
			throw new RuntimeException();
		}

		User loginUser = userService.login(user);

		HashMap<String, Object> userInfo = new HashMap<>();

		ResponseEntity<Map<String, Object>> res = null;

		if (loginUser == null) {
			res = ResponseEntity.notFound().build();
		} else {
			userInfo.put("userId", loginUser.getUserId());
			userInfo.put("userName", loginUser.getUserName());

			res = ResponseEntity.ok().header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE).body(userInfo);
		}

		return res;
	}

	@GetMapping("/logout")
	public String logout(HttpSession session, SessionStatus status) {
		status.setComplete();
		return "redirect:/";
	}

	@PostMapping("/findId")
	public ResponseEntity<Map<String, String>> findId(String userName, String userEmail) {

		Map<String, String> response = new HashMap<>();
		try {
			String foundUserId = userService.findId(userName, userEmail);

			if (foundUserId != null) {
				response.put("user", foundUserId);
			} else {
				response.put("msg", "등록된 이메일이 없습니다. 이메일을 확인해주세요.");
			}
		} catch (Exception e) {
			response.put("errorMsg", "아이디 찾기 과정에서 오류가 발생했습니다.");
		}
		return ResponseEntity.ok(response);
	}

	@PostMapping("/findPwd")
	public ResponseEntity<Map<String, String>> findPwd(String userId, String userEmail) {
		Map<String, String> response = new HashMap<>();
		try {
			String foundUserPwd = userService.findPwd(userId, userEmail);

			if (foundUserPwd != null) {
				response.put("user", foundUserPwd);
			} else {
				response.put("msg", "등록된 이메일이 없습니다. 이메일을 확인해주세요.");
			}
		} catch (Exception e) {
			response.put("errorMsg", "아이디 찾기 과정에서 오류가 발생했습니다.");
		}
		return ResponseEntity.ok(response);
	}

}
