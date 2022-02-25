package com.sns.timeline.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.timeline.dao.LikeDAO;
import com.sns.timeline.model.Like;

@Service
public class LikeBO {
	
	@Autowired
	private LikeDAO likeDAO;
	public List<Like> getlikeList() {
		
		List<Like> likeList = likeDAO.selectLikeList();
		
		return likeList;
	}
}
