package com.petshop.biz_impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.petshop.biz_inteface.IRoleBiz;
import com.petshop.dao.IRoleMapper;
import com.petshop.model.Role;
import com.petshop.model.page.PageBean;

@Service("RoleBizImpl")
public class RoleBizImpl implements IRoleBiz {

	IRoleMapper dao;

	@Resource
	public void setDao(IRoleMapper dao) {
		this.dao = dao;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return dao.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Role t) {
		// TODO Auto-generated method stub
		return dao.insert(t);
	}

	@Override
	public int insertSelective(Role t) {
		// TODO Auto-generated method stub
		return dao.insertSelective(t);
	}

	@Override
	public Role selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return dao.selectByPrimaryKey(id);
	}

	@Override
	public List<Role> getAll() {
		// TODO Auto-generated method stub
		return dao.getAll();
	}

	@Override
	public int updateByPrimaryKeySelective(Role t) {
		// TODO Auto-generated method stub
		return dao.updateByPrimaryKeySelective(t);
	}

	@Override
	public int updateByPrimaryKey(Role t) {
		// TODO Auto-generated method stub
		return dao.updateByPrimaryKey(t);
	}

	@Override
	public Role selectByName(String name) {
		// TODO Auto-generated method stub
		return dao.selectByName(name);
	}

	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PageBean<Role> findByPage(int currentPage, int pageSize) {
		
		PageBean<Role> pageBean = new PageBean<Role>();
		
		pageBean.setCurrPage(currentPage);
		pageBean.setPageSize(pageSize);
		
		int totalCount = dao.getAll().size();
		pageBean.setTotalCount(totalCount);
		
		double tc = totalCount;
		int totalPage = (int) Math.ceil(tc/pageSize);
		pageBean.setTotalPage(totalPage);
		
		Map<String,Object> map = new HashMap<String,Object>();
        map.put("start", (currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        
        List<Role> lists = dao.findByPage(map);
        pageBean.setLists(lists);
		
		return pageBean;
	}


}
