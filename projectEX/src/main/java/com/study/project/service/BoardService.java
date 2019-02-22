package com.study.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

public interface BoardService {

	String list(Map<String, Object> map, Model model);

	List<Map<String, Object>> list1(Map<String, Object> map);

	List<Map<String, Object>> list2();

	String write(HttpServletRequest request, Model model);

	String modify(HttpServletRequest request, Model model);

	Map<String, Object> modi(HttpServletRequest request);

	String delete(Map<String, List<String>> map);

	String miplTest(HttpServletRequest request, HttpServletResponse response) throws Exception;

	void miplSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
