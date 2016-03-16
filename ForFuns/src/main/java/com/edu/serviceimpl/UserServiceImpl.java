/**
 * 
 */
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
import com.edu.base.TreeBean;
import com.edu.base.TreeChildItemBean;
import com.edu.dao.IUserDao;
import com.edu.model.Function;
import com.edu.model.Role;
import com.edu.model.User;
import com.edu.service.IUserService;

@Lazy(true)
@Transactional
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements IUserService {
	@Resource
	private IUserDao userDao;

	@Override
	public boolean isExist(User user) {
		return userDao.isExist(user);
	}

	@Override
	public void save(User user) {
		userDao.addEntity(user);
		/*int i=1/0;
		userDao.addEntity(user);*/
	}

	@Override
	public Map<String, Object> GetUserTree(int page, int pageSize) {
		List<User> list = this.GetPageBean(User.class, page, pageSize);
		List<TreeBean> temp = new ArrayList<TreeBean>();
		int total = 0;
		for(int i=0;i<list.size();i++){
			User userBean = list.get(i);
			Set<Role> set =userBean.getRoleBeans();
			if (set.size()!=0) {
				total++;
				TreeBean treeBean = new TreeBean();
				treeBean.setId(userBean.getId()+"");
				treeBean.setName(userBean.getUsername());
				for(Role  roleBean : set){
					treeBean.getChildren().add(new TreeChildItemBean(userBean.getId()+"_"+roleBean.getId(),
							roleBean.getRolename()));
				}
				temp.add(treeBean);
			}
		}
		//String treeString= FastJsonTool.createJsonString(temp);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rows", temp);
		map.put("total", total);
		return map;
	}

}
