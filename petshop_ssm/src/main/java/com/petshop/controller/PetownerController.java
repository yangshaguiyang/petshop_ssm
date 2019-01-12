package com.petshop.controller;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.WebApplicationContext;

import com.petshop.biz_inteface.IPetownerBiz;
import com.petshop.model.Petowner;

@Controller
@RequestMapping(value="/petowner")
public class PetownerController {

	@Resource(name="PetownerBizImpl")
	IPetownerBiz ipob;
	
	@Resource
	WebApplicationContext wac;
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	@RequiresPermissions("petOwner:view")
	public String petownerPage(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Integer pageSize,Model model) {
		
		String s_pageSize = wac.getServletContext().getInitParameter("pageSize");
		pageSize = Integer.parseInt(s_pageSize);
		
		model.addAttribute("page", ipob.findByPage(currentPage,pageSize));
		
		return "petowner/petOwnerList";
	}
	
	@RequiresPermissions("petOwner:add")
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String petownerAdd() {
		
		return "petowner/petOwnerAdd";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String petownerAdd(Petowner petowner,HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		ipob.insertSelective(petowner);
		
		return "redirect:/petowner/list";
		
	}
	
	@RequiresPermissions("petOwner:edit")
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String petownerEdit(int id,Model model) {
		
		Petowner petowner = ipob.selectByPrimaryKey(id);
		model.addAttribute("petowner", petowner);
		
		return "petowner/petOwnerEdit";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String petownerEdit(Petowner petowner) {
		
		ipob.updateByPrimaryKeySelective(petowner);
		
		return "redirect:/petowner/list";
	}
	
	@RequiresPermissions("petOwner:delete")
	@RequestMapping(value="/del",method=RequestMethod.GET)
	public String petownerDelete(int id) {
		
		ipob.deleteByPrimaryKey(id);
		
		return "redirect:/petowner/list";
	}
	
	@RequestMapping(value="/checkName")
	@ResponseBody
	public boolean checkPetownerName(@RequestBody String name) {
		
		return ipob.checkName(name);
	}
	
}
