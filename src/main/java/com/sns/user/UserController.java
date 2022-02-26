package com.sns.user;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/user")
@Controller
public class UserController {

	@RequestMapping("/sign_up_view")
	public String signUpView(Model model) {
		model.addAttribute("userViewName", "user/sign_up");
		
		return"user_template/layout";
	}
	
	@RequestMapping("/sign_in_view")
	public String signInView(Model model) {
		model.addAttribute("userViewName", "user/sign_in");
		
		return "user_template/layout";
	}
}
