package com.sns.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sns.common.EncryptUtils;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	// 중복확인 ajax 
	@RequestMapping("/is_duplicated_id") 
	public Map<String, Object> isDuplicatedId(
			@RequestParam("loginId") String loginId) {
		
		//result map
		Map<String, Object> result = new HashMap<>();
		boolean existLoginId = userBO.existLoginId(loginId);
		
		result.put("result", existLoginId);
		
		return result;
	}
	
	// 회원가입 ajax
	@RequestMapping("/sign_up")
	public Map<String, Object> signUpForSubmit(
			@RequestParam("loginId") String loginId,
			@RequestParam("name") String name,
			@RequestParam("password") String password,
			@RequestParam("email") String email) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		// db insert
		int row = userBO.addUser(loginId, name, encryptPassword, email);
		
		// 결과값
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		if (row < 1) {
			result.put("result","error");
		}
		
		return  result;
	}
	
	// 로그인 ajax
	@RequestMapping("/sign_in")
	public Map<String, Object> signIn(
			@RequestParam("loginId") String loginId,
			@RequestParam("password") String password,
			HttpServletRequest request) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		// db 연결
		User user = userBO.getByLoginIdPassword(loginId, encryptPassword);
		// 결과 json 리턴!
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		//로그인성공하면 세션에 User 정보를 담는다.
		if (user != null) { // 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("userLoginId", user.getLoginId());
			session.setAttribute("userPassword", user.getPassword());
		} else {
			result.put("result", "error");
			result.put("errorMessage", "존재하지 않은 사용자입니다.");
		}
		
		
		return result;
	}
}
