package com.kh.winepicker.user.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.common.Utils;
import com.kh.winepicker.model.vo.Faq;
import com.kh.winepicker.model.vo.History;
import com.kh.winepicker.model.vo.Review;
import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.model.vo.Wine;
import com.kh.winepicker.model.vo.Wish;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
@SessionAttributes({"loginUser"})
@RequiredArgsConstructor
public class UserController {

	private final BCryptPasswordEncoder encoder;
	private final UserService userService;

	private final JavaMailSender mailSender;

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

	public void sendEmail(String to, String subject, String text) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(to);
		message.setSubject(subject);
		message.setText(text);
		mailSender.send(message);
	}

	@PostMapping("/login")
	public String login(User user, Model model, RedirectAttributes ra, HttpSession session) {
		User loginUser = userService.login(user);
		String viewName = "";

		if (loginUser != null && encoder.matches(user.getUserPwd(), loginUser.getUserPwd())) {
			ra.addFlashAttribute("alertMsg", "로그인 완료, 어서오세요.");
			model.addAttribute("loginUser", loginUser);

			// 세션에 gradeNo 저장
			session.setAttribute("gradeNo", loginUser.getGradeNo());

			viewName = "redirect:/";
		} else {
			model.addAttribute("errorMsg", "로그인 실패, 다시 시도해주세요.");
			viewName = "common/errorPage";
		}

		return viewName;
	}

	
	//미사용메소드
	/*public String enrollForm() {
		return "user/register";
	}*/

	@PostMapping("/insertUser")
	public String insertUser(@RequestParam("birthDate") String birthDate, @RequestParam("ssnTail") String ssnTail,
			User user, String address, String verificationCode, RedirectAttributes ra, Model model,
			HttpSession session) {
		
		// 이메일 인증 여부 확인
		String sessionVerificationCode = (String) session.getAttribute("verificationCode");
		if (sessionVerificationCode == null || sessionVerificationCode.isEmpty()){
			model.addAttribute("errorMsg", "이메일 인증을 먼저 진행해주세요.");
			return "user/register";
		} else if(!sessionVerificationCode.equals(verificationCode)){
			model.addAttribute("errorMsg", "이메일 인증이 실패하였습니다. 다시 진행해주세요.");
			return "user/register";
		}
		
		String userSsn = birthDate + "-" + ssnTail;

		// 주민등록번호 유효성 검사
		if (!isValidSsn(userSsn)) {
			model.addAttribute("errorMsg", "유효하지 않은 주민등록번호입니다.");
			return "user/register";
		}

		// 비밀번호 암호화
		String encodedPwd = encoder.encode(user.getUserPwd());
		user.setUserPwd(encodedPwd);
		user.setAddress(address);
		user.setUserSsn(userSsn);

		session.removeAttribute("verificationCode");

		// 사용자 정보 DB에 저장
		int result = userService.insertUser(user);

		if (result > 0) {
			// 회원가입 성공 페이지로 리다이렉트 혹은 이동할 경로로 수정
			//model.addAttribute("msg", "회원가입이 완료되었습니다.");
			return "user/registerSuccess";
		} else {
			model.addAttribute("errorMsg", "회원가입 실패. 다시 시도해주세요.");
			return "user/register";
		}

	}
	
	
	//생년월일 유효성을 검사 (뒷자리는 검사하지 않음.)
	private boolean isValidSsn(String userSsn) {
		if (userSsn == null || userSsn.length() != 14) {
			return false;
		}

		// 생년월일 부분과 7자리 숫자 부분을 분리
		String birthDate = userSsn.substring(0, 6); // YYMMDD
		String ssnTail = userSsn.substring(7); // 뒷자리 7자리 숫자

		try {
			int year = Integer.parseInt(birthDate.substring(0, 2));
			int month = Integer.parseInt(birthDate.substring(2, 4));
			int day = Integer.parseInt(birthDate.substring(4, 6));

			// 생년월일 범위 체크 (실제 범위에 따라 수정 필요)
			if (year < 0 || year > 99 || month < 1 || month > 12 || day < 1 || day > 31) {
				return false;
			}
		} catch (NumberFormatException e) {
			return false;
		}

		try {
			int ssn = Integer.parseInt(ssnTail.replaceAll("-", "")); // '-' 제거하고 숫자로 변환
			if (ssn < 0) {
				return false;
			}
		} catch (NumberFormatException e) {
			return false;
		}

		return true;
	}

	@PostMapping("/sendVerificationCode")
	@ResponseBody
	public ResponseEntity<String> sendVerificationCode(@RequestParam("userEmail") String userEmail,
			HttpSession session) {
		// 임의의 인증 코드 생성 (여기서는 6자리 숫자로 생성)
		String verificationCode = String.valueOf((int) (Math.random() * 900000) + 100000);

		// 이메일로 인증 코드 전송 (여기서는 콘솔에 출력)
		System.out.println("이메일 주소: " + userEmail);
		System.out.println("인증 코드: " + verificationCode);
		sendEmail(userEmail, "WINEPICKER 회원가입 인증 코드", "인증 코드: " + verificationCode);

		// 세션에 인증 코드 저장
		session.setAttribute("verificationCode", verificationCode);

		return ResponseEntity.ok("인증 코드가 이메일로 전송되었습니다.");
	}
	
	@PostMapping("/verifyEmail")
	@ResponseBody
	public ResponseEntity<Map<String, String>> verifyEmail(
			String inputCode,
			HttpSession session) {
		
		String sessionVerificationCode = (String) session.getAttribute("verificationCode");
		
		Map<String, String> response = new HashMap<String, String>();
		
		String message = "";
		
		if (sessionVerificationCode == null || sessionVerificationCode.isEmpty()){
			message = "이메일 인증을 진행해주세요.";
			response.put("message", message);
			
		} else if(inputCode == null || inputCode.isEmpty()) {
			message = "인증코드를 입력해주세요.";
			response.put("message", message);
		
		} else if(!sessionVerificationCode.equals(inputCode)){
			message = "인증코드가 일치하지 않습니다. 확인해주세요.";
			response.put("message", message);
		
		} else if(sessionVerificationCode.equals(inputCode)) {
			message = "이메일 인증이 완료되었습니다.";
			response.put("message", message);
		
		}
			return ResponseEntity.ok(response);
	}
	
	
	// 미사용 메소드?
