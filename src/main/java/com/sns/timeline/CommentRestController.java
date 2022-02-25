package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.timeline.bo.CommentBO;
import com.sns.timeline.model.Comment;

@Controller
public class CommentRestController {
	
	@Autowired
	private CommentBO commentBO;
	@RequestMapping("/comment")
	public List<Comment> commentList() {
		
		List<Comment> commentList = commentBO.getCommentList();
		
		return commentList;
	}

}
