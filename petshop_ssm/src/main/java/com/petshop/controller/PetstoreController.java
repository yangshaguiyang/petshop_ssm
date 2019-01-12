package com.petshop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import com.petshop.biz_inteface.IPetBiz;
import com.petshop.biz_inteface.IPetstoreBiz;
import com.petshop.model.Pet;
import com.petshop.model.Petstore;

@Controller
@RequestMapping(value="/petstore")
public class PetstoreController {
	
	@Resource(name="PetstoreBizImpl")
	IPetstoreBiz ipsb;
	
	@Resource(name="PetBizImpl")
	IPetBiz ipb;
	
	@Resource
	WebApplicationContext wac;
	
	@RequiresPermissions("petStore:view")
    @RequestMapping(value="/list")
	public String petstoreList(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Integer pageSize, Model model) {
		
    	String s_pageSize = wac.getServletContext().getInitParameter("pageSize");
    	pageSize = Integer.parseInt(s_pageSize);
    	
		model.addAttribute("page", ipsb.findByPage(currentPage, pageSize));
		
		return "petstore/petStoreList";
	}
    
	
    @RequestMapping(value="/storePet")
    @ResponseBody
    public List<Pet> storePet(@RequestBody String storeId) {
    	
        int store_Id =Integer.parseInt(storeId.split("=")[1]);
    	List<Pet> list = ipb.selectBystore_Id(store_Id);
    	
    	return list;
    	
    }
    
    @RequiresPermissions("petStore:add")
    @RequestMapping(value="/add",method=RequestMethod.GET)
    public String petstoreAdd() {
    	
    	return "petstore/petStoreAdd";
    }
    
    @RequestMapping(value="/add",method=RequestMethod.POST)
    public String petstoreAdd(Petstore petstore) {
    	
    	ipsb.insertSelective(petstore);
    	
    	return "redirect:/petstore/list";
    }
    
    @RequiresPermissions("petStore:edit")
    @RequestMapping(value="/edit",method=RequestMethod.GET)
    public String petstoreEdit(int id,Model model) {
    	
    	Petstore petstore = ipsb.selectByPrimaryKey(id);
    	model.addAttribute("ps", petstore);
    	
    	return "petstore/petStoreEdit";
    }
    
    @RequestMapping(value="/edit",method=RequestMethod.POST)
    public String petstoreEdit(Petstore petstore) {
    	
    	ipsb.updateByPrimaryKeySelective(petstore);
    	
    	return "redirect:/petstore/list";
    }
    
    @RequiresPermissions("petStore:delete")
    @RequestMapping(value="/del")
    public String petstoreDelete(int id) {
    	
    	ipsb.deleteByPrimaryKey(id);
    	
    	return "redirect:/petstore/list";
    }
}
