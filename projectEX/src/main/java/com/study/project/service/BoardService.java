package com.study.project.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface BoardService {

	public List<Map<String, Object>> list1(Map<String, Object> map);

	public List<Map<String, Object>> list2();

	public String write(HttpServletRequest request, Model model);

	public String modify(HttpServletRequest request, Model model);

	public Map<String, Object> modi(HttpServletRequest request);

	public String delete(Map<String, List<String>> map);

	public String miplTest(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void miplSearch(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public void ajax(Map<String, Object> map, Model model);

	public String upload(MultipartHttpServletRequest mRequest) throws IllegalStateException, IOException;

	public String download(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;

	public String excel(Model model);
}
