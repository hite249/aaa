package com.test.exam.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.exam.common.dao.MainDao;

@Service
public class BoardServiceImpl implements BoardService  {
	
	@Autowired
	private MainDao mainDao;
	
	public List boardlist(){
		String sqlId="board.BOARD_LIST";
		List boardlist= mainDao.getList(sqlId);
		return boardlist;
	}
}
