package com.bookforyou.bk4u.sales.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bookforyou.bk4u.sales.model.vo.Sales;

@Repository
public class SalesDao {

	public ArrayList<Sales> dailySales(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("salesMapper.dailySales",map);
	}
	
	public ArrayList<Sales> monthSales(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("salesMapper.monthSales",map);
		}
	
	public ArrayList<Sales> yearsSales(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("salesMapper.yearsSales");
	}
	
	public ArrayList<Sales> dailySubSales(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("salesMapper.dailySubSales",map);
	}
	
	public ArrayList<Sales> monthSubSales(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("salesMapper.monthSubSales",map);
		}
	
	public ArrayList<Sales> yearsSubSales(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("salesMapper.yearsSubSales");
	}
	
	public ArrayList<Sales> dailyOrdersSales(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("salesMapper.dailyOrdersSales",map);
	}
	
	public ArrayList<Sales> monthOrdersSales(SqlSessionTemplate sqlSession, HashMap<String, String> map){
		return (ArrayList)sqlSession.selectList("salesMapper.monthOrdersSales",map);
		}
	
	public ArrayList<Sales> yearsOrdersSales(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("salesMapper.yearsOrdersSales");
	}
}
