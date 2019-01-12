package com.petshop.biz_inteface;

import com.petshop.model.Petowner;
import com.petshop.model.page.PageBean;

public interface IPetownerBiz extends IBaseBiz<Petowner> {

	PageBean<Petowner> findByPage(int currentPage,int pageSize);
}
