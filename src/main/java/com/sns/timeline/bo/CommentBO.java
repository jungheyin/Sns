package com.sns.timeline.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.timeline.dao.CommentDAO;
import com.sns.timeline.model.Comment;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;

	public List<Comment> getCommentList() {
		
		return commentDAO.selectCommentList();
	}
}
