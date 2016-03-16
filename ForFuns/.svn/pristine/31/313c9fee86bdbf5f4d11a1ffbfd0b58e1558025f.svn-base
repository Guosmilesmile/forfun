package com.edu.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IFunctionDao;
import com.edu.model.FunctionBean;
import com.edu.service.IFunctionService;
@Lazy(true)
@Transactional
@Service("functionService")
public class FunctionServiceImpl extends BaseServiceImpl<FunctionBean> implements IFunctionService {
	@Resource
	private IFunctionDao functionDao;
	
	public List<FunctionBean> GetAllFunction(){
		return functionDao.getAllEntity(FunctionBean.class);
	}

	/*@Override
	public List<FunctionBean> GetPageFunction(int page, int pageSize) {
		return functionDao.getPageEntity(FunctionBean.class,page, pageSize);
	}*/
}
