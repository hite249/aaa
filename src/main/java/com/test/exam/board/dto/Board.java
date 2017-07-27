package com.test.exam.board.dto;

import java.util.List;

public class Board {
	private String subject;
	private String content;
	private String writer;
	
	private List boardlist;

	public String getsubject() {
		return subject;
	}

	public void setcontent(String content) {
		this.content = content;
	}

	public String getwriter() {
		return writer;
	}

	public void setwriter(String writer) {
		this.writer = writer;
	}

	public List memlist(List memlists) {
		return this.boardlist= memlists;
	}	
	
}
