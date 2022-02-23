package com.sns.post;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/post")
@Controller
public class PostController {
	
	@RequestMapping("/post_create_view")
	public String postCreateView() {
		
		return "post/post_create_view";
	}
}
