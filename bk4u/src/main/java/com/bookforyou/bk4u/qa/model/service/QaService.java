package com.bookforyou.bk4u.qa.model.service;

import java.util.ArrayList;

import com.bookforyou.bk4u.common.model.vo.PageInfo;
import com.bookforyou.bk4u.qa.model.vo.As;
import com.bookforyou.bk4u.qa.model.vo.Qa;

public interface QaService {
	
	int selectListCount();
	int selectMemNoQaListCount(int memNo);
	int selectAnsListCount();
	int selectYetListCount();
	ArrayList<Qa> selectList(PageInfo pi);
	Qa selectQa(int qaNo);
	As selectAs(int qaNo);
	
	ArrayList<Qa> searchMemNoQaList(PageInfo pi,int memNo);

}
