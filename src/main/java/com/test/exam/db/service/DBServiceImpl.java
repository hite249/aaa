package com.test.exam.db.service;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.exam.common.DataSourceFactory;
import com.test.exam.common.dao.MainDao;
import com.test.exam.common.dto.DataBase;

@Service
public class DBServiceImpl implements DBService {

	@Autowired
	private MainDao mainDao;
	@Autowired
	private DataSourceFactory dsf;
	private SqlSession ss;

	public void setDataBase(DataBase db) {
		dsf.setDataSource(db);
	}

	public boolean connectDB(DataBase db) throws Exception {
		dsf.setDataSource(db);
		ss = dsf.getSession(db.getDbName());
		return true;
	}

	public Map runSql(Map pm) throws Exception{
		try {
			String sql = (String)pm.get("sql");
			sql = sql.trim();
			Map map = new HashMap();
			Statement statement = ss.getConnection().createStatement();
			if(sql.indexOf("select")==0){
				ResultSet resultSet = statement.executeQuery(sql);
				ResultSetMetaData metadata = resultSet.getMetaData();
				int columnCount = metadata.getColumnCount();
				ArrayList<String> columns = new ArrayList<String>();
				for (int i = 1; i <= columnCount; i++) {
					String columnName = metadata.getColumnName(i);
					columns.add(columnName);
				}
				List list = new ArrayList();
				while(resultSet.next()){
					Map hm = new HashMap();
					for(String column : columns){
						hm.put(column, resultSet.getString(column));
					}
					list.add(hm);
				}
				map.put("type", "select");
				map.put("list", list);
				map.put("columns", columns);
			}else{
				int result = statement.executeUpdate(sql);
				map.put("type", "save");
				map.put("row", result);
			}
			return map;
		} catch (SQLException e) {
			throw new Exception(e);
		}
	}

	public List getTableList() {
		return ss.selectList("db.TABLE_SELECT");
	}

	public List getTableInfo(Map pm) {
		return ss.selectList("db.TABLE_INFO_SELECT", pm);
	}

	public List getDBList() {
		String sqlId = "db.DB_INFO_SELECT";
		return mainDao.getList(sqlId);
	}

	public Map getDBInfo(Map paramMap) {
		String sqlId = "db.DB_INFO_SELECT";
		return (Map) mainDao.getObject(sqlId, paramMap);
	}

	public int insertDB(Map paramMap) {
		String sqlId = "db.DB_INFO_INSERT";
		return mainDao.insert(sqlId, paramMap);
	}
}
