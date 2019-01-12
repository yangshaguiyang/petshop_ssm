package com.petshop.dao;

import java.util.List;
import java.util.Map;

import com.petshop.model.Pet;

public interface IPetMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Pet record);

    int insertSelective(Pet record);

    Pet selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Pet record);

    int updateByPrimaryKey(Pet record);
    
    List<Pet> getAll();
    
    List<Pet> getPager(Map<String,Integer> map);
    
    List<Pet> selectBystore_Id(int storeId);
    
    List<Pet> findByPage(Map<String,Object> map);
}