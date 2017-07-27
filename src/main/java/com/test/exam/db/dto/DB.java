package com.test.exam.db.dto;

import org.springframework.stereotype.Component;

@Component
public class DB{
	private int dinum;
	private String url;
	private String port;
	private String dbms;
	private String dbname;
	private String id;
	private String pwd;
	public int getDinum() {
		return dinum;
	}
	public void setDinum(int dinum) {
		this.dinum = dinum;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getDbms() {
		return dbms;
	}
	public void setDbms(String dbms) {
		this.dbms = dbms;
	}
	public String getDbname() {
		return dbname;
	}
	public void setDbname(String dbname) {
		this.dbname = dbname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
}
