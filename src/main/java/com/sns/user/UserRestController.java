package com.sns.user;

import java.util.Map;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/user")
@RestController
public class UserRestController {
	
	
	// 로그인 ajax
	@RequestMapping("/sign_in")
	public Map<String, Object> signIn() {
		
	}
}
