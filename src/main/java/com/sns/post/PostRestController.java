package com.sns.post;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;

@RequestMapping("/post")
@RestController
public class PostRestController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	public PostBO postBO;
	
	
	@RequestMapping("/posts")
	public List<Post> posts() {
		
		List<Post> postList = postBO.getPostList();
		return postList;
	}
	
	// TODO: POST를 추가하는 로직 필요!!
	@PostMapping("/create")
	public Map<String, Object> create(
			@RequestParam(value="images", required=false) MultipartFile images,
			@RequestParam("content") String content,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// 권한검사
		if (userId == null) {
			result.put("result", "error");
			logger.error("[글쓰기] 로그인 세션이 없습니다.");
			return result;
		}
		// insert postBO
		int row = postBO.createPost(userId, images, content);
		if (row > 0) {
			result.put("result", "success");
			
		} else {
			result.put("result", "error");
			logger.error("[글쓰기] 글쓰기를 실패 했습니다.");
			
		}
		
		
		return result;
	}
	

	@DeleteMapping("/delete")
	public Map<String, Object> delete(
			@RequestParam("postId") int postId,
			HttpServletRequest request) {
		
		Map<String, Object> result = new HashMap<>();
		HttpSession session = request.getSession();
		Integer userId = (Integer) session.getAttribute("userId");
		// 권한검사 필요한다. => 세션이 풀릴경우를 대비하다!
		if (userId == null) {
			result.put("result", "error");
			result.put("errorMessage", "로그인을 다시해주세요.");
			logger.error("[post delete] 로그인 세션이 없습니다. userId:{},postId:{}", userId, postId);
			return result;
		}
		
		// 데이터베이스를 한번보고 - logger를 본다.
		// 로깅은 에러가 날수 없을때 써주는것이 좋다.!!=>단서를 남기는것이 중요하다.
		// 사용자가 에러처리를 보지안도록해주는것!!
		
	//	postBO.
		
		result.put("result", "success");
		
		return result;
	}
}
