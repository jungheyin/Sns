package com.sns.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@RequestMapping("/test")
	@ResponseBody
	public String test() {
		return "Hello world";
	}
	
	@RequestMapping("/test_view")
	public String testView() {
		return "test/test";
	}
}
