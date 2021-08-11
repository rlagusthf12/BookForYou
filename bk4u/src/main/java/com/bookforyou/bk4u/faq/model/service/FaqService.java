package com.bookforyou.bk4u.faq.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.faq.model.vo.Faq;


public interface FaqService {	
	
	ArrayList<Faq> selectFaqList();
	ArrayList<Faq> selectTypeList();
	ArrayList<Faq> selectList();
	int updateQueType(Faq f);
	int insertQueType(Faq f);
	int deleteQueType(Faq f);
	int typeListCount(HashMap<String, String> map);
	public ArrayList<Faq> selectTypeList1(PageInfo pi, HashMap<String, String> map);
	int increaseCount(int faqNo);
	Faq selectFaq(int faqNo);
	int writeFaq(Faq f);
	int deleteFaq(int faqNo);
	int updateFaq(Faq f);
}
