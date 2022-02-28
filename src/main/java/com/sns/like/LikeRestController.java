package com.sns.like;

import java.util.Map;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LikeRestController {
	
	// /like/{postId}
	//session에서 userId를 가져온다.
	@RequestMapping("/like/{postId}") //패스베리어블
	public Map<String, Object> like(
			@PathVariable int postId) {
		
		return null;
	}
}
