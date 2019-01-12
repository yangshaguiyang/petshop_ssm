package com.petshop.dao;

import java.util.List;

import com.petshop.model.Admin;

public interface IAdminMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Admin record);

    int insertSelective(Admin record);

    Admin selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
    
    Admin selectByName(String name);
    
    List<Admin> getAll();
}