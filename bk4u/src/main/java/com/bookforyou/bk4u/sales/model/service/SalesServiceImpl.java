package com.bookforyou.bk4u.sales.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bookforyou.bk4u.sales.model.dao.SalesDao;
import com.bookforyou.bk4u.sales.model.vo.Sales;

@Service
public class SalesServiceImpl implements SalesService {

	@Autowired
	private SalesDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<Sales> yearsSales(){
		
		return sDao.yearsSales(sqlSession);
		
	}
	
	@Override
	public ArrayList<Sales> monthSales(HashMap<String, String> map){
		return sDao.monthSales(sqlSession,map);
	}
	
	
	@Override
	public ArrayList<Sales> dailySales(HashMap<String, String> map){
		return sDao.dailySales(sqlSession,map);
	}
		

}
