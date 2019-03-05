package com.study.project.dao;

import java.util.List;
import java.util.Map;

import com.tobesoft.platform.data.Dataset;

public interface BoardDao {

	public List<Map<String, Object>> list1(Map<String, Object> map);

	public List<Map<String, Object>> list2();

	public int write(Map<String, Object> map);

	public 	Integer modify(Map<String, Object> modi);

	public Map<String, Object> modify1(String sub);

	public Integer delete(Map<String, List<String>> map);

	public List<Map<String, Object>> miplTest();

	public List<Map<String, Object>> miplSearch(Map<String, Object> search);

	public Integer totalCount(Map<String, Object> map);

	public List<Map<String, Object>> limitSave(Map<String, Object> map);

	public List<Map<String, Object>> select();

}
