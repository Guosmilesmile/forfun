package com.edu.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.edu.dao.ICustomerDao;
import com.edu.dao.IProductDao;
import com.edu.model.Customer;
import com.edu.model.Order;
import com.edu.model.Product;
import com.edu.model.User;
import com.edu.service.ICustomerService;
import com.edu.service.IOrderService;
import com.edu.service.IProductService;
import com.edu.service.IUserService;
import com.edu.table.OrderTable;
import com.edu.table.UserTable;
import com.edu.viewentity.OrderVO;

@Controller
@RequestMapping("/order.do")
public class OrderController
{
	@Resource
	private IOrderService orderService;
	@Resource
	private ICustomerService customerService;
	@Resource
	private IProductService productService;
	
	/**
	 * 获取订单分页列表
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getOrderbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageOrder(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) 
	{
		Map<String, Object> map = new HashMap<String, Object>();
		List<Order> list = orderService.GetPageBeanFilter(Order.class, page,
				pageSize,selectname,value);
		int total = orderService.GetPageBeanFilterTotal(Order.class, page, pageSize, selectname, value);
		List<OrderVO> listVO = OrderVO.ChangeListProductToOrderVo(list);
		
		map.put("rows", listVO);
		map.put("total", total);
		return map;
	}

	
	/**
	 * 删除订单
	 * @param ids
	 * @return
	 */
	@RequestMapping(params = "method=deleteOrder")
	@ResponseBody
	public String JsonDeleteOrder(@RequestParam(value = "ids") String ids) {
		String[] id = ids.split(",");
		int[] temp = new int[id.length];
		for (int i = 0; i < id.length; i++) {
			temp[i] = Integer.parseInt(id[i]);
		}
		try {
			orderService.DeleteBatch(Order.class, temp);
			return "true";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	/**
	 * 添加订单
	 * @param data
	 * @return
	 */
	@RequestMapping(params="method=addOrder")
	@ResponseBody
	public int JsonAddOrder(@RequestParam(value="data") String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		try {
			//data = URLDecoder.decode(data, "utf-8");
			DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			Date current = df.parse(jsonObject.getString(OrderTable.CURRENT));
			String address = jsonObject.getString(OrderTable.ADDRESS);
			Integer customerid = jsonObject.getInt(OrderTable.CUSTOMERID);
			Integer productid = jsonObject.getInt(OrderTable.PRODUCTID);
			String telephone = jsonObject.getString(OrderTable.TELEPHONE);
			Integer ispay = jsonObject.getInt(OrderTable.ISPAY);
			
			Customer customerBean = customerService.GetEntityById(Customer.class, customerid);
			Product productBean = productService.GetEntityById(Product.class, productid);
			
			//OrderBean orderBean = new OrderBean(telephone, address, current, ispay, productBean, customerBean);
			//orderService.AddBean(orderBean);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	/**
	 * 更新订单
	 * @param data
	 * @return
	 * @throws JSONException
	 * @throws ParseException
	 */
	@RequestMapping(params="method=updateOrder")
	@ResponseBody
	public String JsonUpdate(@RequestParam(value="data") String data) throws JSONException, ParseException{
		try {
			data = URLDecoder.decode(data,"utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		data = data.substring(1,data.length()-1);
		DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
		System.out.println(data);
		JSONObject jsonObject = new JSONObject(data);
		Integer id = jsonObject.getInt("id");
		Date current = df.parse(jsonObject.getString(OrderTable.CURRENT));
		String address = jsonObject.getString(OrderTable.ADDRESS);
		Integer customerid = jsonObject.getInt(OrderTable.CUSTOMERID);
		Integer productid = jsonObject.getInt(OrderTable.PRODUCTID);
		String telephone = jsonObject.getString(OrderTable.TELEPHONE);
		Integer ispay = jsonObject.getInt(OrderTable.ISPAY);
		
		Customer customerBean = customerService.GetEntityById(Customer.class, customerid);
		Product productBean = productService.GetEntityById(Product.class, productid);
		
		Order orderBean = orderService.GetEntityById(Order.class, id);
		
		//orderBean.setAddress(address);
		orderBean.setCurrent(current);
		orderBean.setCustomerBean(customerBean);
		orderBean.setIspay(ispay);
		orderBean.setProductBean(productBean);
		//orderBean.setTelephone(telephone);
		
		orderService.UpdataBean(orderBean);
		return "true";
	}
	
	/**
	 * 获取所有的订单
	 * @return
	 */
	
	@ResponseBody
	@RequestMapping(params="method=getAllOrder")
	public Map<String, Object> GetAllOrder(){
		List<Order> list = orderService.GetAllBean(Order.class);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("orders", list);
		return map;
	}
	
	/**
	 * 通过CutomerUserid获取订单 
	 * @param customerUserId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=getCustomerOrder")
	public Map<String , Object> JsonGetCustomerOrder(@RequestParam(value="customeruserid")String customerUserId){
		List<Order> list = orderService.getCusertomerOrder(customerUserId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", OrderVO.ChangeListProductToOrderVo(list));
		return map;
	}
	
	/**
	 * 进入我的订单
	 * @param useridtoken
	 * @return
	 */
	@RequestMapping(params="method=EnterMyOrder")
	public String CheckLoginEnterMyOrder(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken){
		return "font/OrderList.jsp";
	}
	
	/**
	 * 进入订单详情
	 * @param useridtoken
	 * @param id
	 * @return
	 */
	@RequestMapping(params="method=EnterOrderDetail")
	public String CheckLoginEnterOrderDetail(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,@RequestParam(value="id")Integer id){
		return "font/OrderDetail.jsp?id="+id;
	}
	
	/**
	 * 通过id获取订单
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetOrderByid")
	public Map<String, Object> JsonGetOrderbyId(@RequestParam(value="id")Integer id){
		Order orderBean = orderService.GetEntityById(Order.class, id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", new OrderVO(orderBean));
		return map;
	}
	
	/**
	 * 通过id删除订单
	 * @param useridtoken
	 * @param id
	 * @return
	 */
	@RequestMapping(params="method=DeleteOrderByid")
	public String CheckLoginGetOrderbyId(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,@RequestParam(value="id")Integer id){
		try {
			orderService.DeleteByid(Order.class,id);
		} catch (Exception e) {
			e.printStackTrace();
			return "font/error.jsp?errorid=2";
		}
		return "redirect:/font/success.jsp?successid=1";
	}
}
