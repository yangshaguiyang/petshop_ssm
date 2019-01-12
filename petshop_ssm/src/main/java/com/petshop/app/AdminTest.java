package com.petshop.app;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.petshop.biz_inteface.IAdminBiz;
import com.petshop.model.Admin;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({
	"classpath:applicationContext.xml"
})
@WebAppConfiguration
public class AdminTest {

	@Resource(name="AdminBizImpl")
	IAdminBiz iab;
	
	@Test
	public void addAdmin() {
		
		Admin admin = new Admin();
		admin.setName("杨莎");
		admin.setPassword("123456");
		admin.setRoleid("2");
		
		iab.insertSelective(admin);
	}
}
