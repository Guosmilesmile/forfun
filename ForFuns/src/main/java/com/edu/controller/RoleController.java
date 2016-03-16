package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.Role;
import com.edu.model.User;
import com.edu.service.IRoleService;
import com.edu.table.RoleTable;
import com.edu.table.UserTable;
import com.edu.util.FastJsonTool;

@Controller
@Lazy(true)
@RequestMapping("/role.do")
public class RoleController {

	@Autowired
	private IRoleService roleService;
	
	/**
	 * 获取所有角色权限
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getallrole")
	public Map<String, Object> GetAllRole(){
		List<Role> list = roleService.GetAllRole();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roles", list);
		return map;
		//String str = FastJsonTool.createJsonString(list);
		//return str;
	}
	
	/**
	 * 获取角色权限分页
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getRolebypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageRole(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Role> list = roleService.GetPageBeanFilter(Role.class, page,
				pageSize,selectname,value);
		int total = roleService.GetPageBeanFilterTotal(Role.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 删除角色
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteRole")
	@ResponseBody
	public String JsonDeleteRole(@RequestParam(value = "ids") String ids) {
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			roleService.DeleteBatch(Role.class, temp);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	/**
	 * 添加角色
	 * @param data
	 * @return
	 */
	@RequestMapping(params="method=addRole")
	@ResponseBody
	public int JsonAddUser(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String rolename = jsonObject.getString(RoleTable.ROLENAME);
			Role roleBean = new Role(rolename);
			roleService.AddBean(roleBean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	
	/**
	 * 更新
	 * @param data
	 * @return
	 */
	@RequestMapping(params="method=updateRole")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		data = data.substring(1,data.length()-1);
		System.out.println(data);
		JSONObject jsonObject = new JSONObject(data);
		int id = jsonObject.getInt(RoleTable.ID);
		String rolename = jsonObject.getString(RoleTable.ROLENAME);
		Role roleBean = new Role(id,rolename);
		roleService.UpdataBean(roleBean);
		return "true";
	}
}
