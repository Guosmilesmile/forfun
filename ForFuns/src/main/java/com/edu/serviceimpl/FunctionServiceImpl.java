package com.edu.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edu.base.BaseServiceImpl;
import com.edu.dao.IFunctionDao;
import com.edu.model.Function;
import com.edu.service.IFunctionService;
@Lazy(true)
@Transactional
@Service("functionService")
public class FunctionServiceImpl extends BaseServiceImpl<Function> implements IFunctionService {
	@Resource
	private IFunctionDao functionDao;
	
	public List<Function> GetAllFunction(){
		return functionDao.getAllEntity(Function.class);
	}

	@Override
	public List<Function> GetAllTopMenu() {
		return functionDao.GetAllTopMenu();
	}

	@Override
	public List<Function> GetAllSecondMenu() {
		return functionDao.GetAllSecondMenu();
	}

}
