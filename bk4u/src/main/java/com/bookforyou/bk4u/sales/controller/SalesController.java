package com.bookforyou.bk4u.sales.controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bookforyou.bk4u.sales.model.service.SalesService;
import com.bookforyou.bk4u.sales.model.vo.Sales;

@Controller
public class SalesController {
	
	@Autowired
	private SalesService sService;
	
	@RequestMapping("view.cc")
	public String cacheView(){
		return "sales/salesView";
	}
	
	@RequestMapping("salesView.cc")
	public ModelAndView salesView(ModelAndView mv, String date, String type) throws ParseException{
		
		HashMap<String, String> map = new HashMap<>();
		
		
		//String type 날짜 형변환
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	
		String strDate = date;	        
	      
	    Date dt = new Date(sdf.parse(strDate).getTime());	
	    String d;
	    ArrayList<Sales> s;
	 
    
		if(type.equals("연간")) {	  	    	
	    	 s = sService.yearsSales();
	    } else if(type.equals("월간")) {
	    	 d = date.substring(0,4);
	    	map.put("d",d);
	    	 s = sService.monthSales(map);
	    } else {
	    	 d =date.substring(0,7);
	    	map.put("d",d);
	    	 s = sService.dailySales(map);	    	
	    }
		  
	   int sub=0;
	   int order=0;
	   for(int i=0; i<s.size();i++) {
		   sub+=s.get(i).getSub();		   
	   }
	   for(int i=0; i<s.size();i++) {
		   order+=s.get(i).getOrder();
	   }
	   int sum = sub+order;
	   
	   double subPer= (double)sub/(double)sum;
	   double orderPer=(double)order/(double)sum;
	 
	  
	   
	        mv.addObject("s",s)
	          .addObject("sub",sub)
	          .addObject("order",order)
	          .addObject("sum",sum)
	          .addObject("subPer",subPer)
	          .addObject("orderPer",orderPer)
	          .setViewName("sales/salesView");
		return mv;
	}

}
