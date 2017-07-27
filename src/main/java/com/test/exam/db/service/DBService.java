package com.test.exam.db.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.test.exam.common.dto.DataBase;

@Service
public interface DBService {
	public void setDataBase(DataBase db);
	public int insertDB(Map paramMap);	
	public boolean connectDB(DataBase db)throws Exception;
	public List getTableList();
	public List getDBList();
	public Map getDBInfo(Map paramMap);
	public List getTableInfo(Map pm);
	public Map runSql(Map pm)throws Exception ;
}
