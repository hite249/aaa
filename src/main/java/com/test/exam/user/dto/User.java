package com.test.exam.user.dto;

import org.springframework.stereotype.Component;

import com.test.exam.common.CommonDTO;
@Component
public class User extends CommonDTO{
	
	private String userId;
	private String userPwd;
	private String userName;
	private String age;
	private String admin;
	private String boardAdmin;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getBoardAdmin() {
		return boardAdmin;
	}
	public void setBoardAdmin(String boardAdmin) {
		this.boardAdmin = boardAdmin;
	}
}
