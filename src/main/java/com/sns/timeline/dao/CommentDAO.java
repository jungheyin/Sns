package com.sns.timeline.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sns.timeline.model.Comment;

@Repository
public interface CommentDAO {

	public List<Comment> selectCommentList();
}
