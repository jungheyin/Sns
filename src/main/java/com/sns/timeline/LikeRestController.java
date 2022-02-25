package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.timeline.bo.LikeBO;
import com.sns.timeline.model.Like;

@RestController
public class LikeRestController {
	
	@Autowired
	private LikeBO likeBO;
	
	
	@RequestMapping("/like")
	public List<Like> likeList() {
		
		List<Like> likeList = likeBO.getlikeList();
		return likeList;
	}
}
