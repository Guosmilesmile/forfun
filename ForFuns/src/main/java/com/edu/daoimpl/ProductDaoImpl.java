package com.edu.daoimpl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IProductDao;
import com.edu.model.Product;
import com.edu.table.ProductTable;

@Lazy(true)
@Repository("productDao")
public class ProductDaoImpl extends BaseDaoImpl<Product> implements IProductDao {

	@Override
	public int ChangeSituation(Product productBean, Integer situation) {
		this.sqlWithNone("update " + ProductTable.TABLENAME + " set " + ProductTable.SITUATION + " =" + situation
				+ " and " + ProductTable.ARTISTID + " =" + productBean.getId());
		return 1;
	}

	@Override
	public List<Product> GetOnlineProduct(int page, int pageSize, int typeid, int methodid) {
		String hql = "";
		List<Product> list = null;
		try {
			// hql = "from
			// "+ProductBean.class.newInstance().getClass().getName()+" temp
			// where temp.productSellBean.sellMethodBean.id = ? and
			// current_date() >= timestart and current_date()<=timeout and
			// typeid=? and ( situation = 1 or situation = 0 )";
			// hql = "from
			// "+ProductBean.class.newInstance().getClass().getName()+" temp
			// where temp.productSellBean.sellMethodBean.id = ? and typeid=? and
			// ( situation = 1 or situation = 0 )";
			
			//以下源代码
//			 hql = "select temp from  "+ProductBean.class.newInstance().getClass().getName()+" temp  inner join temp.productTypeBean type where temp.productSellBean.sellMethodBean.id = ? and type.id=? and ( situation = 1 or situation = 0 )";
//			 System.out.println(hql);
//			 Query query = getSession().createQuery(hql);
//			 query.setInteger(0, methodid);
//			 query.setInteger(1, typeid);

			Query query = getSession().getNamedQuery("ProductqueryGetOnlineProduct");
//			query.setString("classname", ProductBean.class.newInstance().getClass().getName());
			query.setInteger("methodid", methodid);
			query.setInteger("typeid", typeid);

			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getOnlineProductTotal(int typeid, int methodid) {
		String hql = "";
		List<Product> list = null;
		try {
			// hql = "from
			// "+ProductBean.class.newInstance().getClass().getName()+" where
			// current_date() >= timestart and current_date()<=timeout and
			// typeid="+typeid;
			
			//以下
			//函数未完成
			hql = "select temp from Product temp inner join temp.productTypeBean type  where temp.productSellBean.sellMethodBean.id = ? and type.id=? and ( situation = 1 or situation = 0 )";
			System.out.println(hql);
			Query query = getSession().createQuery(hql);
			query.setInteger(0, methodid);
			query.setInteger(1, typeid);
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list.size();
	}

	@Override
	public List<Product> GetArtistProduct(int page, int pageSize, int artistid) {
		String hql = "";
		List<Product> list = null;
		try {
			// hql = "from
			// "+ProductBean.class.newInstance().getClass().getName()+" temp
			// where temp.productSellBean.sellMethodBean.id = ? and
			// current_date() >= timestart and current_date()<=timeout and
			// typeid=? and ( situation = 1 or situation = 0 )";
			
			//以下
//			hql = "from " + ProductBean.class.newInstance().getClass().getName() + " where artistid=" + artistid;
//			// System.out.println(hql);
//			Query query = getSession().createQuery(hql);
			
			Query query = getSession().getNamedQuery("ProductqueryGetArtistProduct");
//			query.setString("classname", ProductBean.class.newInstance().getClass().getName());
			query.setInteger("artistid", artistid);

			query.setFirstResult((page - 1) * pageSize);
			query.setMaxResults(pageSize);
			list = query.list();
			// System.out.println(list.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int getArtistProductTotal(int artistid) {
//		String hql = "";
		List<Product> list = null;
		try {
			
			
//			hql = "from " + ProductBean.class.newInstance().getClass().getName() + " temp where artistid=" + artistid;
//			System.out.println(hql);
//			System.out.println("getArtistProductTotal");
//
//			Query query = getSession().createQuery(hql);
			
			Query query = getSession().getNamedQuery("ProductquerygetArtistProductTotal");
//			query.setString("classname", ProductBean.class.newInstance().getClass().getName());
			query.setInteger("artistid", artistid);
			
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list.size();
	}

}
