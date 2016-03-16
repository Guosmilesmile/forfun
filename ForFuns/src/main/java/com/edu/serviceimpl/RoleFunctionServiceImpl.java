package com.edu.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IFunctionDao;
import com.edu.dao.IRoleDao;
import com.edu.dao.IRoleFunctionDao;
import com.edu.model.Function;
import com.edu.model.Role;
import com.edu.model.RoleFunction;
import com.edu.service.IRoleFunctionService;
import com.edu.table.RoleFunctionTable;
@Lazy(true)
@Transactional
@Service("roleFunctionService")
public class RoleFunctionServiceImpl extends BaseServiceImpl<RoleFunction>
		implements IRoleFunctionService {

	@Resource
	private IRoleFunctionDao roleFunctionDao;

	@Resource
	private IRoleDao roleDao;
	
	@Resource
	private IFunctionDao functionDao;
	@Override
	public int IsExitRoleFunction(int roleid, int functionid) {
		try {
			int result = roleFunctionDao.IsExitRoleFunction(roleid, functionid);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int AddRoleFunction(int roleid, int functionid) {
		int fontResult = IsExitRoleFunction(roleid, functionid);
		if(fontResult==0){
			Role roleBean = (Role) roleDao.getEntitybyId(Role.class,roleid);
			Function functionBean = (Function) functionDao.getEntitybyId(Function.class, functionid);
			RoleFunction roleFunctionBean = new RoleFunction(roleBean, functionBean);
			roleFunctionDao.addEntity(roleFunctionBean);
			return 2;
		}else if(fontResult==1){
			return 1;
		}else{
			return -1;
		}
	}

	/*@Override
	public int DeleteRoleFunction(int roleid, int functionid) {
		Map<String, String> require = new HashMap<String, String>();
		require.put(RoleFunctionTable.ROLEID, roleid+"");
		require.put(RoleFunctionTable.FUNCTIONID,functionid+"");
		try {
			Integer id = roleFunctionDao.SqlgetObjectId(RoleFunctionTable.TABLENAME, require);
			roleFunctionDao.deleteEntitybyId(RoleFunctionBean.class, id);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}*/

}
