package com.sns.like.model;

import java.util.Date;

public class Like {
	private int uerId;
	private int postId;
	private Date createdAt;
	
	public int getUerId() {
		return uerId;
	}
	public void setUerId(int uerId) {
		this.uerId = uerId;
	}
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

}
