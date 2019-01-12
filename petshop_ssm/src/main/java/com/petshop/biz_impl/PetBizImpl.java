package com.petshop.biz_impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.petshop.biz_inteface.IPetBiz;
import com.petshop.dao.IPetMapper;
import com.petshop.model.Pet;
import com.petshop.model.page.PageBean;

@Service("PetBizImpl")
public class PetBizImpl implements IPetBiz {

	IPetMapper ipm;

	@Resource
	public void setIpm(IPetMapper ipm) {
		this.ipm = ipm;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return ipm.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Pet t) {
		// TODO Auto-generated method stub
		return ipm.insert(t);
	}

	@Override
	public int insertSelective(Pet t) {
		// TODO Auto-generated method stub
		return ipm.insertSelective(t);
	}

	@Override
	public Pet selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return ipm.selectByPrimaryKey(id);
	}

	@Override
	public List<Pet> getAll() {
		// TODO Auto-generated method stub
		return ipm.getAll();
	}

	@Override
	public int updateByPrimaryKeySelective(Pet t) {
		// TODO Auto-generated method stub
		return ipm.updateByPrimaryKeySelective(t);
	}

	@Override
	public int updateByPrimaryKey(Pet t) {
		// TODO Auto-generated method stub
		return ipm.updateByPrimaryKey(t);
	}

	@Override
	public Pet selectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Pet> selectBystore_Id(int storeId) {
		// TODO Auto-generated method stub
		return ipm.selectBystore_Id(storeId);
	}

	@Override
	public PageBean<Pet> findByPage(int currentPage, int pageSize) {

		PageBean<Pet> pageBean = new PageBean<Pet>();
		pageBean.setCurrPage(currentPage);
		pageBean.setPageSize(pageSize);

		int totalCount = ipm.getAll().size();
		pageBean.setTotalCount(totalCount);

		double tc = totalCount;
		int totalPage = (int) Math.ceil(tc / pageSize);
		pageBean.setTotalPage(totalPage);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (currentPage - 1) * pageSize);
		map.put("size", pageBean.getPageSize());
		List<Pet> lists = ipm.findByPage(map);
		pageBean.setLists(lists);

		return pageBean;
	}

}
