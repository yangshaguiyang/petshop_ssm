package com.petshop.dao;

import java.util.List;
import java.util.Map;

import com.petshop.model.Petstore;

public interface IPetstoreMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Petstore record);

    int insertSelective(Petstore record);

    Petstore selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Petstore record);

    int updateByPrimaryKey(Petstore record);
    
    List<Petstore> findByPage(Map<String,Object> map);
    
    List<Petstore> getAll();
}