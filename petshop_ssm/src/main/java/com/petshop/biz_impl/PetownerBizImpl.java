package com.petshop.biz_impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.petshop.biz_inteface.IPetownerBiz;
import com.petshop.dao.IPetownerMapper;
import com.petshop.model.Petowner;
import com.petshop.model.page.PageBean;

@Service("PetownerBizImpl")
public class PetownerBizImpl implements IPetownerBiz {

	@Resource
	IPetownerMapper ipom;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return ipom.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(Petowner t) {
		// TODO Auto-generated method stub
		return ipom.insert(t);
	}

	@Override
	public int insertSelective(Petowner t) {
		// TODO Auto-generated method stub
		return ipom.insertSelective(t);
	}

	@Override
	public Petowner selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return ipom.selectByPrimaryKey(id);
	}

	@Override
	public List<Petowner> getAll() {
		// TODO Auto-generated method stub
		return ipom.getAll();
	}

	@Override
	public int updateByPrimaryKeySelective(Petowner t) {
		// TODO Auto-generated method stub
		return ipom.updateByPrimaryKeySelective(t);
	}

	@Override
	public int updateByPrimaryKey(Petowner t) {
		// TODO Auto-generated method stub
		return ipom.updateByPrimaryKey(t);
	}

	@Override
	public Petowner selectByName(String name) {
		// TODO Auto-generated method stub
		return ipom.selectByName(name);
	}

	@Override
	public PageBean<Petowner> findByPage(int currentPage,int pageSize) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		PageBean<Petowner> pb = new PageBean<Petowner>();
		
		pb.setCurrPage(currentPage);
		
		pb.setPageSize(pageSize);
		
		int totalCount = ipom.getAll().size();
		pb.setTotalCount(totalCount);
		
		double tc = totalCount;
		int totalPage = (int) Math.ceil(tc/pageSize);
		pb.setTotalPage(totalPage);
		
		map.put("start", (currentPage-1)*pageSize);
		map.put("size", pb.getPageSize());
		
		List<Petowner> lists = ipom.findByPage(map);
		pb.setLists(lists);
		
		
		return pb;
	}

	@Override
	public boolean checkName(String name) {
		// TODO Auto-generated method stub
		return  ipom.selectByName(name)==null;
	}


}
