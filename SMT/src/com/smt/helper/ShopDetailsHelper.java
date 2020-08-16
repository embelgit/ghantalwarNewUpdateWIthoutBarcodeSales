package com.smt.helper;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smt.bean.ExpenseTypeBean;
import com.smt.bean.ShopDetailsBean;
import com.smt.dao.BankDetailsDao;
import com.smt.dao.ExpenditureDetailsDao;
import com.smt.dao.ShopDetailsDao;
import com.smt.hibernate.BankDetailsH;
import com.smt.hibernate.ShopDetailsBeanH;

public class ShopDetailsHelper
{	
	public void addShopDetails(HttpServletRequest request, HttpServletResponse response)
	{		
		String shopName = request.getParameter("shopName");
		String contactNumber = request.getParameter("contactNumber");
		String gstNo = request.getParameter("gstNo");
		String shopAddress = request.getParameter("shopAddress");
		String cityName = request.getParameter("cityName");
		
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		Date dateobj = new Date();
	
		String newDate = df.format(dateobj);
	
		ShopDetailsBeanH shop = new ShopDetailsBeanH();
	
		shop.setShopName(shopName);
		shop.setContactNumber(contactNumber);
		shop.setGstNo(gstNo);
		shop.setShopAddress(shopAddress);
		shop.setCity(cityName);
		shop.setShopRegDate(dateobj);
	
		ShopDetailsDao reg = new ShopDetailsDao();
		reg.addShopDeatailsDAO(shop);		
	}
	
	
	public Map getAllShopHelper()
	{
		Map<String, ShopDetailsBean> map = new HashMap<String, ShopDetailsBean>();

		ShopDetailsDao dao = new ShopDetailsDao();
		List catList = dao.getAllShopsDAo();
		Map map1 = new HashMap();
		for (int i = 0; i < catList.size(); i++) {
			Object[] o = (Object[]) catList.get(i);
			ShopDetailsBean bean = new ShopDetailsBean();
			bean.setPkShopId(o[0].toString());
			bean.setShopName((String) o[1]);
			map1.put(bean.getPkShopId(), bean);
		}
		return map1;
	}
	
	
}
