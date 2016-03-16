package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import com.edu.service.IFunctionService;
import com.edu.table.FunctionTable;
import com.edu.table.UserTable;


/**
 * 功能管理controller
 * @author Gy
 *
 */
@Controller
@Lazy(true)
@RequestMapping("/function.do")
public class FunctionController {
	@Resource
	private IFunctionService functionService;

	
	/**
	 * 获取所有的权限
	 * @return
	 */
	@RequestMapping(params="method=getfunction")
	@ResponseBody
	public List<Function> JsonGetAllFunction(){
		//Map<String, Object> map = new HashMap<String, Object>();
		List<Function> list = functionService.GetAllFunction();
		//map.put("list", list);
		return list;
	}
	
	/**
	 * 获取所有的非顶部菜单
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params="method=GetSecondFunction")
	@ResponseBody
	public List<Function> JsonGetAllSecondFunction(){
		//Map<String, Object> map = new HashMap<String, Object>();
		List<Function> list = functionService.GetAllFunction();
		//map.put("list", list);
		return list;
	}
	
	
	/**
	 * 获取权限分页
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@RequestMapping(params="method=getfunctionbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageFunction(@RequestParam(value="page") int page,
			@RequestParam(value="rows") int pageSize){
		Map<String, Object> map = new HashMap<String, Object>();
		List<Function> list = functionService.GetPageBean(Function.class, page, pageSize);
		int total = functionService.GetPageBeanTotal(Function.class);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 添加菜单
	 * @param data
	 * @return
	 */
	@RequestMapping(params="method=addfunction")
	@ResponseBody
	public String JsonAddFunction(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try{
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			String functionname = jsonObject.getString(FunctionTable.FUNCTIONNAME);
			String functionlink = jsonObject.getString(FunctionTable.FUNCTIONLINK);
			Integer istopmenu = jsonObject.getInt(FunctionTable.ISTOPMENU);
			Integer topmenu = jsonObject.getInt(FunctionTable.TOPMUNE);
			Function functionBean  = new Function(functionname, functionlink,istopmenu,topmenu);
			functionService.AddBean(functionBean);
			return "1";
		}catch(Exception e){
			e.printStackTrace();
		}
		return "0";
	}
	
	
	
	/**
	 * 删除菜单
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deletefunction")
	@ResponseBody
	public String JsonDeleteUser(@RequestParam(value = "ids") String ids) {
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			functionService.DeleteBatch(Function.class, temp);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	/**
	 * 更新
	 * @param rowstr
	 * @return
	 */
	@RequestMapping(params="method=updatefunction")
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
		int id = jsonObject.getInt(FunctionTable.ID);
		String functionname = jsonObject.getString(FunctionTable.FUNCTIONNAME);
		String functionlink = jsonObject.getString(FunctionTable.FUNCTIONLINK);
		Integer istopmenu = jsonObject.getInt(FunctionTable.ISTOPMENU);
		Integer topmenu = jsonObject.getInt(FunctionTable.TOPMUNE);
		Function functionBean  = new Function(id,functionname, functionlink,istopmenu,topmenu);
		functionService.UpdataBean(functionBean);
		return "true";
	}
	
	
	/**
	 * 获取所有顶部菜单
	 * @return
	 */
	@RequestMapping(params="method=GetAllTopMenu")
	@ResponseBody
	public List<Function> JsonGetAllTopMenu(){
		List<Function> list = functionService.GetAllTopMenu();
		return list;
	}
	
	/**
	 * 获取所有非顶部菜单
	 * @return
	 */
	@RequestMapping(params="method=GetAllSecondMenu")
	@ResponseBody
	public List<Function> JsonGetAllSecondMenu(){
		List<Function> list = functionService.GetAllSecondMenu();
		return list;
	}
}
