package com.petshop.dao;

import java.util.List;
import java.util.Map;

import com.petshop.model.Petowner;

public interface IPetownerMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Petowner record);

    int insertSelective(Petowner record);

    Petowner selectByPrimaryKey(int id);

    int updateByPrimaryKeySelective(Petowner record);

    int updateByPrimaryKey(Petowner record);
    
    List<Petowner> getAll();
    
    List<Petowner> findByPage(Map<String,Object> map);
    
    Petowner selectByName(String name);
}

