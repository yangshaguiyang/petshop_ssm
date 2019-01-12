package com.petshop.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.WebApplicationContext;

import com.petshop.biz_inteface.IMenuBiz;
import com.petshop.biz_inteface.IRoleBiz;
import com.petshop.model.Menu;
import com.petshop.model.Role;

@Controller
@RequestMapping(value="/role")
public class RoleController {

	@Resource(name="RoleBizImpl")
	IRoleBiz irb;
	
	@Resource(name="MenuBizImpl")
	IMenuBiz imb;
	
	@Resource
	WebApplicationContext wac;
	
	@RequiresPermissions("manage:role")
	@RequestMapping(value="/list")
	public String roleList(@RequestParam(value="currentPage",defaultValue="1",required=false)int currentPage,Integer pageSize,Model model) {
		
		String s_pageSize = wac.getServletContext().getInitParameter("pageSize");
		pageSize = Integer.parseInt(s_pageSize);
		model.addAttribute("page", irb.findByPage(currentPage, pageSize));
		
		return "/role/roleList";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String roleAdd(Model model) {
		
		List<Menu> menus = imb.getAll();
		model.addAttribute("menus", menus);
		return "/role/roleAdd";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.GET)
	public String roleEdit(int id,Model model) {
		
		Role role = irb.selectByPrimaryKey(id);
		model.addAttribute("role", role);
		
		List<Menu> menus = imb.getAll();
		model.addAttribute("menus", menus);
		return "/role/roleEdit";
	}
	
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public String roleAdd(Role role) {
		
		irb.insertSelective(role);
		
		return "redirect:/role/list";
	}
	
	@RequestMapping(value="/edit",method=RequestMethod.POST)
	public String roleEdit(Role role) {
		
		irb.updateByPrimaryKeySelective(role);
		
		return "redirect:/role/list";
	}
	
	@RequestMapping(value="/del")
	public String roleDelete(int id) {
		
		irb.deleteByPrimaryKey(id);
		
		return "redirect:/role/list";
	}
}
