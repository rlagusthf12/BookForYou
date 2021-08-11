package com.bookforyou.bk4u.sales.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.bookforyou.bk4u.sales.model.vo.Sales;

public interface SalesService {
	ArrayList<Sales> yearsSales();
	ArrayList<Sales> dailySales(HashMap<String, String> map);
	ArrayList<Sales> monthSales(HashMap<String, String> map);
}
