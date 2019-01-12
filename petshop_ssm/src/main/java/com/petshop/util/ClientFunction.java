package com.petshop.util;

import javax.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Autowired;
import com.petshop.biz_inteface.IPetownerBiz;
public class ClientFunction {
	
	@Autowired
    private IPetownerBiz ipb; 
    
	private static ClientFunction function;
	
	@PostConstruct
	public void init() {
		function =this;
		function.ipb=this.ipb;
	}
    
	public static String getPetownerName(int ownerId) {
		
		String name = function.ipb.selectByPrimaryKey(ownerId).getName();
		
		return name;
	}
	
	
	
}