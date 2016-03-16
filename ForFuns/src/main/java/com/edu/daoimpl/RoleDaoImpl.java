package com.edu.daoimpl;


import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.edu.base.BaseDaoImpl;
import com.edu.dao.IRoleDao;
import com.edu.model.Role;

@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<Role> implements IRoleDao{

}
