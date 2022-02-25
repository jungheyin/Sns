package com.sns.timeline.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sns.timeline.model.Like;

@Repository
public interface LikeDAO {
	
	public List<Like> selectLikeList();
}
