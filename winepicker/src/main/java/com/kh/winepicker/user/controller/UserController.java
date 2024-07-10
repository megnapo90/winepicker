package com.kh.winepicker.user.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.winepicker.model.vo.User;
import com.kh.winepicker.user.model.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@SessionAttributes({ "loginUser" })
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

	// 마이페이지로 이동
	@GetMapping("/myPage")
	public String showMyPage() {
		return "user/myPage";
	}

	// 리뷰관리로 이동
	@GetMapping("/myReview")
	public String showMyReview() {
		return "user/myReview";
	}

	// 최근 본 상품으로 이동
	@GetMapping("/myRecentProduct")
	public String showMyRecentProduct() {
		return "user/myRecentProduct";
	}

	// 관심상품으로 이동
	@GetMapping("/myWishList")
	public String showMyWishList() {
		return "user/myWishList";
	}

	// mypage 메뉴 중 고객센터로 이동
	@GetMapping("/callCenter")
	public String userCallCenter() {
		return "user/callCenter";
	}

	// mypage 메뉴 중 공지사항으로 이동
	@GetMapping("/userNotice")
	public String userNotice() {
		return "user/userNotice";
	}

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
