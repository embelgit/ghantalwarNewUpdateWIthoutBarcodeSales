package com.smt.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;
import com.smt.hibernate.ShopDetailsBeanH;
import com.smt.utility.HibernateUtility;

public class ShopDetailsDao
{
	public void addShopDeatailsDAO(ShopDetailsBeanH shop)
	{
		HibernateUtility hbu = null;
		Session session = null;
		Transaction transaction = null;

		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			session.save(shop);
			transaction.commit();
		}
		catch (RuntimeException e)
		{
			try
			{
				transaction.rollback();
			}
			catch (RuntimeException e2)
			{
				Log.error("Error in shop DETAILS Add FORM", e2);
			}
		}
		finally
		{
			if (session != null)
			{
				hbu.closeSession(session);
			}
		}
	}
	
	public List getAllShopsDAo()
	{
		HibernateUtility hbu = null;
		Session session = null;
		List list = null;
		try
		{
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			Query query = session.createSQLQuery("SELECT sd.pkShopId, sd.shopName FROM shopdetails sd;");
			list = query.list();
		}
		catch (RuntimeException e)
		{
			Log.error("Error in getSubCategoriesByRootcategory(String mainCatId)", e);
		}
		finally
		{
			if (session != null)
			{
				hbu.closeSession(session);
			}
		}

		return list;
	}
}
