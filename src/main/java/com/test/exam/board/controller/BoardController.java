package com.test.exam.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.exam.board.service.BoardService;
import com.test.exam.common.ParamMap;
import com.test.exam.board.dto.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService bs;
	

	@RequestMapping("/*")
	public String init(HttpServletRequest request, ModelMap model, HttpSession hs) {
		return "/board/list";
	}
	
	@RequestMapping(value="/boardaction")
	public @ResponseBody Map boardaction(@RequestBody Map pm,ModelMap model,HttpSession hs) {
		String mode = (String)pm.get("mode");
		
		List boardlist = bs.boardlist();
		model.put("data", boardlist);
		model.put("role", hs.getAttribute("role"));
		model.put("url", "/board/list");
		model.put("msg", "list call");
		
		return model;
	}

	@RequestMapping(value="/boardwrite")
	public @ResponseBody Map write(HttpServletRequest request, ModelMap model, HttpSession hs) {
		String sessRole = (String)hs.getAttribute("role");
		if(sessRole.equals("01")){
			model.put("msg", "�۾��� ������ �����ϴ�.");
		}else{
			model.put("msg", "�۾��� �������� �̵��մϴ�.");
			model.put("url", "/board/write");
		}
		return model;
	}
	@RequestMapping(value="/boardmod")
	public @ResponseBody Map mod(HttpServletRequest request, ModelMap model, HttpSession hs) {
		String sessRole = (String)hs.getAttribute("role");
		if(sessRole.equals("01") || sessRole.equals("02")){
			model.put("msg", "���� ������ �����ϴ�.");
		}else{
			model.put("msg", "���� �������� �̵��մϴ�.");
		}
		return model;
	}
	@RequestMapping(value="/boarddel")
	public @ResponseBody Map del(HttpServletRequest request, ModelMap model, HttpSession hs) {
		String sessRole = (String)hs.getAttribute("role");
		if(sessRole.equals("01") || sessRole.equals("02") || sessRole.equals("03")){
			model.put("msg", "���� ������ �����ϴ�.");
		}else{
			model.put("msg", "������ ����˴ϴ�.");
		}
		return model;
	}
}
