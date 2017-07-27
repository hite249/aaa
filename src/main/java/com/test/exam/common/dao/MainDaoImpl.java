package com.test.exam.common.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.test.exam.user.dto.User;

@Service
public  class MainDaoImpl extends SqlSessionDaoSupport implements MainDao{
	
	public String getToday() {
		String today =  (String)getSqlSession().selectOne("main.getToday");
		return today;
	}

	public int writeProc(Map<String, Object> paramMap) {
		return getSqlSession().insert("main.writeProc",paramMap );
	}
	
	public int writeProc2(User board) {
		return getSqlSession().insert("main.writeProc2",board);
	}
	
	public List getList(String sqlId) {
		return getSqlSession().selectList(sqlId);
	}
	
	public User getUserPwd(Map<String, Object> paramMap) {
		return (User)getSqlSession().selectOne("main.USER_PWD_OBJECT",paramMap);
	}
	
	public Object getObject(String sqlId, Map paramMap){
		return getSqlSession().selectOne(sqlId,paramMap);
	}
	public int memdel(String sqlId, Map paramMap){
		return getSqlSession().delete(sqlId,paramMap);
	}

	@Override
	public int insert(String sqlId, Map paramMap) {
		return getSqlSession().insert(sqlId,paramMap);
	}

	@Override
	public int update(String sqlId, Map paramMap) {
		return getSqlSession().update(sqlId,paramMap);
	}
}


