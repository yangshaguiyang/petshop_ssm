<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>宠物主人列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Public/css/bootstrap.css"/>
<script src="${pageContext.request.contextPath}/Public/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	td,th{
		text-align: center;
	}
</style>
<script type="text/javascript">
    $(function(){
    	$(".beSure").click(function(){
    		if(confirm("确认删除吗?")) {
    		    location.href="${pageContext.request.contextPath }/petowner/del?id="+$(this).attr("id");
    		}
    	})
    })
</script>
</head>
<body>
    <div class="container">
    	<table style="width: 80%;margin: 20px auto;" class="table table-bordered table-hover table-responsive table-striped">
    		<caption style="text-align: center;"><h1>宠物主人列表</h1></caption>
    		<tr>
    			<th>id</th>
    			<th>name</th>
    			<th>password</th>
    			<th>money</th>
    			<th style="width: 140px;">操作</th>
    		</tr>
    		<tr>
    			<td colspan="4">&nbsp;</td>
    			<td>
    				<a 
    				<shiro:hasPermission name="petOwner:add">
    				href="${pageContext.request.contextPath }/petowner/add"
    				</shiro:hasPermission>
    				class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus">增加</span>
    				</a>
    			</td>
    		</tr>
    		
    		 <c:forEach items="${page.lists}" var="petowner">
    		  <tr>
    		  	<td>${petowner.id }</td>
    		  	<td>${petowner.name }</td>
    		  	<td>${petowner.password }</td>
    		  	<td>${petowner.money }</td>
    		  	<td>
    		  		<a 
    		  		<shiro:hasPermission name="petOwner:edit">
    		  		href="${pageContext.request.contextPath }/petowner/edit?id=${petowner.id }" 
    		  		</shiro:hasPermission>
    		  		class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pencil">修改</span></a>
    		  	    <a href="javascript:void(0)" id="${petowner.id }"  class="btn btn-danger btn-sm 
    		  	    <shiro:hasPermission name='petOwner:delete'>
    		  	    beSure
    		  	    </shiro:hasPermission>
    		  	    "><span class="glyphicon glyphicon-trash" >删除</span></a>
    		  	</td>
    		  </tr>
    		 </c:forEach>
    	</table>
    	<table  border="0" cellspacing="0" cellpadding="0"  width="900px">
 <tr>
<td class="td2">
   <span>总记录数：${page.totalCount }&nbsp;&nbsp;每页显示:${page.pageSize}</span>&nbsp;&nbsp;
   <span>第${page.currPage }/ ${page.totalPage}页</span>&nbsp;&nbsp;
   <span>
       <c:if test="${page.currPage != 1}">
           <a href="${pageContext.request.contextPath }/petowner/list?currentPage=1">[首页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petowner/list?currentPage=${page.currPage-1}">[上一页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petowner/list?currentPage=${page.currPage-1}">[${page.currPage-1}]</a>&nbsp;&nbsp;
       </c:if>
            <a href="${pageContext.request.contextPath }/petowner/list?currentPage=${page.currPage}" style="color:black;">[${page.currPage}]</a>&nbsp;&nbsp;
       <c:if test="${page.currPage != page.totalPage}">
            <a href="${pageContext.request.contextPath }/petowner/list?currentPage=${page.currPage+1}">[${page.currPage+1}]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petowner/list?currentPage=${page.currPage+1}">[下一页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petowner/list?currentPage=${page.totalPage}">[尾页]</a>&nbsp;&nbsp;
       </c:if>
   </span>
</td>
</tr>
</table>
    </div>
</body>
</html>