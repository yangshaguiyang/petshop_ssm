<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>添加宠物商店</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/Public/css/bootstrap.css" />
<script
	src="${pageContext.request.contextPath }/Public/js/jquery-2.1.4.min.js"
	type="text/javascript" charset="utf-8"></script>
<style type="text/css">
td, th {
	text-align: center;
}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/petstore/edit"
		method="post">
		<table style="width: 80%; margin: 20px auto;"
			class="table table-bordered table-hover table-responsive table-striped">
			<caption style="text-align: center;">
				<h1>修改宠物商店</h1>
			</caption>
			<tr>

				<td><a href="javascript:void(0)" onclick="history.go(-1);"
					class="btn btn-default btn-sm"><span class="">回到主页</span></a></td>
			</tr>
			<tr>
				<td><label>name</label>
				<input type="hidden" name="id" value="${ps.id }" />
				<input type="text" name="name"
					value="${ps.name}" placeholder="请输入姓名" /></td>
			</tr>
			<tr>
				<td><label>password</label> <input type="text" name="password"
					value="${ps.password}" placeholder="请输入密码" /></td>
			</tr>
			<tr>
				<td><label>balance</label> <input type="text" name="balance"
					value="${ps.balance}" placeholder="请输入积分" /></td>
			</tr>
			<tr>
				<td><a href="javascript:void(0)"
					onclick="$('form')[0].submit();" class="btn btn-danger btn-sm"><span
						class="glyphicon glyphicon-arrow-up">提交数据</span></a></td>
			</tr>
		</table>
	</form>
</body>
</html>