/*	@PostMapping("/verifyEmail")
	public String verifyEmail(@RequestParam("verificationCode") String code, HttpSession session, Model model) {
		// 세션에서 인증 코드 가져오기
		String sessionCode = (String) session.getAttribute("verificationCode");

		if (sessionCode != null && sessionCode.equals(code)) {
			// 코드가 일치하는 경우, 등록 처리 진행
			User user = (User) session.getAttribute("user");
			userService.save(user); // 사용자 정보 저장
			session.removeAttribute("verificationCode"); // 세션에서 인증 코드 제거
			session.removeAttribute("user"); // 세션에서 사용자 정보 제거
			return "redirect:/"; // 메인 페이지 또는 성공 페이지로 리다이렉트
		} else {
			// 코드가 일치하지 않는 경우, 에러 메시지와 함께 등록 페이지로 리다이렉트
			model.addAttribute("errorMsg", "인증 코드가 올바르지 않습니다. 다시 시도해주세요.");
			return "user/register"; // 등록 페이지로 리다이렉트
		}
	}
*/
	
	//회원가입시 id 중복체크
	@GetMapping("/idCheck")
	@ResponseBody
	public int idCheck(String userId) {
		int result = userService.idCheck(userId);
		return result;
	}

	//로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session, SessionStatus status, RedirectAttributes ra) {
		status.setComplete();
		session.invalidate(); // 세션 무효화
		ra.addFlashAttribute("alertMsg", "로그아웃 되었습니다.");
		return "redirect:/";
	}

	//id 찾기
	@PostMapping("/findId")
	public ResponseEntity<Map<String, Object>> findId(String userName, String userEmail) {
		
		Map<String, Object> response = new HashMap<>();
		
		try {
			List<String> foundUserIds = userService.findId(userName, userEmail);

			log.info("foundUserIds ? {}", foundUserIds);
			
			if (!foundUserIds.isEmpty()) {
				response.put("user", foundUserIds);
				
			} else {
				response.put("msg", "등록된 이메일이 없거나 사용자 이름과 이메일이 일치하는 계정이 없습니다.");
			}
		} catch (Exception e) {
			response.put("errorMsg", "아이디 찾기 과정에서 오류가 발생했습니다.");
		}
		return ResponseEntity.ok(response);
	}
	
	//pwd 찾기
	@PostMapping("/findPwd")
	@ResponseBody
	public Map<String, Object> findPassword(String userId, String userEmail) {
		Map<String, Object> resultMap = new HashMap<>();
		String foundUserId = userService.findPwd(userId, userEmail);
		if (foundUserId != null) {
			resultMap.put("success", true);
			resultMap.put("userId", foundUserId);
		} else {
			resultMap.put("success", false);
			resultMap.put("message", "입력하신 정보로 사용자를 찾을 수 없습니다.");
		}
		return resultMap;
	}

	// 비밀번호 재설정 폼 페이지 이동
	@GetMapping("/resetPwdForm")
	public String resetPasswordForm(@RequestParam("userId") String userId, Model model) {
		model.addAttribute("userId", userId);
		return "user/resetPwd"; // resetPwd.jsp로 이동
	}

	// 비밀번호 변경 로직
	@PostMapping("/resetPwd")
	public String resetPassword(String userId, String newPwd, String confirmPwd,
			RedirectAttributes ra) {
		
		if (!newPwd.equals(confirmPwd)) {
			ra.addFlashAttribute("alertMsg", "새 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
			return "redirect:/user/resetPwdForm?userId=" + userId;
		}

		// 새로운 비밀번호를 암호화
		String encodedPwd = encoder.encode(newPwd);

		// 사용자의 비밀번호를 업데이트 (1 = true, 0 = false)
		boolean passwordUpdated = userService.updatePassword(userId, encodedPwd);

		if (passwordUpdated) {
			return "redirect:/user/newPwdSuccess";
		} else {
			ra.addFlashAttribute("alertMsg", "비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
			return "redirect:/user/resetPwdForm?userId=" + userId;
		}
	}

	// 비밀번호 변경 완료 페이지
	@GetMapping("/newPwdSuccess")
	public String newPasswordSuccess() {
		return "user/newPwdSuccess"; // newPwdSuccess.jsp로 이동
	}

	@GetMapping("/myInfoChange")
	public String myInfoChange() {
		return "/user/myInfoChange";
	}

	@PostMapping("/myInfoChange")
	public String myInfoChange(User user, @RequestParam(value = "userPwd", required = false) String userPwd,
			@RequestParam(value = "verificationCode", required = false) String verificationCode, RedirectAttributes ra,
			HttpSession session, Model model) {

		User loginUser = (User) session.getAttribute("loginUser");

		// 새 비밀번호가 입력된 경우에만 변경
		if (userPwd != null && !userPwd.trim().isEmpty()) {
			String encodedPwd = encoder.encode(userPwd);
			user.setUserPwd(encodedPwd);
		} else {
			// 비밀번호 변경이 없는 경우 기존 비밀번호 유지
			user.setUserPwd(loginUser.getUserPwd());
		}

		// 이메일이 변경된 경우에만 인증 로직 처리
		if (!loginUser.getUserEmail().equals(user.getUserEmail())) {
			if (verificationCode == null || verificationCode.trim().isEmpty()) {
				model.addAttribute("errorMsg", "이메일 변경 시 인증 코드를 입력해야 합니다.");
				return "common/errorPage";
			}

			String sessionVerificationCode = (String) session.getAttribute("verificationCode");
			if (sessionVerificationCode == null || !sessionVerificationCode.equals(verificationCode)) {
				model.addAttribute("errorMsg", "이메일 인증 코드가 일치하지 않습니다.");
				return "common/errorPage";
			}
		}

		int result = userService.myInfoChange(user);
		String url;

		if (result > 0) {
			// 내정보 수정 성공
			loginUser = userService.login(user); // 변경된 정보로 로그인 정보 업데이트
			session.setAttribute("loginUser", loginUser); // 세션 업데이트
			ra.addFlashAttribute("alertMsg", "내정보 수정 성공");
			url = "redirect:/user/myPage";
		} else {
			// 내정보 수정 실패
			model.addAttribute("errorMsg", "내정보 수정 실패");
			url = "common/errorPage";
		}

		return url;
	}

	
	//---------------------------------------------------------------------------------------------------------
	
	// 마이페이지 기본화면 - 주문내역 조회 이동
		@GetMapping("/myPage")
		public String showMyPage(
				Model model,
				@ModelAttribute("loginUser") User loginUser
				) {
			
			int userNo = loginUser.getUserNo();

			List<History> pList = userService.selectMyPurchaseList(userNo);
			
			model.addAttribute("purchaseList", pList);

			log.info("purchaseList ? {}", pList);
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedToday = dateFormat.format(new Date());
			log.info("formattedToday ? {}", formattedToday);
			
			String path = "resources/images/product";
			
			model.addAttribute("path", path);
			model.addAttribute("today", formattedToday);
			
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
				
				//날짜를 설정하지 않고 검색하려고 한 경우
				if(startDate == null || endDate == null) { 
					
					model.addAttribute("alertMsg", "날짜를 입력해주세요.");
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
					
					model.addAttribute("alertMsg", "검색 시작일자가 종료일자보다 큽니다.");
					return "user/myPage";
				
					// 오늘부터 1년 전의 날짜를 검색하려고 한 경우 
				}else if(dateGap > 365) {
					model.addAttribute("alertMsg", "오늘부터 1년 이내의 주문 내역만 조회 가능합니다.");
					return "user/myPage";
				}
				
				HashMap<String, String> paramMap = dateFormatting(startDate, endDate);

				log.info("paramMap ? {}", paramMap);

				paramMap.put("userNo", String.valueOf(userNo));
				
				List<History> pList = userService.searchMyPurchaseList(paramMap);
				
				model.addAttribute("purchaseList", pList);
				model.addAttribute("paramMap", paramMap);
				
				String path = "resources/images/product";
				model.addAttribute("path", path);

				log.info("purchaseList ? {}", pList);

				return "user/myPage";
			}
			
		
		
		// 리뷰관리 페이지 이동
		@GetMapping("/myReview")
		public String selectMyPurchaseList(Model model, 
				@ModelAttribute("loginUser") User loginUser) {


			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String formattedToday = dateFormat.format(new Date());
			
			log.info("formattedToday ? {}", formattedToday);
			
			String path = "resources/images/product";
			
			model.addAttribute("path", path);
			model.addAttribute("today", formattedToday);

			int userNo = loginUser.getUserNo();

			List<History> rList = userService.selectMyPurchaseList(userNo);
			log.info("reviewList ? {}", rList);
			
			model.addAttribute("reviewList", rList);
			
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

			//날짜를 설정하지 않고 검색하려고 한 경우
			if(startDate == null || endDate == null) { 
				model.addAttribute("errorMsg", "날짜를 입력해주세요.");
				return "user/myReview";
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
				return "user/myReview";
			
				// 오늘부터 30일 전의 날짜를 검색하려고 한 경우 
			}else if(dateGap > 30) {
				model.addAttribute("errorMsg", "오늘부터 30일 이내 주문 내역만 리뷰 가능합니다.");
				return "user/myReview";
			}
			
			HashMap<String, String> paramMap = dateFormatting(startDate, endDate);

			log.info("paramMap ? {}", paramMap);
			model.addAttribute("paramMap", paramMap);
			
			paramMap.put("userNo", String.valueOf(userNo));
			
			List<History> rList = userService.searchMyPurchaseList(paramMap);
			
			model.addAttribute("reviewList", rList);

			String path = "resources/images/product";
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
			
			String path = "resources/images/product";
			model.addAttribute("path", path);
			
			return "user/review/reviewEnrollForm";
		}
		
		// 리뷰 작성한 내용 등록 하기
		@PostMapping("/review/insert/{orderNo}")
		public String insertMyReview(
				Model model,
				Review review,
				@PathVariable("orderNo") int orderNo,
				@RequestParam("reveiwContent") String content,
				@RequestParam("reveiwPoint") double point,
				RedirectAttributes ra
				) {
			
			review.setOrderNo(orderNo);
			review.setContent(Utils.XSSHandling(content));
			review.setPoint(point*0.5);
			
			int result = userService.insertMyReview(review);
			
			String url = "";
			
			if(result > 0) {
				ra.addFlashAttribute("alertMsg", "리뷰 등록이 완료되었습니다.");
				url = "redirect:/user/myReview";
			}else {
				model.addAttribute("errorMsg", "리뷰 등록이 실패하였습니다.");

				String path = "resources/images/product";
				model.addAttribute("path", path);
				
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
			
			String path = "resources/images/product";
			model.addAttribute("path", path);
			
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
			
			
			String path = "resources/images/product";
			model.addAttribute("path", path);
			log.info("item ? ", item);
			
			return "user/review/reviewUpdateForm";
		}
		
		// 리뷰 수정 등록
		@PostMapping("/review/update/{orderNo}")
		public String updateMyReview(
				Model model,
				Review review,
				@PathVariable("orderNo") int orderNo,
				@RequestParam("reveiwContent") String content,
				@RequestParam("reveiwPoint") double point,
				RedirectAttributes ra
				) {
			
			review.setOrderNo(orderNo);
			review.setContent(Utils.XSSHandling(content));
			review.setPoint(point);
			
			int result = userService.updateMyReview(review);
			
			String url = "";
			
			if(result > 0) {
				ra.addFlashAttribute("alertMsg", "리뷰 수정이 완료되었습니다.");
				url = "redirect:/user/myReview";
			}else {
				model.addAttribute("errorMsg", "리뷰 수정이 실패하였습니다.");
				String path = "resources/images/product";
				model.addAttribute("path", path);
				
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
				String path = "resources/images/product";
				model.addAttribute("path", path);
				return "user/review/detail/"+orderNo;
			}
		}
		

		// 최근 본 상품으로 이동
		@GetMapping("/myRecentProduct")
		public String showMyRecentProduct(HttpSession session, Model model) {
			
			Map<String, Object> wineList = (Map<String, Object>) session.getAttribute("wineList");
			for(String wineNo : wineList.keySet()) {
				System.out.println(wineNo);
			}
			
			model.addAttribute("searchList", wineList);
			
			return "user/myRecentProduct";
		}

		// 관심상품으로 이동
		@GetMapping("/myWishList")
		public String selectMyWishList(Model model, @ModelAttribute("loginUser") User loginUser) {
			int userNo = loginUser.getUserNo();

			List<Wine> wishList = userService.selectMyWishList(userNo);

			model.addAttribute("wishList", wishList);

			String path = "resources/images/product";
			model.addAttribute("path", path);
			
			return "user/myWishList";
		}
		
			

		// 관심상품에서 삭제
		@GetMapping("/delete/myWishItem")
		@ResponseBody
		public String deleteWishItem(Model model, @ModelAttribute("loginUser") User loginUser,
				@RequestParam("no") int wineNo) {

			int userNo = loginUser.getUserNo();

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
		
		//faq 답변 불러오기
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
		
		// 회원탈퇴 화면 이동
		@GetMapping("/exitUser")
		public String showExitUserView() {
			return "user/exitUser";
		}
		
		// 회원탈퇴 제출 -> 비밀번호 비교까지 수행
		@PostMapping("/exitUser")
		public String exitUser(
				User user,
				@ModelAttribute("loginUser") User loginUser,
				Model model
				) {
			
			String url = "user/exitUser";
			
			//비밀번호 입력하지 않았을 경우
			if(user.getUserPwd().isEmpty()) {
				model.addAttribute("errorMsg", "비밀번호를 입력해주세요.");
				return url;
			}
			
			log.info("user ? {}", user);
			log.info("loginUser ? {}", loginUser);
			
			//입력한 비밀번호와 로그인 유저의 비밀번호 비교
			if(encoder.matches(user.getUserPwd(), userService.login(loginUser).getUserPwd())){
				//성공시
				String confirm = "confirm";
				model.addAttribute("confirmExit", confirm);
				return url;
			}else {
				//실패시
				model.addAttribute("errorMsg", "비밀번호가 일치하지 않습니다.");
				return url;
			}
		}
		
		//회원탈퇴 작업
		@GetMapping("/delete")
		public String updateUserStatus(
				@ModelAttribute("loginUser") User loginUser,
				Model model,
				SessionStatus status,
				RedirectAttributes ra
				) {
			int userNo = loginUser.getUserNo();
			
			int result = userService.updateUserStatus(userNo);
			
			if(result > 0) {
				ra.addFlashAttribute("alertMsg", "탈퇴 성공하였습니다. 그동안 이용해주셔서 감사합니다.");
				status.setComplete();
				return "redirect:/";
			} else {
				model.addAttribute("errorMsg", "회원 탈퇴에 실패하였습니다.");
				return "user/exitUser";
			}
			
		}

		// SimpleDateFormat을 사용하여 포맷팅 (시작일자, 종료일자) 입력
		private HashMap<String, String> dateFormatting(Date date1, Date date2) {
			
			Date startDate = new Date();
			Date endDate = new Date();

			if(date1.getTime() <= date2.getTime()) {
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
		
		

// ====================== 민욱 =========================
		
		// 사용자 제거
	    @DeleteMapping("/removeUser/{userId}")
	    public String removeUser(@PathVariable String userId, Model model) {
	        int result = userService.removeUser(userId);
	        if (result > 0) {
	            model.addAttribute("alertMsg", "사용자 삭제 성공");
	        } else {
	            model.addAttribute("alertMsg", "사용자 삭제 실패...");
	        }
	        return "redirect:/user/userList";
	    }
	    
		
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    

	

}