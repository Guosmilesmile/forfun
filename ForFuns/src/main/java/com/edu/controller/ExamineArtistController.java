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

import org.aspectj.bridge.IMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.edu.model.Customer;
import com.edu.model.ExamineArtist;
import com.edu.model.Message;
import com.edu.model.User;
import com.edu.service.ICustomerService;
import com.edu.service.IExamineArtistService;
import com.edu.service.IMessageService;
import com.edu.service.IUserService;

@Controller
@RequestMapping("/examineartist.do")
public class ExamineArtistController implements ServletConfigAware,ServletContextAware{
	
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
    
	@Autowired
	private IExamineArtistService examineartistService;
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private  IUserService userService;
	@Autowired
	private  IMessageService messageService;
	

	/**
	 * 获取艺术家审核表分页
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getExamineArtistBypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageExamineArtist(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<ExamineArtist> list = examineartistService.GetPageBeanFilterWhereSugNotEqualOne(ExamineArtist.class, page,
				pageSize,selectname,value);
		int total = examineartistService.GetPageBeanFilterTotal(ExamineArtist.class, page, pageSize, selectname, value);
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 审核艺术家
	 * @param examineartistid
	 * @param situation
	 * @param suggestion
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=alertsituation")
	public String JsonAlertSituation(
			@RequestParam(value="examineartistid")Integer examineartistid,
			@RequestParam(value="situation")Integer situation,
			@RequestParam(value="suggestion")String suggestion){
		ExamineArtist examineartistBean = examineartistService.GetEntityById(ExamineArtist.class, examineartistid);
		Message message=new Message();
		examineartistBean.setSuggestion(Integer.toString(situation));
		String id=customerService.getCustomerIdByUserid(examineartistBean.getUserid().toString());
		Customer customerTo = customerService.GetEntityById(Customer.class, Integer.valueOf(id));
		Customer customerFrom = customerService.GetEntityById(Customer.class, Integer.valueOf(4));
		if(situation==1){
			customerTo.setIsartist(1);
			
			message.setCurrent(new Date());
			message.setFromCustomerBean(customerFrom);
			message.setToCustomerBean(customerTo);
			message.setIsread(0);
			message.setMessage("尊敬的"+customerTo.getUsername()+"，您好，非常感谢您申请成为本站的艺术家，您的申请信息非常具有竞争力，我站决定录用您成为本站的艺术合作伙伴，请尽快完善您的艺术家主页，以便向客户展示您的作品并获得收益。再次感谢您对我公司的信任，祝您未来一切顺利！");
			}
		else {
			examineartistBean.setSuggestion("2");
			customerTo.setIsartist(0);
			message.setCurrent(new Date());
			message.setFromCustomerBean(customerFrom);
			message.setToCustomerBean(customerTo);
			message.setIsread(0);
			message.setMessage("尊敬的"+customerTo.getUsername()+"，您好，非常感谢您申请成为本站的艺术家，您的申请信息非常具有竞争力，然而非常遗憾的是我站未能录用您成为本站的艺术合作伙伴，但我们已经将您的个人信息归入人才库，只要有合适的机会，我们将第一时间通知，再次感谢您对我公司的信任，祝您未来一切顺利，有机会我们再合作！");
			
		}
		try{
			examineartistService.UpdataBean(examineartistBean);
			customerService.UpdataBean(customerTo);
			messageService.AddBean(message);
		}catch(Exception e){
			return "0";
		}
		return "1";
	}
	
	
	
}



