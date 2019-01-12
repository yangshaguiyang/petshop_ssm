<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>添加宠物主人</title>
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
<script type="text/javascript">
	function addPetOwner() {
		$("tr:last").clone().appendTo($("table"));
	}
</script>
</head>
<body>
	<form
		action="${pageContext.request.contextPath }/petowner/edit"
		method="post">
		<table style="width: 80%; margin: 20px auto;"
			class="table table-bordered table-hover table-responsive table-striped">
			<caption style="text-align: center;">
				<h1>宠物主人编辑</h1>
			</caption>
			<tr>
				<td><label>姓名</label> <input type="hidden" name="id"
					value="${petowner.id}" /> <input type="text" name="name" id="name"
					value="${petowner.name}" placeholder="请输入姓名" /><span id="tip"></span></td>
			</tr>
			<tr>

				<td><label>密码</label> <input type="text" name="password"
					value="${petowner.password}" placeholder="请输入密码" /></td>
			</tr>
			<tr>

				<td><label>金币</label><input type="text" name="money"
					value="${petowner.money}" placeholder="请输入积分" /></td>
			</tr>
			<tr>
				<td style="display:none"><a href="" class="btn btn-success btn-sm"><span
						class="glyphicon glyphicon-pencil">修改</span></a> <a href=""
					class="btn btn-danger btn-sm"><span
						class="glyphicon glyphicon-trash">删除</span></a></td>
			</tr>
			<tr>
				<td><a href="javascript:void(0)" onclick="history.go(-1);"
					class="btn btn-default btn-sm"><span class="">回到主页</span></a>
			<a href="javascript:void(0)"
					onclick="$('form')[0].submit();" class="btn btn-danger btn-sm"><span
						class="glyphicon glyphicon-arrow-up">提交数据</span></a></td>
			</tr>
		</table>
	</form>
	<script>
		/* $(function() {

			$("#name")
					.blur(
							function() {
								if ($(this).val() != '') {
									$
											.post(
													"${pageContext.request.contextPath }/PetOwnerServlet?method=checkPetOwnerName",
													{
														name : $(this).val()
													},
													function(data) {

														$("#tip")
																.html(
																		data == "true" ? "该名字可以使用"
																				: "该名字已存在");
													})
								} else {
									$("#tip").html("姓名不能为空");
								}

							})
		}) */
	</script>
</body>
</html>