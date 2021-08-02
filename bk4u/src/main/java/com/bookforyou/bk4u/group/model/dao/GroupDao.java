package com.bookforyou.bk4u.group.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.group.model.vo.GroupBoard;
import com.bookforyou.bk4u.member.model.vo.Member;


@Repository
public class GroupDao {

	public ArrayList<GroupBoard> selectList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("groupMapper.selectList", null);
	}
	
	public int insertGMem(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("boardMapper.insertGMem", m);
	}
}
