package com.sns.post.dao;
// 여기서부터는 db와 가까으므로 컬럼이름과 같게 만들어준다.

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.post.model.Post;

@Repository
public interface PostDAO {

	public List<Post> selectPostList();
	
	
	public int insertPost(
			@Param("userId") int userId,
			@Param("userLoginId") String userLoginId,
			@Param("images") String images, 
			@Param("content") String content);
}
