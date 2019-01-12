package com.petshop.biz_inteface;

import java.util.List;

public interface IBaseBiz<T> {

	int deleteByPrimaryKey(Integer id);

	int insert(T t);

	int insertSelective(T t);

	T selectByPrimaryKey(int id);

	List<T> getAll();

	int updateByPrimaryKeySelective(T t);

	int updateByPrimaryKey(T t);

	T selectByName(String name);
	
	boolean checkName(String name);

}
