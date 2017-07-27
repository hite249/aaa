package com.test.exam.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.test.exam.user.dto.User;

@Service
public  interface MainDao  {
	
	public String getToday() ;
	public int writeProc(Map<String, Object> paramMap) ;
	
	public int writeProc2(User board) ;
	
	public List getList(String sqlId) ;
	
	public User getUserPwd(Map<String, Object> paramMap) ;
	
	public Object getObject(String sqlId, Map paramMap);
	
	public int memdel(String sqlId, Map paramMap);
	
	public int insert(String sqlId, Map paramMap);
	
	public int update(String sqlId, Map paramMap);
}


