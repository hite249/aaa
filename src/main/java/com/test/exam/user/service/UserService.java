package com.test.exam.user.service;

import java.util.List;
import java.util.Map;

import com.test.exam.user.dto.User;

public interface UserService {

	public User getUserPwd(Map paramMap);

	public int insertUser(Map paramMap);
	
	public List memlist();
	
	public List memrole();	
	
	public int memdel(Map paramMap);
	
	public int saveDeleteUser(Map paramMap);
}
