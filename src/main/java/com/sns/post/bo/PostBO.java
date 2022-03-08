package com.sns.post.bo;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.post.dao.PostDAO;
import com.sns.post.model.Post;
	
@Service
public class PostBO {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private FileManagerService fileManager;

	public List<Post> getPostList() {
		return postDAO.selectPostList();
	}
	
	public int createPost(int userId, MultipartFile images, String content) {
		// content 줄바꿈 적용
		content = content.replace("\n", "<br>");
		
		// file이 있을경우 확인
		String imagePath = null;
		if (images != null) {
			try {
				imagePath = fileManager.saveFile(userId, images);
			} catch (IOException e) {
				logger.error("[파일업로드 에러] " + e.getMessage());
			}
		}
		
		return postDAO.insertPost(userId, imagePath, content);
			
	}
	
	public void deletePostByPostIdAndUserId(int postId, int userId) {
		
		// 1. postId로 select Post => logger로 남기는기!!
		
		// 2. 이미지가 있으면 이미지 삭제
		
		// 3. 글 삭제 : byPostIdUserId
		
		// 삭제시 종속되어 있는것들도 다 삭제해줘야 한다.
		// 4. 댓글들 삭제 : byPostId
		
		// 5. 좋아요 삭제 : byPostId
		
		
		
	}
	// 삭제시 글을 먼저 삭제를 한뒤에 다른 table을 만들어 후보에 넣어둔다.
	
}
