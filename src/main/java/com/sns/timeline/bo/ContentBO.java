package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.ContentView;

@Service
public class ContentBO {
	
	// 다른 곳에 있는 BO 필요한 부를수도 있다.
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	@Autowired
	private LikeBO likeBO;
	
	
	// 가공하다: generate
	// 로그인 되지 않아도 타임라인은 볼 수 있으므로 userId는 Integer이다.
	public List<ContentView> generateContentViewList(Integer userId) {
		
		// 글 List를 가져온다. => 반복문 돌림
		
		List<Post> postList = postBO.getPostList();
		
		List<ContentView> contentViewList = new ArrayList<>();
		
		
		
	}
	
}
