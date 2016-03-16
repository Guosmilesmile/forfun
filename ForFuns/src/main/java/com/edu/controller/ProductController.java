package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.edu.daoimpl.CustomerDaoImpl;
import com.edu.model.Artist;
import com.edu.model.Customer;
import com.edu.model.News;
import com.edu.model.Order;
import com.edu.model.Product;
import com.edu.model.ProductSell;
import com.edu.model.ProductType;
import com.edu.model.SellMethod;
import com.edu.proxy.ProductProxy;
import com.edu.service.IArtistService;
import com.edu.service.ICustomerService;
import com.edu.service.IOrderService;
import com.edu.service.IProductMoneyService;
import com.edu.service.IProductService;
import com.edu.service.IProductTypeService;
import com.edu.service.ISellMethodService;
import com.edu.table.NewsTable;
import com.edu.table.OrderTable;
import com.edu.util.CheckTokenTool;
import com.edu.viewentity.ProductVO;


@Controller
@RequestMapping("/product.do")
public class ProductController implements ServletConfigAware,
ServletContextAware {
	private ServletContext servletContext;

	@Override
	public void setServletContext(ServletContext arg0){
		this.servletContext = arg0;
	}

	private ServletConfig servletConfig;

	@Override
	public void setServletConfig(ServletConfig arg0){
		this.servletConfig = arg0;
	}

	@Autowired
	private IProductService productService;
	
	@Autowired
	private ICustomerService customerService;
	@Autowired
	private ProductProxy productProxy;
	
	@Autowired
	private ISellMethodService sellMethodService;
	@Autowired
	private IProductTypeService productTypeService;
	
	@Autowired
	private IProductMoneyService productMoneyService;
	@Autowired
	private IOrderService orderService;
	@Autowired
	private IArtistService artistService;
	
	/**
	 * 获取分页列表
	 * @param page
	 * @param pageSize
	 * @param selectname
	 * @param value
	 * @return
	 */
	@RequestMapping(params = "method=getProductbypage")
	@ResponseBody
	public Map<String, Object> JsonGetPageProduct(
			@RequestParam(value = "page") int page,
			@RequestParam(value = "rows") int pageSize,
			@RequestParam(value="selectname",defaultValue="id")String selectname,
			@RequestParam(value="value",defaultValue="")String value) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Product> list = productService.GetPageBeanFilter(Product.class, page,
				pageSize,selectname,value);
		List<ProductVO> productVOs = ProductVO.ChangeListProductToProductVo(list);
		int total = productService.GetPageBeanFilterTotal(Product.class, page, pageSize, selectname, value);
		map.put("rows", productVOs);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 购买商品   首先得初始化商品代理类，通过Init函数，Init函数获取该商品对应的出售方法和策略，通过委托的方式，调用buy方法。
	 * @param productid
	 * @param customerid
	 * @param money
	 * @return
	 */
	/*@RequestMapping(params = "method=BuyProduct")
	@ResponseBody
	@Transactional
	public Map<String, Object> JsonBuyProduct(@RequestParam(value="productid")Integer productid,
			@RequestParam(value="customerid")Integer customerid,@RequestParam(value="money")Integer money){
		ProductBean productBean = productService.GetEntityById(ProductBean.class, productid);
		CustomerBean customerBean = customerService.GetEntityById(CustomerBean.class, customerid);
		productProxy.Init(productBean);
		int result = 0;
		try{
			result = productProxy.BuyProduct(customerBean,money,null);
		}catch(Exception e){
			e.printStackTrace();
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result",result);
		return map;
	}*/
	
	/*@RequestMapping(params="method=AlertProduct")
	public String JsonAlertProduct(@RequestParam(value="name")String productname,@RequestParam(value="typename")Integer typeid,
			@RequestParam(value="methodname")Integer methodid,@RequestParam(value="situation")Integer situation,
			@RequestParam(value="timestart")Date timestart,@RequestParam(value="timeout")Date timeout){
		return "";
	}*/
	
	/**
	 * 修改商品状态
	 * @param data
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=AlertProduct")
	public String JsoonAlertProduct(@RequestParam(value="data")String data){
		try {
			data = URLDecoder.decode(data,"utf-8");
			data = data.substring(1,data.length()-1);
			System.out.println(data);
			JSONObject jsonObject = new JSONObject(data);
			Integer id = jsonObject.getInt("id");
			Product productBean = productService.GetEntityById(Product.class, id);
			String name = jsonObject.getString("name");
			productBean.setName(name);
			Integer typeid = jsonObject.getInt("typeid");
			Integer methodid = jsonObject.getInt("methodid");
			SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			Date timestart = sdf.parse(jsonObject.getString("timestart"));
			productBean.setTimestart(timestart);
			Date timeout = sdf.parse(jsonObject.getString("timeout"));
			productBean.setTimeout(timeout);
			SellMethod sellMethodBean = sellMethodService.GetEntityById(SellMethod.class, methodid);
			productBean.getProductSellBean().setSellMethodBean(sellMethodBean);
			//System.out.println(productBean.getProductSellBean().getSellMethodBean().getName());
			ProductType productTypeBean = productTypeService.GetEntityById(ProductType.class, typeid);
			productBean.setProductTypeBean(productTypeBean);
			productService.UpdataBean(productBean);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "0";
	}
	
	/**
	 * 获取上线对应分类商品
	 * @param page
	 * @param pageSize
	 * @param typeid
	 * @param methodid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetOnlineProduct")
	public Map<String, Object> JsonGetOnlineNews(@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize,
			@RequestParam(value="typeid")Integer typeid,@RequestParam(value="methodid")Integer methodid){
		Map<String , Object> map = new HashMap<String, Object>();
		List<Product> list = productService.getOnlineProduct(page, pageSize, typeid,methodid);
		int total = productService.getOnlineProductTotal(typeid,methodid);
		List<ProductVO> productVOs = ProductVO.ChangeListProductToProductVo(list);
		map.put("list", productVOs);
		map.put("total", total);
		return map;
	}
	
	/**
	 * 获取对应艺术家的所有商品
	 * @param page
	 * @param pageSize
	 * @param artistid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetArtistProduct")
	public Map<String, Object> JsonGetArtitsProducts(@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize,
			@RequestParam(value="artistid")Integer artistid){
		Map<String , Object> map = new HashMap<String, Object>();
		//System.out.println("at getArtistProduct s");
		//System.out.println(page+" + "+pageSize+" + "+artistid);
		List<Product> list = productService.getArtistProduct(page, pageSize, artistid);
		//System.out.println("\r\nThe result of getArtistProduct");
		//System.out.println("at getArtistProduct f");
		int total = productService.getArtistProductTotal(artistid);
		List<ProductVO> productVOs = ProductVO.ChangeListProductToProductVo(list);
		map.put("list", productVOs);
		map.put("total", total);
		System.out.println(total);
		return map;
	}
	
	/**
	 * 根据id获取商品
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetProductById")
	public Map<String, Object> JsonGetProductById(@RequestParam(value="productid")Integer id){
		Map<String , Object> map = new HashMap<String, Object>();
		ProductVO productVO = null;
		Product productBean = productService.GetEntityById(Product.class, id);
		if(null!=productBean){
			productVO = new ProductVO(productBean);
			//productVO.setAddmoney(productMoneyService.getMaxMoney(productBean.getId()).getMoney());
		}

		map.put("product",productVO);
		return map;
	}
	
	/**
	 * 通过口令判断是否是有订单
	 * @param id
	 * @param useridtoken
	 * @return
	 */
	/*@RequestMapping(params="method=AddOrder")
	public String AddOrder(@RequestParam(value="productid")Integer id,@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			@RequestParam(value="address")String address,@RequestParam(value="telephone")String telephone){
		if("".equals(useridtoken))//未登陆
			return "redirect:/font/Login.jsp?error=2";
		boolean flag = CheckTokenTool.CheckToken(useridtoken);
		if(!flag)
			return "redirect:/font/Login.jsp?error=2";
		String userid = CheckTokenTool.GetUserid(useridtoken);
		CustomerBean customerBean = null;
		ProductBean productBean = null;
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			customerBean =  customerService.getCustomerByUserId(userid);
			productBean = productService.GetEntityById(ProductBean.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==customerBean)
			return "redirect:/font/error.jsp";
		int respons = 0;
		try {
			params.put(OrderTable.TELEPHONE, telephone);
			params.put(OrderTable.ADDRESS, address);
			productProxy.Init(productBean);
			respons =productProxy.BuyProduct(customerBean, productBean.getMoney(),params);
			//respons =  orderService.AddOrder(id, customerBean.getId(), address, telephone);
		} catch (Exception e) {
			e.printStackTrace();
		}
		//return 3;//添加成功
		//return 1;//不属于该用户的订单
		//return 2;//属于该用户的订单
		//return 0;//添加失败
		if(respons==0){
			return "redirect:/font/error.jsp";
		}else if(respons==1){
			return "redirect:/font/error.jsp?errorid=1";
		}else if(respons==2){
			return "redirect:/font/goodsdetail.jsp?productid="+id;
		}else if(respons==3){
			return "redirect:/font/success.jsp";
		}
		return "redirect:/font/error.jsp";
	}*/
	
	/**
	 * 登陆后添加订单
	 * @param useridtoken
	 * @param id
	 * @param addressid
	 * @param addmoney
	 * @return
	 */
	@RequestMapping(params="method=AddOrder")
	public String CheckLoginAddOrder(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			@RequestParam(value="productid")Integer id,@RequestParam(value="addressid",required=false,defaultValue="")Integer addressid,
			@RequestParam(value="addmoney",required=false,defaultValue="0")Integer addmoney){
		String userid = CheckTokenTool.GetUserid(useridtoken);
		Customer customerBean = null;
		Product productBean = null;
		Map<String, Object> params = new HashMap<String, Object>();
		try {
			customerBean =  customerService.getCustomerByUserId(userid);
			productBean = productService.GetEntityById(Product.class, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==customerBean)
			return "redirect:/font/error.jsp";
		String respons = "redirect:/font/error.jsp";
		try {
			params.put("addressid", addressid);
			params.put("addmoney", addmoney);
			productProxy.Init(productBean);
			respons =productProxy.BuyProduct(customerBean, productBean.getMoney(),params);
			System.out.println(respons);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return respons;
	}
	
	/**
	 * 检测用户是否存在相应的订单。
	 * @param id
	 * @param useridtoken
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=checkOrder")
	public String jsonCheckOrder(@RequestParam(value="productid")Integer id,@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken){
		if("".equals(useridtoken)||null==useridtoken)//未登陆
			return "0";
		boolean flag = CheckTokenTool.CheckToken(useridtoken);
		if(!flag)
			return "0";//未登录
		String userid = CheckTokenTool.GetUserid(useridtoken);
		Customer customerBean = null;
		try {
			customerBean =  customerService.getCustomerByUserId(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Order orderBean = null;
		try {
			orderBean  = orderService.getOrderByProductId(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(null==orderBean)
			return "1";//不存在这个订单
		if(!userid.equals(orderBean.getCustomerBean().getUserid())){
			return "3";//订单与用户不符合
		}
		return "2";//订单与用户相符
	}
	
	/**
	 * 验证登录后进入发布页面 
	 * @param useridtoken
	 * @return
	 */
	@RequestMapping(params="method=EnterPublish")
	public String CheckLoginPublish(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken){
		return "/font/Publish.jsp";
	}
	
	/**
	 * 登录后发布商品
	 * @param useridtoken
	 * @param request
	 * @param file
	 * @param imgone
	 * @param imgtwo
	 * @param imgthree
	 * @param productname
	 * @param money
	 * @param typeid
	 * @param sellid
	 * @param starttime
	 * @param endtime
	 * @param content
	 * @return
	 */
	@RequestMapping(params="method=PublishProduct")
	public String CheckLoginAddProduct(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,HttpServletRequest request,
			@RequestParam(value = "imgurl", required = true) MultipartFile file,@RequestParam(value = "imgone", required = true) MultipartFile imgone,
			@RequestParam(value = "imgtwo", required = true) MultipartFile imgtwo,@RequestParam(value = "imgthree", required = true) MultipartFile imgthree,
			@RequestParam(value="productname")String productname,@RequestParam(name="money")Double money,@RequestParam(name="typeid")Integer typeid,
			@RequestParam(value="sellid")Integer sellid,@RequestParam(value="starttime")String starttime,@RequestParam(value="endtime")String endtime,
			@RequestParam(value="content",required=false,defaultValue="商家并没有更多描述喵~")String content){
		
		Product productBean = new Product();
		try {
			Customer customerBean = customerService.getCustomerByUserId(CheckTokenTool.GetUserid(useridtoken));
			productBean.setArtistBean(new Artist(customerBean));
		} catch (Exception e2) {
			e2.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setName(productname);
		productBean.setMoney(money);
		try  {  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = sdf.parse(starttime); 
		    productBean.setTimestart(date);
		}  catch (ParseException e)  {  
		    System.out.println(e.getMessage());  
		    return "redirect:/font/error.jsp?";
		}  
		try  {  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = sdf.parse(endtime); 
		    productBean.setTimeout(date);
		}  catch (ParseException e)  {  
		    System.out.println(e.getMessage());  
		    return "redirect:/font/error.jsp?";
		}  
		productBean.setContent(content);
		productBean.setProductTypeBean(productTypeService.GetEntityById(ProductType.class, typeid));
		
		
		String filePath = servletContext.getRealPath("/") + "avatorupload/";
		String saveUrl = request.getContextPath() + "/avatorupload/";
		System.out.println(filePath);
		File filedir = new File(filePath);
		if (!filedir.exists()){
			filedir.mkdir();
			return "redirect:/font/error.jsp?";
		}
		String ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String newfilename = System.currentTimeMillis() + ext;
		String PathAndName = filePath + newfilename;
		saveUrl = saveUrl + newfilename;
		File resultFile = new File(PathAndName);
		try{
			file.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setImgurl(saveUrl);
		ext = imgone.getOriginalFilename().substring(imgone.getOriginalFilename().lastIndexOf("."));
		newfilename = System.currentTimeMillis() + ext;
		PathAndName = filePath + newfilename;
		saveUrl = request.getContextPath() + "/avatorupload/";
		saveUrl = saveUrl + newfilename;
		resultFile = new File(PathAndName);
		try{
			imgone.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setImgone(saveUrl);
		ext = imgtwo.getOriginalFilename().substring(imgtwo.getOriginalFilename().lastIndexOf("."));
		newfilename = System.currentTimeMillis() + ext;
		PathAndName = filePath + newfilename;
		saveUrl = request.getContextPath() + "/avatorupload/";
		saveUrl = saveUrl + newfilename;
		resultFile = new File(PathAndName);
		try{
			imgtwo.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		
		productBean.setImgtwo(saveUrl);
		ext = imgthree.getOriginalFilename().substring(imgthree.getOriginalFilename().lastIndexOf("."));
		newfilename = System.currentTimeMillis() + ext;
		PathAndName = filePath + newfilename;
		saveUrl = request.getContextPath() + "/avatorupload/";
		saveUrl = saveUrl + newfilename;
		resultFile = new File(PathAndName);
		try{
			imgthree.transferTo(resultFile);
		} catch (IOException e1){
			e1.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setImgthree(saveUrl);
		ProductSell productSellBean = new ProductSell();
		productSellBean.setSellMethodBean(sellMethodService.GetEntityById(SellMethod.class, sellid));
		productSellBean.setProductBean(productBean);
		productBean.setProductSellBean(productSellBean);
		productBean.setSituation(0);
		productService.AddBean(productBean);
		return "redirect:/font/success.jsp?successid=2";
		
	}
	
	/**
	 * 检验权限后进入修改页面
	 * @param useridtoken
	 * @param id
	 * @return
	 */
	@RequestMapping(params="method=enterAlertProduct")
	public String CheckLoginEnterAlertProduct(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			@RequestParam(value="id")Integer id){
		return "redirect:/font/AlertProduct.jsp?id="+id;
	}

	/**
	 * 登陆后修改商品详情
	 * @param useridtoken
	 * @param request
	 * @param id
	 * @param file
	 * @param imgone
	 * @param imgtwo
	 * @param imgthree
	 * @param productname
	 * @param money
	 * @param typeid
	 * @param sellid
	 * @param starttime
	 * @param endtime
	 * @param content
	 * @return
	 */
	@RequestMapping(params="method=checkAlertProduct")
	public String CheckLoginAlertProduct(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			HttpServletRequest request,@RequestParam(value="id")Integer id,@RequestParam(value = "imgurl", required = false) MultipartFile file,@RequestParam(value = "imgone", required = false) MultipartFile imgone,
			@RequestParam(value = "imgtwo", required = false) MultipartFile imgtwo,@RequestParam(value = "imgthree", required = false) MultipartFile imgthree,
			@RequestParam(value="productname")String productname,@RequestParam(name="money")Double money,@RequestParam(name="typeid")Integer typeid,
			@RequestParam(value="sellid")Integer sellid,@RequestParam(value="starttime")String starttime,@RequestParam(value="endtime")String endtime,
			@RequestParam(value="content")String content){
		Product productBean = productService.GetEntityById(Product.class, id);
		try {
			Artist artist = artistService.getArtistByUserId(CheckTokenTool.GetUserid(useridtoken));
			productBean.setArtistBean(artist);
		} catch (Exception e2) {
			e2.printStackTrace();
			return "redirect:/font/error.jsp?";
		}
		productBean.setName(productname);
		productBean.setMoney(money);
		try  {  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = sdf.parse(starttime); 
		    productBean.setTimestart(date);
		}  catch (ParseException e)  {  
		    System.out.println(e.getMessage());  
		    return "redirect:/font/error.jsp?";
		}  
		try  {  
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		    Date date = sdf.parse(endtime); 
		    productBean.setTimeout(date);
		}  catch (ParseException e)  {  
		    System.out.println(e.getMessage());  
		    return "redirect:/font/error.jsp?";
		}  
		productBean.setContent(content);
		ProductType productType = productTypeService.GetEntityById(ProductType.class, typeid);
		productBean.setProductTypeBean(productType);
		
		String ext ="";
		String filePath = servletContext.getRealPath("/") + "avatorupload/";
		String saveUrl = request.getContextPath() + "/avatorupload/";
		String newfilename = System.currentTimeMillis() + ext;
		String PathAndName = filePath + newfilename;
		
		if(!(file.isEmpty())){
			System.out.println(filePath);
			File filedir = new File(filePath);
			if (!filedir.exists()){
				filedir.mkdir();
				return "redirect:/font/error.jsp?";
			}
			ext = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			
			saveUrl = saveUrl + newfilename;
			File resultFile = new File(PathAndName);
			try{
				file.transferTo(resultFile);
			} catch (IOException e1){
				e1.printStackTrace();
				return "redirect:/font/error.jsp?";
			}
			productBean.setImgurl(saveUrl);
		}
		if(!(imgone.isEmpty())){
			ext = imgone.getOriginalFilename().substring(imgone.getOriginalFilename().lastIndexOf("."));
			newfilename = System.currentTimeMillis() + ext;
			PathAndName = filePath + newfilename;
			saveUrl = saveUrl + newfilename;
			File resultFile = new File(PathAndName);
			try{
				imgone.transferTo(resultFile);
			} catch (IOException e1){
				e1.printStackTrace();
				return "redirect:/font/error.jsp?";
			}
			productBean.setImgone(saveUrl);
		}
		if(!(imgtwo.isEmpty())){
			ext = imgtwo.getOriginalFilename().substring(imgtwo.getOriginalFilename().lastIndexOf("."));
			newfilename = System.currentTimeMillis() + ext;
			PathAndName = filePath + newfilename;
			saveUrl = saveUrl + newfilename;
			File resultFile = new File(PathAndName);
			try{
				imgtwo.transferTo(resultFile);
			} catch (IOException e1){
				e1.printStackTrace();
				return "redirect:/font/error.jsp?";
			}
		}
		
		if(!(imgthree.isEmpty())){
			productBean.setImgtwo(saveUrl);
			ext = imgthree.getOriginalFilename().substring(imgthree.getOriginalFilename().lastIndexOf("."));
			newfilename = System.currentTimeMillis() + ext;
			PathAndName = filePath + newfilename;
			saveUrl = saveUrl + newfilename;
			File resultFile = new File(PathAndName);
			try{
				imgthree.transferTo(resultFile);
			} catch (IOException e1){
				e1.printStackTrace();
				return "redirect:/font/error.jsp?";
			}
			productBean.setImgthree(saveUrl);
		}
		
		ProductSell productSellBean = productBean.getProductSellBean();
		productSellBean.setSellMethodBean(sellMethodService.GetEntityById(SellMethod.class, sellid));
		productBean.setProductSellBean(productSellBean);
		productService.UpdataBean(productBean);
		return "redirect:/font/success.jsp?successid=2";
	}
	
	/**
	 * 获取艺术家的分页商品
	 * @param useridtoken
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping(params="method=GetArtistProducts")
	public Map<String, Object> getArtistProduct(@CookieValue(value = "useridtoken", required = false,defaultValue="") String useridtoken,
			@RequestParam(value="page")Integer page,@RequestParam(value="pageSize")Integer pageSize){
		Map<String , Object> map = new HashMap<String, Object>();
		String customerUserid = CheckTokenTool.GetUserid(useridtoken);
		if(null==customerUserid)
			return null;
		String artistid = customerService.getCustomerIdByUserid(customerUserid);
		List<Product> list = productService.getArtistProduct(page, pageSize, Integer.parseInt(artistid));
		Integer total = productService.getArtistProductTotal(Integer.parseInt(artistid));
		map.put("list", ProductVO.ChangeListProductToProductVo(list));
		map.put("total", total);
		return map;
	}
}
