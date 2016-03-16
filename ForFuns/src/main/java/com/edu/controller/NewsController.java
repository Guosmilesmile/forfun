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
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.edu.model.News;
import com.edu.model.User;
import com.edu.service.INewsService;
import com.edu.service.IUserService;
import com.edu.table.NewsTable;
import com.edu.viewentity.NewsVO;

@Controller
@RequestMapping("/news.do")
public class NewsController implements ServletConfigAware,ServletContextAware{
	
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
	private INewsService newsService;
	@Resource
	private  IUserService userService;

	/**
	 * 添加资讯
	 * @param userid
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
	@RequestMapping(params="method=addnews")
	public String JsonAddNews (@RequestParam(value="userid")String userid,@RequestParam(value="title")String title,
			@RequestParam(value="content")String content,@RequestParam(value="author")String author,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout,
			@RequestParam(value="summary")String summary,@RequestParam(value="money")Integer money,
			@RequestParam(value="ishot")Integer ishot,HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file
	){
		String filePath = servletContext.getRealPath("/")+"newsupload/";
		String saveUrl  = request.getContextPath() + "/newsupload/";
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
		User userBean = userService.GetBeanByCondition(User.class, "username", userid,null);
		News newsBean = new News(title, summary, author, saveUrl, content, money, ishot, timestart, timeout,"",userBean);
		try{
			newsService.AddBean(newsBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 通过userid获取分页资讯
	 * @param userid
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getpagenewsbyuserid")
	public Map<String, Object> JsonGetAllNewsByUserid(@RequestParam(value="userid") String userid,
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value){
		Map<String, String> param = null;
		param = new HashMap<String, String>();
		param.put(selectname, value);
		User userBean = userService.GetBeanByCondition(User.class, "username", userid,null);
		//Map<String, Object> map = mNewsBean.GetNewsPage(userBean.getNewsBeans(), page, pageSize,param);
		Map<String, Object> map = newsService.GetNewsBeanPageByUserid(userBean.getId()+"", page, pageSize, param);
		return map;
	}

	/**
	 * 获取全部分页资讯
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getNewsBypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageNews(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<News> list = newsService.GetPageBeanFilter(News.class, page,
				pageSize,selectname,value);
		int total = newsService.GetPageBeanFilterTotal(News.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	
	
	/**
	 * 删除资讯
	 * @param ids
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=deletenews")
	public String JsonDeleteNews(@RequestParam(value="ids")String ids){
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			newsService.DeleteBatch(News.class, temp);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		
	}
	
	
	/**
	 * 通过id获取资讯
	 * @param newsid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getnewsbyid")
	public Map<String,Object> JsonGetNewsById(@RequestParam(value="newsid")Integer newsid){
		News newsBean = newsService.GetEntityById(News.class, newsid);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("news", newsBean);
		return map;
	}
	
	/**
	 * 修改资讯
	 * @param newsid
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
	@RequestMapping(params="method=alertnews")
	public String JsonAlertNews (@RequestParam(value="newsid")Integer newsid,@RequestParam(value="title")String title,
			@RequestParam(value="content")String content,@RequestParam(value="author")String author,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout,
			@RequestParam(value="summary")String summary,@RequestParam(value="money")Integer money,
			@RequestParam(value="ishot")Integer ishot,HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file
	){
		News newsBean = newsService.GetEntityById(News.class, newsid);
		
		String filePath = servletContext.getRealPath("/")+"newsupload/";
		String saveUrl  = request.getContextPath() + "/newsupload/";
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
			newsBean.setImgurl(saveUrl);
			try {
				file.transferTo(resultFile);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		newsBean.setIshot(ishot);
		newsBean.setTitle(title);
		newsBean.setAuthor(author);
		newsBean.setSummary(summary);
		newsBean.setMoney(money);
		newsBean.setTimestart(timestart);
		newsBean.setTimeout(timeout);
		newsBean.setContent(content);
		newsBean.setSituation(0);
		
		try{
			newsService.UpdataBean(newsBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 修改资讯状态
	 * @param newsid
	 * @param situation
	 * @param suggestion
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=alertsituation")
	public String JsonAlertSituation(@RequestParam(value="newsid")Integer newsid,@RequestParam(value="situation")Integer situation,@RequestParam(value="suggestion")String suggestion){
		News newsBean = newsService.GetEntityById(News.class, newsid);
		newsBean.setSituation(situation);
		if(situation==1)
			newsBean.setSuggestion("");
		else {
			newsBean.setSuggestion(suggestion);
		}
		try{
			newsService.UpdataBean(newsBean);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	/**
	 * 获取热点资讯
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetHotNew")
	public List<News> JsonGetHotNew(){
		return newsService.GetHotNews();
	}

	/**
	 * 获取上线资讯
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetOnlineNews")
	public Map<String, Object> JsonGetOnlineNews(@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize){
		Map<String , Object> map = new HashMap<String, Object>();
		//List<NewsBean> list = newsService.GetPageBeanFilter(NewsBean.class,page,pageSize, NewsTable.ISONLINE, 1+"");
		//int total = newsService.GetPageBeanFilterTotal(NewsBean.class, page, pageSize,NewsTable.ISONLINE, 1+"");
		List<News> list = newsService.GetPageBeanFilterMore(News.class, page, pageSize, NewsTable.ISONLINE, 1+"", NewsTable.SITUATION, 1+"");
		int total = newsService.GetPageBeanFilterMoreTotal(News.class, page, pageSize, NewsTable.ISONLINE, 1+"", NewsTable.SITUATION, 1+"");
		map.put("list", list);
		map.put("total", total);
		return map;
	}
	
}



