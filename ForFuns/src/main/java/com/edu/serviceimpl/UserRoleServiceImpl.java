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
import com.edu.model.Function;
import com.edu.model.Role;
import com.edu.model.RoleFunction;
import com.edu.model.User;
import com.edu.model.UserRole;
import com.edu.service.IUserRoleService;
import com.edu.table.UserRoleTable;
@Lazy(true)
@Transactional
@Service("userRoleService")
public class UserRoleServiceImpl extends BaseServiceImpl<UserRole> implements IUserRoleService{
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
			User user = (User) userDao.getEntitybyId(User.class, userid);
			Role role = (Role) roleDao.getEntitybyId(Role.class,roleid);
			UserRole userRoleBean = new UserRole(user, role);
			userRoleDao.addEntity(userRoleBean);
			return 2;
		}else if(fontResult==1){
			return 1;
		}else{
			return -1;
		}
	}

	@Override
	public List<Function> GetUserFunctions(int userid) {
		User userBean = (User) userDao.getEntitybyId(User.class, userid);
		Set<Role> roleset= userBean.getRoleBeans();
		List<Function> functionBeans = new ArrayList<Function>();
		for(Role roleBean: roleset){
			Set<Function> functionSet = roleBean.getFunctionBeans();
			for(Function functionBean:functionSet){
				functionBeans.add(functionBean);
			}
		}
		return functionBeans;
	}
	
	
}
