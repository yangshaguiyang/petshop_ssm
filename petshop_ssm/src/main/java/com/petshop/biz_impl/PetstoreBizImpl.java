package com.petshop.biz_impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.petshop.biz_inteface.IPetstoreBiz;
import com.petshop.dao.IPetstoreMapper;
import com.petshop.model.Petstore;
import com.petshop.model.page.PageBean;
@Service("PetstoreBizImpl")
public class PetstoreBizImpl implements IPetstoreBiz {
 
	@Resource
	IPetstoreMapper ipsm;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return ipsm.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Petstore t) {
		// TODO Auto-generated method stub
		return ipsm.insert(t);
	}

	@Override
	public int insertSelective(Petstore t) {
		// TODO Auto-generated method stub
		return ipsm.insert(t);
	}

	@Override
	public Petstore selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return ipsm.selectByPrimaryKey(id);
	}

	@Override
	public List<Petstore> getAll() {
		// TODO Auto-generated method stub
		return ipsm.getAll();
	}

	@Override
	public int updateByPrimaryKeySelective(Petstore t) {
		// TODO Auto-generated method stub
		return ipsm.updateByPrimaryKeySelective(t);
	}

	@Override
	public int updateByPrimaryKey(Petstore t) {
		// TODO Auto-generated method stub
		return ipsm.updateByPrimaryKey(t);
	}

	@Override
	public Petstore selectByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PageBean<Petstore> findByPage(int currentPage, int pageSize) {
		
		PageBean<Petstore> pageBean = new PageBean();
		List<Petstore> lists = new ArrayList<Petstore>();
		
		pageBean.setCurrPage(currentPage);
		pageBean.setPageSize(pageSize);
		
		int totalCount = ipsm.getAll().size();
		pageBean.setTotalCount(totalCount);
		
		double tc = totalCount;
		int totalPage = (int) Math.ceil(tc/pageSize);
		pageBean.setTotalPage(totalPage);
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", pageBean.getPageSize());
		
		lists = ipsm.findByPage(map);
		pageBean.setLists(lists);
		
		return pageBean;
	}

}
