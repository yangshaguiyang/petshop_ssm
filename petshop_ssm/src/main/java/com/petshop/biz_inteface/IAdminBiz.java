package com.petshop.biz_inteface;

import java.util.Set;

import com.petshop.model.Admin;

public interface IAdminBiz extends IBaseBiz<Admin> {

	Set<String> getRoleNames(String userName);
	Set<String> getPermissionNames(String userName);
}
