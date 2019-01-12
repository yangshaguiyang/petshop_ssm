package com.petshop.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.petshop.biz_inteface.IAdminBiz;
import com.petshop.biz_inteface.IMenuBiz;
import com.petshop.model.Menu;
import com.petshop.model.menu.SysMenu;

@Controller
@RequestMapping(value = "/Resource")
public class ResourceController {

	@Resource(name = "MenuBizImpl")
	IMenuBiz imb;

	@Resource(name="AdminBizImpl")
	IAdminBiz iab;

	@RequestMapping(value = "/getMenu", method = RequestMethod.GET)
	@ResponseBody
	public List<SysMenu> getMenu() {
	    Subject subject = SecurityUtils.getSubject();
	    String userName = (String) subject.getPrincipal();
		return imb.getMenu(iab.getPermissionNames(userName));
	}

	@RequiresPermissions("manage:menu")
	@RequestMapping(value = "/menuList", method = RequestMethod.GET)
	public String menuList(Model model) {

		model.addAttribute("menus", imb.getAll());

		return "/menu/menuList";
	}

	@RequestMapping(value = "/menuDelete", method = RequestMethod.GET)
	public String menuDelete(HttpServletRequest request, Model model) {

		String s_id = request.getParameter("id");
		List<Integer> list = imb.getMenusId(Integer.parseInt(s_id));
		for (int i = 0; i <list.size(); i++) {
			imb.deleteByPrimaryKey(list.get(i));
		}
		return menuList(model);
	}

	@RequestMapping(value = "/menuAddEdit", method = RequestMethod.GET)
	public String menuAddEdit(HttpServletRequest request, Model model) {
		String path = "";
		if (request.getMethod().equalsIgnoreCase("get")) {

			String s_pid = request.getParameter("pid");
			String s_id = request.getParameter("id");
			if (s_id == null) {

				int pid = Integer.parseInt(s_pid);
				if (pid == 0) {

					path = "/menu/menuAdd_edit";
				} else {
					Menu menu = new Menu();
					menu.setPid(pid);
					model.addAttribute("menu", menu);
					path = "/menu/menuAdd_edit";
				}
			} else {
				int id = Integer.parseInt(s_id);
				Menu menu = imb.selectByPrimaryKey(id);
				model.addAttribute("menu", menu);
				path = "/menu/menuAdd_edit";
			}
		}
		return path;
	}

	@RequestMapping(value = "/menuAddEdit", method = RequestMethod.POST)
	public String menuAddEdit(HttpServletRequest request, HttpServletRequest response, Model model) {
		
		String path = "";
		String text = request.getParameter("name");
		String pid = request.getParameter("pid");
		String sort = request.getParameter("sort");
		String ishide = request.getParameter("ishide");
		String s_id = request.getParameter("id");
		String href = request.getParameter("href");
		String permission = request.getParameter("permission");
		Menu menu = new Menu();
		menu.setText(text);
		menu.setPid(Integer.parseInt(pid));
		menu.setSort(Integer.parseInt(sort));
		menu.setHref(href);
		menu.setPermission(permission);
		menu.setIshide(Integer.parseInt(ishide));
		if (s_id == "") {
			imb.insertSelective(menu);
		} else {
			menu.setId(Integer.parseInt(s_id));
			imb.updateByPrimaryKeySelective(menu);
		}
		path = menuList(model);

		return path;
	}

}
