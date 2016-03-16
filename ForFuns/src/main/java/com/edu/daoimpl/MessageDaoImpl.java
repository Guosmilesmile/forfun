package com.edu.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IMessageDao;
import com.edu.model.Message;
import com.edu.table.MessageTable;

@Repository("messageDao")
public class MessageDaoImpl extends BaseDaoImpl<Message> implements IMessageDao {

	@Override
	public List<Message> getUnReadMessage(Integer sendid, Integer fromid) {
//		 String hql = "from MessageBean where isread=0 and "+
//		 MessageTable.FROMID +"=? and "+MessageTable.TOID +"=? ";
//		 Query createQuery = getSession().createQuery(hql);
//		 createQuery.setInteger(0, sendid);
//		 createQuery.setInteger(1, fromid);
		Query query = getSession().getNamedQuery("MessagequerygetUnReadMessage");
		query.setInteger("fid", sendid);
		query.setInteger("tid", fromid);
//		query.setString("fromid", MessageTable.FROMID);
//		query.setString("toid", MessageTable.TOID);
		List<Message> list = query.list();
		if (list.size() == 0)
			return null;
		return list;
	}
	
	@Override
	public boolean alertUnReadMessage(Integer messageid, Integer sendid, Integer fromid) {
		String sql = "update " + MessageTable.TABLENAME + " set " + MessageTable.ISREAD + "=1 where "
				+ MessageTable.FROMID + "=" + sendid + " and " + MessageTable.TOID + "=" + fromid + " and "
				+ MessageTable.ID + "<= " + messageid;
		this.sqlWithNone(sql);
		return true;
		
//		Query query = getSession().getNamedQuery("MessagequeryalertUnReadMessage");
//		query.setString("tablename", MessageTable.TABLENAME);
//		query.setString("isread", MessageTable.ISREAD);
//		query.setString("toid", MessageTable.TOID);
//		query.setString("fromid", MessageTable.FROMID);
//		query.setInteger("tid", fromid);
//		query.setInteger("fid", sendid);
//		query.setString("messageid", MessageTable.ID);
//		query.setInteger("mid", messageid);
//		query.executeUpdate();  
//		return true;
	}

	@Override
	public List<Message> getUserMessage(Integer id,Integer isread) {
		String sql = "SELECT * from "+MessageTable.TABLENAME+" where id in(select  max(id)  from "+MessageTable.TABLENAME+" where "+MessageTable.TOID+" =? and isread =?  GROUP BY "+MessageTable.FROMID+" )";
		//String sql ="from MessageBean  group by fromid=1";
		System.out.println(sql);
		Query query = getSession().createSQLQuery(sql);
		query.setInteger(0, id);
		query.setInteger(1, isread);
		List<Object[]> list = query.list();
		if (list.size() == 0)
			return null;
		List<Message> result = new ArrayList<Message>();
		for (int i = 0; i < list.size(); i++) {
			Object[] object = list.get(i);
			Message messageBean = (Message) this.getEntitybyId(Message.class,
					Integer.parseInt(object[0].toString()));
			result.add(messageBean);
		}
		return result;
	}

}
