package com.sns.user.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.user.model.User;
@Repository
public interface UserDAO {
	
	public boolean existLoginId(String loginId);
	
	public int insertUser(
			@Param("loginId") String loginId, 
			@Param("name") String name, 
			@Param("password") String password,
			@Param("email") String email);
	
	public User selectByLoginIdPassword(String loginId, String password);

}