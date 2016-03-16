package com.edu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;

/**
 * 图片上传管理controller
 * @author Gy
 *
 */
@Controller
@Lazy(true)
@RequestMapping("/imageupload.do")
public class ImageUploadController implements ServletConfigAware,ServletContextAware{
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
	
    /**
     * 图片上传
     * @param request
     * @param response
     * @param file
     * @return
     */
    @ResponseBody
	@RequestMapping(params="method=keuploadimg")
	public String Jsonuploadimage(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "imgFile", required = false) MultipartFile file){
		String filePath = servletContext.getRealPath("/")+"newsupload/";
		String saveUrl  = request.getContextPath() + "/newsupload/";
		System.out.println(filePath);
		System.out.println(saveUrl);
		File filedir = new File(filePath);
		if(!filedir.exists()){
			filedir.mkdir();
		}
		try {
			String ext =file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")); ;
			String newfilename = System.currentTimeMillis()+ext;
			String PathAndName = filePath + newfilename;
			saveUrl = saveUrl+newfilename;
			File resultFile = new File(PathAndName);
			file.transferTo(resultFile);
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("error", 0);
			jsonObject.put("url", saveUrl);
			return (jsonObject.toJSONString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("error", 1);
		jsonObject.put("message", "上传失败!");
		return (jsonObject.toJSONString());
	}

}
