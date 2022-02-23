package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.dao.UserDAO;
import com.sns.user.model.User;
@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public boolean existLoginId(String loginId) {
		return userDAO.existLoginId(loginId);
	}
	
	public int addUser(String loginId, String name, String password,
			String email) {
		return userDAO.insertUser(loginId, name, password, email);
	}
	
	public User getByLoginIdPassword(String loginId, String password) {
		return userDAO.selectByLoginIdPassword(loginId, password);
	}

}
