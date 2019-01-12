package com.petshop.biz_inteface;

import com.petshop.model.Role;
import com.petshop.model.page.PageBean;

public interface IRoleBiz extends IBaseBiz<Role> {

	PageBean<Role> findByPage(int currentpage,int pageSize);
}
