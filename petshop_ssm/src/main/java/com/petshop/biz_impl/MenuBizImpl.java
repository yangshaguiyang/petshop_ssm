package com.petshop.biz_impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.shiro.authz.permission.WildcardPermission;
import org.springframework.stereotype.Service;

import com.petshop.biz_inteface.IMenuBiz;
import com.petshop.dao.IMenuMapper;
import com.petshop.dao.IRoleMapper;
import com.petshop.model.Menu;
import com.petshop.model.Role;
import com.petshop.model.menu.SysMenu;

@Service("MenuBizImpl")
public class MenuBizImpl implements IMenuBiz {
    
	@Resource
	IMenuMapper menuDao;
	
	@Resource
	IRoleMapper roleDao;
	

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return menuDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Menu t) {
		// TODO Auto-generated method stub
		return menuDao.insert(t);
	}

	@Override
	public int insertSelective(Menu t) {
		// TODO Auto-generated method stub
		return menuDao.insertSelective(t);
	}

	@Override
	public Menu selectByPrimaryKey(int id) {

		return menuDao.selectByPrimaryKey(id);
	}

	@Override
	public List<Menu> getAll() {
		// TODO Auto-generated method stub
		return menuDao.getAll();
	}

	@Override
	public int updateByPrimaryKeySelective(Menu t) {
		// TODO Auto-generated method stub
		return menuDao.updateByPrimaryKeySelective(t);
	}

	@Override
	public int updateByPrimaryKey(Menu t) {
		// TODO Auto-generated method stub
		return menuDao.updateByPrimaryKey(t);
	}

	@Override
	public List<Menu> selectByPid(int pid) {

		return menuDao.selectByPid(pid);
	}

	@Override
	public List<SysMenu> getMenu(Set<String> permissions) {
		List<SysMenu> menuList = new ArrayList<SysMenu>();

		List<Menu> menus = menuDao.selectByPid(0);
		for (Menu item : menus) {
			    if(hasPermission(permissions,item)) {
			    	menuList.add(getChildMenus(item.getId(),permissions));
			    }
				
			
		}
		return menuList;
	}

	private SysMenu getChildMenus(int menuId,Set<String> permissions) {
		SysMenu menus = new SysMenu();

		Menu menu = menuDao.selectByPrimaryKey(menuId);
		menus.setHref(menu.getHref());
		menus.setText(menu.getText());
		menus.setId(menu.getId());

		List<SysMenu> nodes = new ArrayList<SysMenu>();

		List<Menu> childMenus = menuDao.selectByPid(menuId);
		for (Menu childItem : childMenus) {
			  if(hasPermission(permissions,childItem)) {
				nodes.add(getChildMenus(childItem.getId(),permissions));
			  }
		}
		menus.setNodes(nodes);

		return menus;
	}


	private boolean hasPermission(Set<String> permissions,Menu menu) {
		
		if(menu.getPermission()==null||menu.getPermission().isEmpty()){
			return true;
		}
	    
		if(permissions.contains(menu.getPermission())) {
			return true;
		}
		return false;
	}
	
	@Override
	public Menu selectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Integer> getMenusId(int id) {
		
		List<Integer> list = new ArrayList<Integer>();
		Menu menu = menuDao.selectByPrimaryKey(id);
		list.add(id);
		List<Menu> menus = menuDao.selectByPid(id);
		for(int i = 0;i<menus.size();i++) {
			
			List<Integer> menusId = getMenusId(menus.get(i).getId());
			list.addAll(menusId);
		}
		return list;
	}


}
