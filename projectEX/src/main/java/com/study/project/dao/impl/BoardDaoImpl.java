package com.study.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.project.dao.BoardDao;
import com.tobesoft.platform.data.DatasetList;

@Repository("dao")
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, Object>> list1(Map<String, Object> map) {
		return sqlSession.selectList("mapper.list1", map);
	}

	@Override
	public List<Map<String, Object>> list2() {
		return sqlSession.selectList("mapper.list2");
	}

	@Override
	public int write(Map<String, Object> map) {
		Integer a = (Integer)sqlSession.insert("mapper.add",map);
		System.out.println("refsad "+a);
		return a;
	}

	@Override
	public Map<String, Object> modify1(String sub) {
		Map<String, Object> modilist = sqlSession.selectOne("mapper.modi", sub);
		sqlSession.update("mapper.cnt", modilist);
		return modilist;
	}
	
	@Override
	public Integer modify(Map<String, Object> modi) {
		Integer b = (Integer)sqlSession.update("mapper.modify",modi);
		System.out.println("refsad "+ b);
		return b;
	}

	@Override
	public Integer delete(Map<String, List<String>> map) {
		// TODO Auto-generated method stub
		Integer d = (Integer)sqlSession.delete("mapper.delete",map);
		System.out.println("dao " + d);
		return d;
	}

	@Override
	public Integer totalCount(Map<String, Object> map) {
		return sqlSession.selectOne("mapper.totalCount", map);
	}

	@Override
	public List<Map<String, Object>> limitSave(Map<String, Object> map) {
		return sqlSession.selectList("mapper.limitSave", map);
	}

	@Override
	public List<Map<String, Object>> select() {
		return sqlSession.selectList("mapper.select");
	}

	@Override
	public List<Map<String, Object>> miplTest() {
		return sqlSession.selectList("mapper.miplTest");
	}
	
	@Override
	public List<Map<String, Object>> miplSearch(Map<String, Object> search) {
		return sqlSession.selectList("mapper.miplSearch", search);
	}

	@Override
	public int miplInsert(Map<String, Object> map) {
		return sqlSession.insert("mapper.miplInsert",map);
	}

	@Override
	public int miplupdate(Map<String, Object> map) {
		return sqlSession.update("mapper.miplUpdate", map);
	}

	@Override
	public int miplDelete(String del_id) {
		return sqlSession.delete("mapper.miplDelete",del_id);
	}
}