<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="myfn" uri="http://consiste/tags/functions"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<title>宠物列表</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/Public/css/bootstrap.css" />
<script
	src="${pageContext.request.contextPath }/Public/js/jquery-2.1.4.min.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$(".isSure")
				.click(
						function() {
							if (confirm("您是否确定删除本条内容")) {
								location.href = "${pageContext.request.contextPath}/pet/del?id="
										+ $(this).attr("id");
							}
						})
	})
</script>
<style type="text/css">
th,td{
	text-align: center;
}
</style>
</head>
<body>
	<div class="container">
		<table style="width: 80%; margin: 20px auto;"
			class="table table-bordered table-condensed table-hover table-responsive table-striped">
			<caption>
				<h1>宠物列表</h1>
			</caption>
			<tr>
				<th>id</th>
				<th>name</th>
				<th>typeName</th>
				<th>health</th>
				<th>love</th>
				<th>birthday</th>
				<th>owner_Id</th>
				<th>store_Id</th>
				<th>price</th>
				<th>photo</th>
				<th style="width: 140px;">操作</th>
			</tr>
			<tr class="">
				<td colspan="10">&nbsp;</td>
				<td style="text-align: center;">
				<shiro:hasPermission name="pet:add">
				<a
					class="btn btn-sm btn-success"
					href="${pageContext.request.contextPath}/pet/add"> <i
						class="glyphicon glyphicon-plus-sign">增加</i></a>
				</shiro:hasPermission>
			  </td>
			</tr>

			<c:forEach items="${page.lists}" var="pet">
				<tr>
					<td>${pet.id}</td>
					<td>${pet.name }</td>
					<td>${pet.typename}</td>
					<td>${pet.health }</td>
					<td>${pet.love }</td>
					<td>${pet.birthday}</td>
					<td>${pet.ownerId}</td>
					<td>${pet.storeId }</td>
					<td>${pet.price}</td>
					<td><img style="width: 30px;"
						src="${pageContext.request.contextPath }${pet.photo}" /></td>
					<td>
					<shiro:hasPermission name="pet:edit">
					<a class="btn btn-sm btn-success"
						href="${pageContext.request.contextPath}/pet/edit?id=${pet.id}">
							<i class="glyphicon glyphicon-pencil">修改</i>
					</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="pet:delete">
						<button href="javascript:void(0)"
							class="btn btn-sm btn-danger isSure">
							<i class="glyphicon glyphicon-trash">删除</i>
						</button>
					</shiro:hasPermission>
					</td>
				</tr>
			</c:forEach>
		</table>
				<table border="0" cellspacing="0" cellpadding="0" width="900px">
			<tr>
				<td class="td2"><span>总记录数：${page.totalCount }&nbsp;&nbsp;每页显示:${page.pageSize}</span>&nbsp;&nbsp;
					<span>第${page.currPage }/ ${page.totalPage}页</span>&nbsp;&nbsp; <span>
						<c:if test="${page.currPage != 1}">
							<a
								href="${pageContext.request.contextPath }/pet/list?currentPage=1">[首页]</a>&nbsp;&nbsp;
           <a
								href="${pageContext.request.contextPath }/pet/list?currentPage=${page.currPage-1}">[上一页]</a>&nbsp;&nbsp;
           <a
								href="${pageContext.request.contextPath }/pet/list?currentPage=${page.currPage-1}">[${page.currPage-1}]</a>&nbsp;&nbsp;
       </c:if> <a
						href="${pageContext.request.contextPath }/pet/list?currentPage=${page.currPage}"
						style="color: black;">[${page.currPage}]</a>&nbsp;&nbsp; <c:if
							test="${page.currPage != page.totalPage}">
							<a
								href="${pageContext.request.contextPath }/pet/list?currentPage=${page.currPage+1}">[${page.currPage+1}]</a>&nbsp;&nbsp;
           <a
								href="${pageContext.request.contextPath }/pet/list?currentPage=${page.currPage+1}">[下一页]</a>&nbsp;&nbsp;
           <a
								href="${pageContext.request.contextPath }/pet/list?currentPage=${page.totalPage}">[尾页]</a>&nbsp;&nbsp;
       </c:if>
				</span></td>
			</tr>
		</table>
	</div>
	
</body>

</html>