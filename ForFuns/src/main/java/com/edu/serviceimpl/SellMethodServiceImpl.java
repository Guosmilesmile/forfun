package com.edu.serviceimpl;

import org.springframework.stereotype.Service;

import com.edu.base.BaseServiceImpl;
import com.edu.model.SellMethod;
import com.edu.service.ISellMethodService;

@Service("sellMethodService")
public class SellMethodServiceImpl extends BaseServiceImpl<SellMethod> implements ISellMethodService{

}
