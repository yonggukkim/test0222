package com.study.project.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.study.project.service.BoardService;

@Controller
public class BoardController {

	@Resource(name = "service")
	private BoardService boardService;
	
	@RequestMapping("list")
	public String list() {
		return "board";
	}
	
	@RequestMapping("ajax")
	public String ajax(@RequestParam Map<String, Object> map, Model model) {
		System.out.println("ajax controller"+ map);
		boardService.ajax(map, model);
		System.out.println("서비스호출끝");
		return "ajaxBoard";
	}
	
	@RequestMapping("list1")
	public String list1(Map<String, Object> map, Model model) {
		List<Map<String, Object>> list1 = new ArrayList<Map<String, Object>>();
		list1 = boardService.list1(map);
		model.addAttribute("list1", list1);
		return "board1";
	}
	
	@RequestMapping("list2")
	public String list2(Model model) {
		List<Map<String, Object>> list2 = new ArrayList<Map<String, Object>>();
		list2 = boardService.list2();
		model.addAttribute("list2", list2);
		return "board2";
	}
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String write(Model model, HttpServletRequest request) {
		model.addAttribute("write", request);
		return "write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write1(HttpServletRequest request, Model model) {
		String asd = boardService.write(request, model);
		return asd;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modify(Model model, HttpServletRequest request) {
		System.out.println("controllor "+request.getParameter("seq"));
		Map<String, Object> modi = new HashMap<String, Object>();
		modi = boardService.modi(request);
		model.addAttribute("modi", modi);
		return "write";
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modify1(Model model, HttpServletRequest request) {
		String bb = boardService.modify(request, model);
		return bb;
	}
	
	@RequestMapping("delete")
	public String delete(@RequestParam List<String> chk) {
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		map.put("chk",chk);
		System.out.println("controller "+ map);
		String dd = boardService.delete(map);
		return dd;
	}
	
	
	@RequestMapping("upload")
	public String upload(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException {
		System.out.println("파일 업로드");
		String up = boardService.upload(mRequest);
		return up;
	}
	
	@RequestMapping("download")
	public String download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String down = boardService.download(request, response);
		return down;
	}
	
	@RequestMapping("excel")
	public String excel(Model model) {
		String ex = boardService.excel(model);
		return ex;
	}
	
	@RequestMapping("miplTest")
	public String miplTest(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("error controller");
		String a = boardService.miplTest(request, response);
		return a;
	}
	
	@RequestMapping("miplSearch")
	public void miplSearch(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("errrororo 검출");
		boardService.miplSearch(request,response);
	}
	
	@RequestMapping("miplInsert")
	public void miplInsert(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("마이플 인설트 error 검출");
		boardService.miplInsert(req,res);
	}
}
