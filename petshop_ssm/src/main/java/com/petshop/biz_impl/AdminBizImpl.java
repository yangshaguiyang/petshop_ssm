package com.petshop.biz_impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.petshop.biz_inteface.IAdminBiz;
import com.petshop.dao.IAdminMapper;
import com.petshop.dao.IMenuMapper;
import com.petshop.dao.IRoleMapper;
import com.petshop.model.Admin;
import com.petshop.model.Menu;
import com.petshop.model.Role;
import com.petshop.util.PasswordHelper;

@Service("AdminBizImpl")
public class AdminBizImpl implements IAdminBiz {

	@Resource
	IAdminMapper adminDao;
	@Resource
	IRoleMapper roleDao;
	@Resource
	IMenuMapper menuDao;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return adminDao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Admin t) {
		// TODO Auto-generated method stub
		return adminDao.insert(t);
	}

	@Override
	public int insertSelective(Admin t) {
		
		PasswordHelper helper = new PasswordHelper();
		helper.encryptPassword(t);
		return adminDao.insertSelective(t);
	}

	@Override
	public Admin selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Admin> getAll() {
		// TODO Auto-generated method stub
		return adminDao.getAll();
	}

	@Override
	public int updateByPrimaryKeySelective(Admin t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Admin t) {
		// TODO Auto-generated method stub
		return adminDao.updateByPrimaryKey(t);
	}


	@Override
	public Admin selectByName(String name) {
		// TODO Auto-generated method stub
		return adminDao.selectByName(name);
	}

	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Set<String> getRoleNames(String userName) {
		
		Set<String> roleNames = new HashSet<String>();
		Admin admin = adminDao.selectByName(userName);
		String roleid = admin.getRoleid();
		String[] roleids = roleid.split(",");
		for(int i = 0;i<roleids.length;i++) {
			
			Role role = roleDao.selectByPrimaryKey(Integer.parseInt(roleids[i]));
			roleNames.add(role.getName());
		}
		
		return roleNames;
	}

	@Override
	public Set<String> getPermissionNames(String userName) {
		
		Set<String> permissionNames = new HashSet<String>();
		Admin admin = adminDao.selectByName(userName);
		String roleid = admin.getRoleid();
		String[] roleids = roleid.split(",");
		for(int i = 0;i<roleids.length;i++) {
			
			Role role = roleDao.selectByPrimaryKey(Integer.parseInt(roleids[i]));
			String resourceid = role.getResouceid();
			String[] resourceids = resourceid.split(",");
			for(int j = 0;j<resourceids.length;j++) {
				Menu menu = menuDao.selectByPrimaryKey(Integer.parseInt(resourceids[j]));
					permissionNames.add(menu.getPermission());
				
			}
			
		}
		return permissionNames;
	}

    
	
}
