package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.edu.model.Advert;
import com.edu.model.News;
import com.edu.model.User;
import com.edu.service.IAdvertService;
import com.edu.service.IUserService;
import com.edu.viewentity.AdvertVO;

@Controller
@RequestMapping("/advert.do")
public class AdvertController implements ServletConfigAware,ServletContextAware{
	
	private ServletContext servletContext;  
    @Override  
    public void setServletContext(ServletContext arg0) {  
        this.servletContext = arg0;  
    }  
    private ServletConfig servletConfig;  
    @Override  
    public void setServletConfig(ServletConfig arg0) {  
        this.servletConfig = arg0;  
    }
	@Resource
	private IAdvertService advertService;
	@Resource
	private  IUserService userService;
	@Resource
	private Advert mAdvertBean;
	
	/**
	 * 添加资讯
	 * @param title
	 * @param content
	 * @param author
	 * @param timestart
	 * @param timeout
	 * @param summary
	 * @param money
	 * @param ishot
	 * @param request
	 * @param file
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=AddAdvert")
	public String JsonAddAdvert (@RequestParam(value="title")String title,
			@RequestParam(value="content")String content,@RequestParam(value="author")String author,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout,
			@RequestParam(value="summary")String summary,@RequestParam(value="money")Integer money,
			@RequestParam(value="position")Integer position,HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file
	){
		String filePath = servletContext.getRealPath("/")+"advertupload/";
		String saveUrl  = request.getContextPath() + "/advertupload/";
		System.out.println(filePath);
		File filedir = new File(filePath);
		if(!filedir.exists()){
			filedir.mkdir();
		}
		String ext =file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); ;
		String newfilename = System.currentTimeMillis()+ext;
		String PathAndName = filePath + newfilename;
		saveUrl = saveUrl+newfilename;
		File resultFile = new File(PathAndName);
		try {
			file.transferTo(resultFile);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		User userBean = userService.GetEntityById(User.class, 1);
		Advert advertBean = new Advert(title, summary, author, saveUrl, content, money, position, timestart, timeout,"",userBean);
		try{
			advertService.AddBean(advertBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 获取第1栏广告
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetFirstAdvert")
	public List<AdvertVO> JsonGetFirstAdvert()
	{
		List<Advert> list = advertService.GetFirstAdvert();
		List<AdvertVO> result = AdvertVO.changeToAdvertVOs(list);
		return result;
	}
	
	/**
	 * 获取第2栏广告
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetSecondAdvert")
	public List<AdvertVO> JsonGetSecondAdvert()
	{
		List<Advert> list = advertService.GetSecondAdvert();
		List<AdvertVO> result = AdvertVO.changeToAdvertVOs(list);
		return result;
	}
	
	/**
	 * 获取第3栏广告
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetThirdAdvert")
	public List<AdvertVO> JsonGetThirdAdvert()
	{
		List<Advert> list = advertService.GetThirdAdvert();
		List<AdvertVO> result = AdvertVO.changeToAdvertVOs(list);
		return result;
	}
	
	/**
	 * 通过userid获取分页广告
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetPageAdvertByUserid")
	public Map<String, Object> JsonGetAllAdvertByUserid(@RequestParam(value="userid") String userid,
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value)
	{
		Map<String, String> param = null;
		param = new HashMap<String, String>();
		param.put(selectname, value);
		User userBean = userService.GetBeanByCondition(User.class, "username", userid,null);
		//Map<String, Object> map = mAdvertBean.GetAdvertPage(userBean.getAdvertBeans(), page, pageSize,param);
		Map<String, Object> map = advertService.GetAdvertBeanPageByUserid(userBean.getId()+"", page, pageSize, param);
		return map;
	}
	
	/**
	 * 获取全部分页广告
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getAdvertBypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageAdvert(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Advert> list = advertService.GetPageBeanFilter(Advert.class, page,
				pageSize,selectname,value);
		int total = advertService.GetPageBeanFilterTotal(Advert.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	
	
	/**
	 * 根据id删除广告
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=DeleteAdvert")
	public String JsonDeleteAdvert(@RequestParam(value="ids")String ids){
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			advertService.DeleteBatch(Advert.class, temp);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}
	
	
	/**
	 * 通过id获取广告
	 * @param advertid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetAdvertByid")
	public Map<String,Object> JsonGetAdvertById(@RequestParam(value="advertid")Integer advertid){
		Advert advertBean = advertService.GetEntityById(Advert.class, advertid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("advert", advertBean);
		return map;
	}
	
	
	
	/**
	 * 修改广告
	 * @param advertid
	 * @param title
	 * @param content
	 * @param author
	 * @param timestart
	 * @param timeout
	 * @param summary
	 * @param money
	 * @param position
	 * @param request
	 * @param file
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=AlertAdvert")
	public String JsonAlertAdvert (@RequestParam(value="advertid")Integer advertid,
			@RequestParam(value="title")String title,
			@RequestParam(value="content")String content,@RequestParam(value="author")String author,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout,
			@RequestParam(value="summary")String summary,@RequestParam(value="money")Integer money,
			@RequestParam(value="position")Integer position,HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file
	){
		Advert advertBean = advertService.GetEntityById(Advert.class, advertid);
		
		String filePath = servletContext.getRealPath("/")+"advertupload/";
		String saveUrl  = request.getContextPath() + "/advertupload/";
		System.out.println(filePath);
		File filedir = new File(filePath);
		if(!filedir.exists()){
			filedir.mkdir();
		}
		
		if(file.getSize()>0){
			String ext =file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); ;
			String newfilename = System.currentTimeMillis()+ext;
			String PathAndName = filePath + newfilename;
			saveUrl = saveUrl+newfilename;
			File resultFile = new File(PathAndName);
			advertBean.setImgurl(saveUrl);
			try {
				file.transferTo(resultFile);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		advertBean.setPosition(position);
		advertBean.setTitle(title);
		advertBean.setAuthor(author);
		advertBean.setSummary(summary);
		advertBean.setMoney(money);
		advertBean.setTimestart(timestart);
		advertBean.setTimeout(timeout);
		advertBean.setContent(content);
		advertBean.setSituation(0);
		
		try{
			advertService.UpdataBean(advertBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 修改广告
	 * @param advertid
	 * @param situation
	 * @param suggestion
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=AlertSituation")
	public String JsonAlertSituation(@RequestParam(value="advertid")Integer advertid,@RequestParam(value="situation")Integer situation,@RequestParam(value="suggestion")String suggestion){
		Advert advertBean = advertService.GetEntityById(Advert.class, advertid);
		advertBean.setSituation(situation);
		if(situation==1)
			advertBean.setSuggestion("");
		else {
			advertBean.setSuggestion(suggestion);
		}
		try{
			advertService.UpdataBean(advertBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	
}



