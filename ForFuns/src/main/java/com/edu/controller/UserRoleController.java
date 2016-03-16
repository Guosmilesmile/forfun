package com.edu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONObject;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.Function;
import com.edu.model.User;
import com.edu.model.UserRole;
import com.edu.service.IUserRoleService;
import com.edu.table.UserRoleTable;
import com.edu.table.UserTable;

/**
 * 用户角色控制器
 * @author Christy
 *
 */
@Controller
@Lazy(true)
@RequestMapping("/userrole.do")
public class UserRoleController {
	
	
	@Resource
	private IUserRoleService userRoleService;
	
	/**
	 * 删除角色权限
	 * @param userid
	 * @param roleid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=deleteUserRole")
	public String JsonDeleteUserRole(@RequestParam(value="userid") String userid,@RequestParam(value="roleid") String roleid){
		Map<String, String> require = new HashMap<String, String>();
		require.put(UserRoleTable.USERID, userid+"");
		require.put(UserRoleTable.ROLEID, roleid+"");
		int result = userRoleService.DeleteBean(UserRole.class,UserRoleTable.TABLENAME, require );
		return ""+result;
	}
	
	/**
	 * 添加角色权限
	 * @param userid
	 * @param roleid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=adduserrole")
	public String JsonAddRolePower(@RequestParam(value="item") int userid,@RequestParam(value="value") int roleid){
		int result = userRoleService.AddUserRole(userid, roleid);
		return result+"";
	}
	
	/**
	 * 获取角色权限
	 * @param userid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getuserfunction")
	public Map<String, Object> JsonGetUserFunction(@RequestParam(value="userid")int userid){
		List<Function> result = userRoleService.GetUserFunctions(userid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("functions", result);
		return map;
	}
}
