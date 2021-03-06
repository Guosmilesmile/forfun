package com.edu.daoimpl;


import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;



import java.util.Set;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.edu.dao.IUserDao;
import com.edu.model.News;
import com.edu.model.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-hibernate.xml","classpath:spring.xml","classpath:spring-mvc.xml"}) 
public class UserDaoImplTest {

	@Autowired
	private IUserDao userDao;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	}

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testGetAll(){
		//List<UserBean> list  = userDao.getAllEntity(UserBean.class);
		//UserBean userBean = list.get(0);
		//System.out.println(userBean.getNewsBeans().iterator().next().getTitle());
		userDao.TestNamedQuery();
	}
	
	@Test
	public void testsave() {
		User user = new User();
		user.setUsername("1111111111");
		userDao.addEntity(user);
	}
	
	@Test
	public void testgetObjectbyRequir(){
		Map<String, String> require = new HashMap<String, String>();
		require.put("username", "222");
		try {
			Object object = userDao.getObjectbyRequir(User.class, require );
			System.out.println(object);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testgetObjectbysql(){
		Map<String, String> require = new HashMap<String, String>();
		require.put("username", "222");
		try {
			Object object = userDao.sqlWithObject("select id from u_user where username=123456");
			System.out.println(object);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testDeleteBatch(){
		int[] Ids = new int[2];
		Ids[0] = 39;
		Ids[1] = 40;
		try {
			userDao.deleteBatch(User.class, Ids );
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
