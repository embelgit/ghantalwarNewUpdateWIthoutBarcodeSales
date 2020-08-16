package com.smt.helper;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smt.bean.CategoryList;
import com.smt.bean.CategoryWisePurchase;
import com.smt.bean.SubCategoryUpdate;
import com.smt.dao.CategoryDao;
import com.smt.hibernate.Category;
import com.smt.hibernate.SubCategory;

public class CategoryHelper
{
	public void registerCategory(HttpServletRequest request, HttpServletResponse response)
	{
		
		String shopId = request.getParameter("shopId");
		String categoryName = request.getParameter("categoryName");
		String activeYn = "Y";

		String isleafCat = request.getParameter("isleafCat");
		String isrootCat = request.getParameter("isrootCat");

		Category category = new Category();
		category.setCategoryName(categoryName);
		category.setActiveYn(activeYn);
		category.setIsleafCat(isleafCat);
		category.setIsrootCat(isrootCat);
		System.out.println("shopId ====> "+shopId);
		category.setFkShopId(Long.parseLong(shopId));
		CategoryDao dao = new CategoryDao();
		dao.valCategory(category);
	}

	public List getAllMainCategories()
	{
		CategoryDao dao = new CategoryDao();
		return dao.getAllMainCategories();
	}
	
	public List getAllActiveCategories()
	{
		CategoryDao dao = new CategoryDao();
		return dao.getAllActiveCategories();
	}
	
	public List getAllMainCategoriesShopWise(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session1 = request.getSession();
		String shopId = (String) session1.getAttribute("shopId");
		
		CategoryDao dao = new CategoryDao();
		return dao.getAllMainCategoriesShopWise(shopId);
	}
	
	public List getAllActiveCategoriesShopWise(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session1 = request.getSession();
		String shopId = (String) session1.getAttribute("shopId");
		
		CategoryDao dao = new CategoryDao();
		return dao.getAllActiveCategoriesShopWise(shopId);
	}

	public List getCategoryName()
	{
		CategoryDao dao = new CategoryDao();
		List list = dao.getCategoryName();

		Map map = new HashMap();
		for (int i = 0; i < list.size(); i++)
		{
			Object[] o = (Object[]) list.get(i);
			CategoryWisePurchase bean = new CategoryWisePurchase();
			bean.setItemName((String) o[0]);

		}
		return (List) map;
	}

	public List getAllMAinCaregory(HttpServletRequest request, HttpServletResponse response)
	{		
		Map<Long, Category> map = new HashMap<Long, Category>();

		CategoryDao dao = new CategoryDao();
		List<Category> exp1List = dao.getAllMAinCaregory();

		return exp1List;
	}
	
	public List getAllMAinCaregoryShopWise(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session1 = request.getSession();
		String shopId = (String) session1.getAttribute("shopId");		
		
		Map<Long, Category> map = new HashMap<Long, Category>();

		CategoryDao dao = new CategoryDao();
		List<Category> exp1List = dao.getAllMAinCaregoryShopWise(shopId);

		return exp1List;
	}

	public List getAllMainSubCategory(HttpServletRequest request, HttpServletResponse response)
	{
		Map<Long, SubCategory> map = new HashMap<Long, SubCategory>();

		CategoryDao dao = new CategoryDao();
		List<SubCategory> exp1List = dao.getAllMainSubCategory();

		return exp1List;
	}

	public Map getCategoryBySupplier(String supplierId)
	{
		CategoryDao dao = new CategoryDao();
		List catList = dao.getCategoryBySupplier(supplierId);
		Map map1 = new HashMap();
		for (int i = 0; i < catList.size(); i++)
		{
			Object[] o = (Object[]) catList.get(i);
			CategoryList bean = new CategoryList();
			bean.setCat_name((String) o[0]);
			bean.setCatId((BigInteger) o[1]);
			map1.put(bean.getCatId(), bean);
		}
		return map1;
	}

	// rename Category
	public void reNameCategory(HttpServletRequest request, HttpServletResponse response)
	{
		String reNameCat = request.getParameter("reNameCat");
		CategoryDao dao = new CategoryDao();
		Long pk_cat_id = Long.parseLong(request.getParameter("pk_cat_id"));
		System.out.println("pk_temp_id" + pk_cat_id);
		dao.reNameCategory(pk_cat_id, reNameCat);
	}
	
	// delete Category
	public void deleteCategory(HttpServletRequest request, HttpServletResponse response)
	{
		CategoryDao dao = new CategoryDao();
		Long pk_cat_id = Long.parseLong(request.getParameter("pk_cat_id"));
		dao.deleteCategory(pk_cat_id);
	}

	// getCategorys() method is used to get all Category
	public List getCategorys()
	{
		CategoryDao dao = new CategoryDao();
		return dao.getCategoryNames();
	}
}
