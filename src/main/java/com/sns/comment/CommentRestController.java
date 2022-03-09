package com.sns.comment;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sns.comment.bo.CommentBO;

@Controller
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	
	@RequestMapping("/comment")
	public Map<String, Object> createComment(
			@RequestParam("userId") int userId,
			@RequestParam("postId") int postId,
			@RequestParam("content") String content) {
		
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "success");
		
		int row = commentBO.createComment(userId, postId, content);
		
		if (row < 0) {
			result.put("result", "error");
		}
		
		return result;
	}
	
	

}
