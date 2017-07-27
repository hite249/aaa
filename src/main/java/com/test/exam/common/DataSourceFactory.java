package com.test.exam.common;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.test.exam.common.dto.DataBase;

@Service
public class DataSourceFactory{
	BasicDataSource bds;
	SqlSessionFactoryBean ssf ;
	SqlSession ss;
	
	public void setDataSource(DataBase db){
		bds = new BasicDataSource();
		bds.setDriverClassName(db.getDriverName());
		bds.setUrl(db.getUrl());
		bds.setUsername(db.getUserName());
		bds.setPassword(db.getPassword());
	}

	private SqlSessionFactoryBean getSsf(String dbName){
		ssf = new SqlSessionFactoryBean();
		ssf.setDataSource(bds);
		ssf.setConfigLocation(new ClassPathResource("common/spring/mybatis-config.xml"));
		return ssf;
	}
	
	private void closeSession(){
		if(ss!=null){
			ss.close();
			ss = null;
		}
	}
	public SqlSession getSession(String dbName) throws Exception{
		closeSession();
		ss = getSsf(dbName).getObject().openSession();
		return ss;
	}
}
