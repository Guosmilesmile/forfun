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

import com.edu.model.Artist;
import com.edu.model.Customer;
import com.edu.model.ExamineArtist;
import com.edu.service.IArtistService;
import com.edu.service.ICustomerService;
import com.edu.serviceimpl.ArtistServiceImpl;
import com.edu.table.CustomerTable;
import com.edu.table.NewsTable;
import com.edu.util.MD5Util;
import com.edu.viewentity.AdminCustomerVO;
import com.edu.viewentity.CustomerVO;

/**
 * 艺术家管理controller
 * 
 * @author kh
 * 
 */
@Controller
@RequestMapping("/artist.do")
public class ArtistController
{
	@Autowired
	private IArtistService artistService;
	@Autowired
	private ICustomerService customerService;
	
	
	/**
	 * 登录功能
	 * @param username
	 * @param password
	 * @param request
	 * @param response
	 * @param token
	 * @return
	 */
	@RequestMapping(params = "method=login")
	public String login(@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "password", required = false) String password, HttpServletRequest request,
			HttpServletResponse response, @CookieValue(value = "token", required = false) String token) {
		if (null != token) {
			if (null == username) {
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				if (parts[0].equals(temp))
					return "redirect:/admin/main.jsp";
				return "redirect:/jsp/login.jsp?error=1";
			}
		}
		Customer user = new Customer();
		user.setPassword(password);
		user.setUsername(username);
		System.out.println(user.toString());
		boolean loginResult = artistService.isExist(user);
		if (loginResult) {
			Cookie cookie = new Cookie("token", username + "&" + MD5Util.convertMD5(username));
			response.addCookie(cookie);
			return "redirect:/admin/main.jsp";
		} else {
			return "redirect:/jsp/login.jsp?error=1";
		}
	}

	/**
	 * 申请成为艺术家
	 * @param userid
	 * @param realname
	 * @param telphone
	 * @param personnumber
	 * @param paymode
	 * @param goodat
	 * @param request
	 * @param response
	 * @param token
	 * @return
	 */
	@RequestMapping(params = "method=apply")
	public String apply(@RequestParam(value = "userid", required = false) String userid,
			@RequestParam(value = "realname", required = false) String realname,
			@RequestParam(value = "telphone", required = false) String telphone,
			@RequestParam(value = "personnumber", required = false) String personnumber,
			@RequestParam(value = "paymode", required = false) String paymode,
			@RequestParam(value = "goodat", required = false) String goodat, HttpServletRequest request,
			HttpServletResponse response, @CookieValue(value = "useridtoken", required = false) String token) {
		if (null != token) {
			// System.out.println("get");
			if (null == userid) {
				System.out.println(token);
				String[] parts = token.split("\\&");
				System.out.println(parts.length);
				String temp = MD5Util.convertMD5(parts[1]);
				System.out.println(temp);
				userid = temp;
			}
		}
		ExamineArtist examineartist = new ExamineArtist();

		// 13806049834
		// 2187181

		examineartist.setId(artistService.countEa() + 1);
		examineartist.setPaymode(paymode);
		examineartist.setUserid(userid);
		examineartist.setGoodat(goodat);
		examineartist.setPersonnumber(personnumber);
		examineartist.setRealname(realname);
		examineartist.setTelphone(telphone);
		examineartist.setSuggestion("0");
		System.out.println(examineartist.toString());

		artistService.AddBean(examineartist);

		return "redirect:/font/personal.jsp";

		// CustomerBean user = new CustomerBean();
		//
		// System.out.println(user.toString());
		// boolean loginResult = artistService.isExist(user);
		// if (loginResult)
		// {
		// Cookie cookie = new Cookie("token", username + "&"
		// + MD5Util.convertMD5(username));
		// response.addCookie(cookie);
		// return "redirect:/admin/main.jsp";
		// } else
		// {
		// return "redirect:/jsp/login.jsp?error=1";
		// }
	}

	/**
	 * 获取艺术家分页
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getArtistbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageArtist(@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value = "selectname", defaultValue = "id") String selectname,
			@RequestParam(value = "value", defaultValue = "") String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Artist> list = artistService.GetPageBeanFilter(
				Artist.class, page, pageSize, selectname, value);
		int total = artistService.GetPageBeanFilterTotal(Customer.class,
				page, pageSize, selectname, value);
		map.put("rows", AdminCustomerVO.ChangeAtistToList(list));
		map.put("total", total);
		return map;
	}

	/**
	 * 删除用户
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteArtist")
	@ResponseBody
	public String JsonDeleteUser(@RequestParam(value = "ids") String ids) {
		Boolean flag = true;
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}

		for (int i = 0; i < id.length; i++) {
			System.out.println(temp[i]);
			Customer customerBean = customerService.GetEntityById(
					Customer.class, temp[i]);
			customerBean.setIsartist(0);
			int result = artistService.UpdataBean(customerBean);
			if (result != 1)
				flag = false;
		}

		if (flag == true)
			return "true";
		else {
			return "error";
		}
	}

	/**
	 * 添加艺术家
	 * @param data
	 * @return
	 */
	@RequestMapping(params = "method=addArtist")
	@ResponseBody
	public int JsonAddUser(@RequestParam(value = "data") String data) {
		try {
			data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1, data.length() - 1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String userid = jsonObject.getString(CustomerTable.USERID);
			String username = jsonObject.getString(CustomerTable.USERNAME);
			String password = jsonObject.getString(CustomerTable.PASSWORD);
			String personnumber = jsonObject.getString(CustomerTable.PERSONNUMBER);
			String telphone = jsonObject.getString(CustomerTable.TELPHONE);
			String realname = jsonObject.getString(CustomerTable.REALNAME);
			String avator = jsonObject.getString(CustomerTable.AVATOR);
			Customer CustomerBean = new Customer(userid, username, password, personnumber, telphone, realname, avator,
					1);
			artistService.AddBean(CustomerBean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	
	/**
	 * 更新艺术家
	 * @param data
	 * @return
	 */
	@RequestMapping(params = "method=updateArtist")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value = "data") String data) {
		try {
			data = URLDecoder.decode(data, "utf-8");
			data = data.substring(1, data.length() - 1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			int id = jsonObject.getInt(CustomerTable.ID);
			Artist customerBean = artistService.GetEntityById(Artist.class, id);
			String userid = jsonObject.getString(CustomerTable.USERID);
			customerBean.setUserid(userid);
			String username = jsonObject.getString(CustomerTable.USERNAME);
			customerBean.setUsername(username);
			String password = jsonObject.getString(CustomerTable.PASSWORD);
			customerBean.setPassword(password);
			String personnumber = jsonObject.getString(CustomerTable.PERSONNUMBER);
			customerBean.setPersonnumber(personnumber);
			String telphone = jsonObject.getString(CustomerTable.TELPHONE);
			customerBean.setTelphone(telphone);
			String realname = jsonObject.getString(CustomerTable.REALNAME);
			customerBean.setRealname(realname);
			String avator = jsonObject.getString(CustomerTable.AVATOR);
			customerBean.setAvator(avator);
			artistService.UpdataBean(customerBean);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "error";
	}

	/**
	 * 获取所有的用户
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params = "method=getallArtist")
	public Map<String, Object> GetAllArtist()
	{
		List<Artist> list = artistService.GetAllBean(Artist.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("Artists", list);
		return map;
	}

	
	/**
	 * 获取艺术家分页
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetArtists")
	public Map<String, Object> JsonGetArtists(@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize){
		Map<String , Object> map = new HashMap<String, Object>();
		List<Artist> list = artistService.GetPageBeanFilter(Artist.class, page, pageSize,CustomerTable.ISARTIST,1+"");
		int total = artistService.GetPageBeanFilterTotal(Artist.class, page, pageSize,CustomerTable.ISARTIST,1+"");
		map.put("list", CustomerVO.ChangeArtistToList(list));
		map.put("total", total);
		return map;
	}
}