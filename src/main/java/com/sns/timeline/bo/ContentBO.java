package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.CommentView;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.ContentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class ContentBO {
	
	// 다른 곳에 있는 BO 필요한 부를수도 있다.
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
//	@Autowired
//	private LikeBO likeBO;
	
	
	// 가공하다: generate
	// 로그인 되지 않아도 타임라인은 볼 수 있으므로 userId는 Integer이다.
	public List<ContentView> generateContentViewList(Integer userId) {
		//contentView를 만들고
		List<ContentView> contentViewList = new ArrayList<>();
		
		//여기서 contentView의 내용을 만드는 것
		// 글 List를 가져온다. => 반복문 돌림
		List<Post> postList = postBO.getPostList();
		for( Post post : postList) {
			ContentView content = new ContentView();
			// 글 정보
			content.setPost(post);
			// 글쓴이 정보
			User user = userBO.getUserById(post.getUerId());
			content.setUser(user);
			// 댓글 정보
			List<CommentView> commentList = commentBO.generateCommentViewListByPostId(post.getId());
			content.setCommentList(commentList);
			
			// 좋아요 개수 세팅
			
			// 로그인 된 사용자의 좋아요 여부 세팅
				
			
			contentViewList.add(content);
		}
		
		
		// contentView의 결과
		return contentViewList;
	}
	
}
