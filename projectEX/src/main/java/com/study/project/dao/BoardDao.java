package com.study.project.dao;

import java.util.List;
import java.util.Map;

import com.tobesoft.platform.data.Dataset;

public interface BoardDao {

	List<Map<String, Object>> list(Map<String, Object> map);

	List<Map<String, Object>> list1(Map<String, Object> map);

	List<Map<String, Object>> list2();

	int write(Map<String, Object> map);

	Integer modify(Map<String, Object> modi);

	Map<String, Object> modify1(String sub);

	Integer delete(Map<String, List<String>> map);

	List<Map<String, Object>> miplTest();

	List<Map<String, Object>> miplSearch(Map<String, Object> search);

	Integer totalCount();

	List<Map<String, Object>> limitSave(Map<String, Object> map);

}
