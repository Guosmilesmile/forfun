/**
 * 
 */
package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.model.Function;
import com.edu.model.Role;
import com.edu.model.User;
import com.edu.service.IUserService;
import com.edu.serviceimpl.UserServiceImpl;
import com.edu.table.UserTable;
import com.edu.util.MD5Util;

/**
 * 用户管理controller
 * @author Gy
 * 
 */
@Controller
@RequestMapping("/user.do")
public class UserController {
	@Resource
	private IUserService userService;

	/**
	 * 登陆功能
	 * @param username
	 * @param password
	 * @param request
	 * @param response
	 * @param token
	 * @return
	 */
	@RequestMapping(params = "method=login")
	public String login(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password,
			HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "token", required = false) String token) {
		if (null != token) {
			if (null == username) {
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				if (parts[0].equals(temp))
					return "redirect:/admin/main.jsp";
				return "redirect:/admin/Admin_login.jsp?error=1";
			}
		}
		User user = new User();
		user.setPassword(password);
		user.setUsername(username);
		System.out.println(user.toString());
		boolean loginResult = userService.isExist(user);
		if (loginResult) {
			String temp = null;
			try {
				temp = URLEncoder.encode( MD5Util.convertMD5(username), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			String value = username + "&"+ temp;
			System.out.println(value);
			Cookie cookie = new Cookie("token", value);
			response.addCookie(cookie);
			return "redirect:/admin/main.jsp";
		} else {
			return "redirect:/admin/Admin_login.jsp?error=1";
		}
	}

	/**
	 * 获取分页列表
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getUserbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageUser(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<User> list = userService.GetPageBeanFilter(User.class, page,
				pageSize,selectname,value);
		int total = userService.GetPageBeanFilterTotal(User.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}

	
	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteUser")
	@ResponseBody
	public String JsonDeleteUser(@RequestParam(value = "ids") String ids) {
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			userService.DeleteBatch(User.class, temp);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	/**
	 * 删除用户
	 * @param data
	 * @return
	 */
	@RequestMapping(params="method=addUser")
	@ResponseBody
	public int JsonAddUser(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			//data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String username = jsonObject.getString(UserTable.USERNAME);
			String password = jsonObject.getString(UserTable.PASSWORD);
			User userBean = new User(username, password);
			userService.AddBean(userBean);
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
	@RequestMapping(params="method=updateUser")
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
		int id = jsonObject.getInt(UserTable.ID);
		String username = jsonObject.getString(UserTable.USERNAME);
		String password = jsonObject.getString(UserTable.PASSWORD);
		User userBean = new User(id,username, password);
		userService.UpdataBean(userBean);
		return "true";
	}
	//[{\"id\":1,\"name\":\"C\",\"size\":\"\",\"date\":\"02/19/2010\",\"children\":[{\"id\":2,\"name\":\"Program Files\",\"size\":\"120 MB\",\"date\":\"03/20/2010\",\"children\":[{\"id\":21,\"name\":\"Java\",\"size\":\"\",\"date\":\"01/13/2010\",\"state\":\"closed\",\"children\":[{\"id\":211,\"name\":\"java.exe\",\"size\":\"142 KB\",\"date\":\"01/13/2010\"},{\"id\":212,\"name\":\"jawt.dll\",\"size\":\"5 KB\",\"date\":\"01/13/2010\"}]}]}]}]
	@RequestMapping(params="method=gettest")
	@ResponseBody
	public String JsonGetTree(){
		return "[{\"id\":1,\"name\":\"C\",\"children\":[{\"id\":2,\"name\":\"Program Files\"}]}]";
	}
	
	
	
	/**
	 * 获取分页列表
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params = "method=getUserTree")
	@ResponseBody
	public Map<String, Object> JsonGetUserTree(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize) {
		Map<String, Object> map = userService.GetUserTree(page, pageSize);
		return map;
	}
	
	/**
	 * 获取所有的用户
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getalluser")
	public Map<String, Object> GetAllUser(){
		List<User> list = userService.GetAllBean(User.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("users", list);
		return map;
	}
	
	/**
	 * 通过username获取对应的权限
	 * @param username
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getuserpower")
	public Map<String,Object> GetUserPower(@RequestParam(value="username")String username){
		User userBean = userService.GetBeanByCondition(User.class, UserTable.USERNAME, username, null);
		List<Function> list = userBean.GetPowers();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("power", list);
		return map;
	}
	
	
}
