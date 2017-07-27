package com.test.exam.db.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.exam.common.dto.DataBase;
import com.test.exam.db.service.DBService;

@Controller
public class DBController { 

	@Autowired
	private DBService dbs; 
	@Autowired
	private DataBase db;
	
	@RequestMapping(value="/db/add", method=RequestMethod.POST)
	public @ResponseBody Map insertDB(@RequestBody Map pm, ModelMap model) {
		db.setDbName((String) pm.get("dbname"));
		db.setDriverName((String) pm.get("dbms"));
		db.setUrl((String)pm.get("url"));
		db.setUserName((String)pm.get("id"));
		db.setPassword((String)pm.get("pwd"));
		dbs.setDataBase(db);
		int result = dbs.insertDB(pm);
		model.addAttribute("create", "failed");
		model.put("msg", "create failed");
		if(result==1){
			List dbList = dbs.getDBList();
			model.put("data", dbList);
			model.addAttribute("create", "succeed");
			model.put("msg", "create succeed");
		}
		return model;
	}

	@RequestMapping(value="/db/select", method=RequestMethod.POST)
	public @ResponseBody Map selectDB(@RequestBody Map pm, ModelMap model) {
		List dbList = dbs.getDBList();
		model.put("data", dbList);
		return model;
	}
	@RequestMapping(value="/db/tableinfo", method=RequestMethod.POST)
	public @ResponseBody Map selectTableInfo(@RequestBody Map pm, ModelMap model) {
		List tiList = dbs.getTableInfo(pm);
		model.put("data", tiList);
		return model;
	}
	@RequestMapping(value="/db/runsql", method=RequestMethod.POST)
	public @ResponseBody Map runSqlResult(@RequestBody Map pm, ModelMap model) {
		Map resultMap;
		try {
			resultMap = dbs.runSql(pm);
			String type = (String)resultMap.get("type");
			if(type.equals("select")){
				model.put("data", resultMap.get("list")); 
				model.put("columns", resultMap.get("columns"));
			}else{
				model.put("row", resultMap.get("row"));
			}
		} catch (Exception e) {
			model.put("error", e.getMessage());
		}
		return model;
	}
	@RequestMapping(value="/db/condb", method=RequestMethod.POST)
	public @ResponseBody Map connectDB(@RequestBody Map pm, ModelMap model) throws Exception {
		Map hm = dbs.getDBInfo(pm);
		db.setDbName((String) hm.get("dbname"));
		db.setDriverName((String) hm.get("dbms"));
		db.setUrl((String)hm.get("url"));
		db.setUserName((String)hm.get("id"));
		db.setPassword((String)hm.get("pwd"));
		if(dbs.connectDB(db)){
			List tableList = dbs.getTableList();
			model.put("data", tableList);
		}
		return model;
	}
}
