package com.petshop.biz_inteface;

import java.util.List;

import com.petshop.model.Pet;
import com.petshop.model.page.PageBean;

public interface IPetBiz extends IBaseBiz<Pet> {

	List<Pet> selectBystore_Id(int storeId);
	PageBean<Pet> findByPage(int currentPage,int pageSize);
}
