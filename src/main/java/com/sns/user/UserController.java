package com.sns.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/sign_up_view")
	public String signUpView() {
		
		return"/user/sign_up";
	}
	
	@RequestMapping("/sign_in_view")
	public String signInView() {
		
		return "/user/sign_in";
	}
}
