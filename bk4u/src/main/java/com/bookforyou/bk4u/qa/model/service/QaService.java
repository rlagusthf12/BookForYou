package com.bookforyou.bk4u.qa.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.faq.model.vo.Faq;
import com.bookforyou.bk4u.qa.model.vo.As;
import com.bookforyou.bk4u.qa.model.vo.Qa;

public interface QaService {
	
	int selectListCount();
	int selectListAdCount(int memNo);
	int selectMemNoQaListCount(int memNo);
	int selectAnsListCount();
	int selectAnsAdListCount(int memNo);
	int selectYetListCount();
	int selectYetAdListCount(int memNo);
	ArrayList<Qa> selectTypeList();
	ArrayList<Qa> selectList(PageInfo pi);
	ArrayList<Qa> selectAdList(PageInfo pi,int memNo);
	Qa selectQa(int qaNo);
	As selectAs(int qaNo);
	int typeListCount(HashMap<String, String> map);
	int typeAnsListCount(HashMap<String, String> map);
	int typeYetListCount(HashMap<String, String> map);
	public ArrayList<Qa> selectTypeList1(PageInfo pi, HashMap<String, String> map);
	ArrayList<Qa> searchMemNoQaList(PageInfo pi,int memNo);
	int writeAns(As as);
	int writeQa(Qa qa);
	
	int updateStatus(int qaNo);
	int updateQa(Qa qa);
	int updateAns(As as);
	int deleteQa(int qaNo);
	int deleteAns(int qaNo);
	
	
	

}
