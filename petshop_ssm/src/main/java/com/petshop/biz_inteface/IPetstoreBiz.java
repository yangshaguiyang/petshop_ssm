package com.petshop.biz_inteface;

import com.petshop.model.Petstore;
import com.petshop.model.page.PageBean;

public interface IPetstoreBiz extends IBaseBiz<Petstore> {

	PageBean<Petstore> findByPage(int currentPage,int pageSize);
}
