package com.petshop.biz_inteface;

import java.util.List;
import java.util.Set;

import com.petshop.model.Menu;
import com.petshop.model.menu.SysMenu;

public interface IMenuBiz extends IBaseBiz<Menu> {

	  List<Menu> selectByPid(int pid);
	  List<SysMenu> getMenu(Set<String> permissions);
	  List<Integer> getMenusId(int id);
}
