package com.edu.serviceimpl;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.edu.model.User;
import com.edu.service.IUserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-hibernate.xml","classpath:spring.xml","classpath:spring-mvc.xml"}) 
public class UserServiceImplTest {
	
	@Autowired
	private IUserService userService;

	@Test
	public void testSave() {
		User user = new User();
		user.setUsername("428");
		userService.save(user);
	
	}
	
	/*@Autowired
	private IUserDao userdao;
	
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
	public void testSave() {
		UserBean user = new UserBean();
		user.setId(2);
		user.setUsername("428");
		userdao.addEntity(user);
		int  i = 5/0;
		user = new UserBean();
		user.setId(4);
		user.setUsername("888");
		userdao.addEntity(user);
	}
	
	@Test
	public void testDeleteByid(){
		userdao.deleteEntitybyId(UserBean.class,2);
	}
	
	@Test
	public void testselectAll(){
		List<Object> list = userdao.getAllEntity(UserBean.class);
		UserBean user = (UserBean) list.get(0);
		Set<UserRoleBean> set = user.getUserRoleBeans();
		Iterator<UserRoleBean> it = set.iterator();
		while(it.hasNext()){
			UserRoleBean userrole  = (UserRoleBean) it.next();
			System.out.println(userrole.getRole().getRolename());
		}
		
	}
	
	@Test
	public void testgetall(){
		List<Object> list = userdao.getAllEntity(UserBean.class);
		System.out.println(list.size());
		UserBean user =(UserBean)list.get(0);
		System.out.println(user.getPassword());
	}
	@Test
	public void testsql(){
		String sql = "select * from u_user";
		List<Object> list = userdao.sqlWithList(sql,UserBean.class);
		System.out.println(list.size());
		UserBean user =(UserBean)list.get(0);
		user.setPassword("77777");
		userdao.addEntity(user);
		System.out.println(user);
	}
	
	@Test
	public void testnopsql(){
		String sql = "insert into u_user values(4,'222','222')";
		userdao.sqlWithNone(sql);
	}
	
	@Test
	public void testgetObjectbyRequir(){
		Map<String, String> paramater = new HashMap<String, String>();
		paramater.put("username", "111");
		try {
			UserBean user = (UserBean) userdao.getObjectbyRequir(UserBean.class, paramater);
			System.out.println(user.getId());
			user.setPassword("66666");
			userdao.updateEntity(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
}
