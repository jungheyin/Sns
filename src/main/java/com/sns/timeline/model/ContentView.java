package com.sns.timeline.model;

import java.util.List;

import com.sns.comment.model.CommentView;
import com.sns.post.model.Post;
import com.sns.user.model.User;

// 타임라인의 카드 하나
public class ContentView {
	
	//여기는 timeline용 객체이다.
	// db컬럼과 달라질 경우 새로운 객체를 만들어서주는것이 더 좋다.
	private Post post;
	private User user; // 유저의 정보도 가져와도 괜찮을꺼 같다!! // 글쓴이
	private List<CommentView> commentList;
//	private List<Like> likeList;
	
	public List<CommentView> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<CommentView> commentList) {
		this.commentList = commentList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Post getPost() {
		return post;
	}

	public void setPost(Post post) {
		this.post = post;
	}
	
	

}
