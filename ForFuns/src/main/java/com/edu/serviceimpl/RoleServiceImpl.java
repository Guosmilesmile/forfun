package com.edu.serviceimpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.base.TreeBean;
import com.edu.base.TreeChildItemBean;
import com.edu.model.Function;
import com.edu.model.Role;
import com.edu.model.RoleFunction;
import com.edu.service.IRoleService;
import com.edu.util.FastJsonTool;

@Lazy(true)
@Transactional
@Service("roleService")
public class RoleServiceImpl extends BaseServiceImpl<Role> implements IRoleService {

	@Override
	public Map<String, Object> GetPowerTree(int page,int pageSize) {
		List<Role> list =  this.GetPageBean(Role.class, page, pageSize);
		List<TreeBean> temp = new ArrayList<TreeBean>();
		int total = 0;
		for(int i=0;i<list.size();i++){
			Role roleBean = list.get(i);
			Set<Function> set = roleBean.getFunctionBeans();
			if (set.size()!=0) {
				total++;
				TreeBean treeBean = new TreeBean();
				treeBean.setId(roleBean.getId()+"");
				treeBean.setName(roleBean.getRolename());
				for(Function functionBean : set){
					treeBean.getChildren().add(new TreeChildItemBean(roleBean.getId()+"_"+functionBean.getId(),
							functionBean.getFunctionname()));
				}
				temp.add(treeBean);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", temp);
		map.put("total", total);
		return map;
	}

	@Override
	public List<Role> GetAllRole() {
		List<Role> list = this.GetAllBean(Role.class);
		List<Role> temp  = new  ArrayList<Role>();
		for(int i =0;i<list.size();i++){
			Role role = list.get(i);
			Role one = new Role(role.getId(), role.getRolename());
			temp.add(one);
		}
		return temp;
	}

}
