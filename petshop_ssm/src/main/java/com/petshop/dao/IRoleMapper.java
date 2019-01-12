package com.petshop.dao;

import java.util.List;
import java.util.Map;

import com.petshop.model.Role;

public interface IRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> getAll();
    
    Role selectByName(String name);
    
    List<Role> findByPage(Map<String,Object> map);
}