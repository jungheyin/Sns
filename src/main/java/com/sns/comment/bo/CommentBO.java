package com.sns.comment.bo; // contentBO -> commentBO -> userBO

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentDAO;
import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class CommentBO {
	
	@Autowired
	private CommentDAO commentDAO;
	
	// bo가 남의 다오는 부르지 못한다. 남의 bo는 부를 수 있다.
	@Autowired
	private UserBO userBO;
	
	public int createComment (int userId, int postId, String content) { // 글을 만들수 잇게 다가져오게 한다.
		return commentDAO.insertComment(userId, postId, content);
	}

	public List<Comment> getCommentListByPostId(int postId) {
		return commentDAO.selectCommentListByPostId(postId);
	}
	
	public List<CommentView> generateCommentViewListByPostId(int postId) {
	// contentView에서 List<CommentView> 를 바로 사용할수 있게 가공한다.
		
		List<CommentView> resultList = new ArrayList<>(); // 결과
		List<Comment> commentList = getCommentListByPostId(postId);
		
		for (Comment comment : commentList) { // Comment -> CommentView
			CommentView commentView = new CommentView();
			
			// 댓글
			commentView.setComment(comment);
			// 댓글쓴이
			User user = userBO.getUserById(comment.getUserId());
			commentView.setUser(user);
			
			resultList.add(commentView);
			
		}
		
		return resultList;
	}
}
