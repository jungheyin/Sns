package com.sns.timeline.model;

import java.util.List;

import com.sns.post.model.Post;

// 타임라인의 카드 하나
public class ContentView {
	
	//여기는 timeline용 객체이다.
	// db컬럼과 달라질 경우 새로운 객체를 만들어서주는것이 더 좋다.
	private Post post;
	private List<Comment> commentList;
	private List<Like> likeList;

}
