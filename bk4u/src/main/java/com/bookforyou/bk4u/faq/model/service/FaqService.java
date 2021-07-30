package com.bookforyou.bk4u.faq.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.faq.model.vo.Faq;


public interface FaqService {	
	
	ArrayList<Faq> selectFaqList();
	ArrayList<Faq> selectTypeList();
	
	
	
}
