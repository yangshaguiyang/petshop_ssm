package com.petshop.dao;

import java.util.List;
import com.petshop.model.Menu;

public interface IMenuMapper {
	
    int deleteByPrimaryKey(Integer id);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer id);
    
    List<Menu> selectByPid(int pid);
    
    List<Menu> getAll();

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    
    Menu selectByName(String name);
    
}