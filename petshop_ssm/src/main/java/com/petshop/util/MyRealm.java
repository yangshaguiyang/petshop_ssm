package com.petshop.util;

import javax.annotation.Resource;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import com.petshop.biz_inteface.IAdminBiz;
import com.petshop.model.Admin;

public class MyRealm  extends AuthorizingRealm{

	@Resource
	IAdminBiz iab;
	//授权
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		String userName = (String) principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.setRoles(iab.getRoleNames(userName));
		simpleAuthorizationInfo.setStringPermissions(iab.getPermissionNames(userName));
		return simpleAuthorizationInfo;
	}

	//认证
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		
		String username = (String) token.getPrincipal();
		Admin admin = iab.selectByName(username);
		
		SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
				
				admin.getName(),
		        admin.getPassword(),
				ByteSource.Util.bytes(admin.getCredentialsSalt()),
				getName()
	   );
		return authenticationInfo;
	}

}
