package com.edu.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IRoleDao;
import com.edu.dao.IUserDao;
import com.edu.dao.IUserRoleDao;
import com.edu.model.FunctionBean;
import com.edu.model.RoleBean;
import com.edu.model.RoleFunctionBean;
import com.edu.model.UserBean;
import com.edu.model.UserRoleBean;
import com.edu.service.IUserRoleService;
import com.edu.table.UserRoleTable;
@Lazy(true)
@Transactional
@Service("userRoleService")
public class UserRoleServiceImpl extends BaseServiceImpl<UserRoleBean> implements IUserRoleService{
	@Resource
	private IUserRoleDao userRoleDao;
	
	@Resource
	private IUserDao userDao;
	@Resource
	private IRoleDao roleDao;

	@Override
	public int IsExitUserRole(int userid, int roleid) {
		
		Map<String, String> require = new HashMap<String, String>();
		require.put(UserRoleTable.USERID, userid+"");
		require.put(UserRoleTable.ROLEID, roleid+"");
		try {
			Integer id  = userRoleDao.SqlgetObjectId(UserRoleTable.TABLENAME, require);
			if(null == id)
				return 0;
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int AddUserRole(int userid, int roleid) {
		int fontResult = IsExitUserRole(userid, roleid);
		if(fontResult==0){
			UserBean user = (UserBean) userDao.getEntitybyId(UserBean.class, userid);
			RoleBean role = (RoleBean) roleDao.getEntitybyId(RoleBean.class,roleid);
			UserRoleBean userRoleBean = new UserRoleBean(user, role);
			userRoleDao.addEntity(userRoleBean);
			return 2;
		}else if(fontResult==1){
			return 1;
		}else{
			return -1;
		}
	}

	@Override
	public List<FunctionBean> GetUserFunctions(int userid) {
		UserBean userBean = (UserBean) userDao.getEntitybyId(UserBean.class, userid);
		Set<RoleBean> roleset= userBean.getRoleBeans();
		List<FunctionBean> functionBeans = new ArrayList<FunctionBean>();
		for(RoleBean roleBean: roleset){
			Set<FunctionBean> functionSet = roleBean.getFunctionBeans();
			for(FunctionBean functionBean:functionSet){
				functionBeans.add(functionBean);
			}
		}
		return functionBeans;
	}
	
	
}
