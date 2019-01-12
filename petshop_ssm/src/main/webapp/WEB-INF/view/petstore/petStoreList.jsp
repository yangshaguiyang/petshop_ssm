<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>宠物商店列表</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Public/css/bootstrap.css"/>
<script src="${pageContext.request.contextPath}/Public/js/jquery-2.1.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/Public/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
	td,th{
		text-align: center;
	}
</style>
</head>
<body>
    <div class="container">
    	<table style="width: 80%;margin: 20px auto;" class="table table-bordered table-hover table-responsive table-striped">
    		<caption style="text-align: center;"><h1>宠物商店列表</h1></caption>
    		<tr>
    			<th>id</th>
    			<th>name</th>
    			<th>password</th>
    			<th>balance</th>
    			<th style="width: 140px;">操作</th>
    		</tr>
    		<tr>
    			<td colspan="4">&nbsp;</td>
    			<td>
    				<a href="${pageContext.request.contextPath}/petstore/add" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-plus">增加</span></a>
    			</td>
    		</tr>
    		 <c:if test="${not empty page.lists }">
    		 <c:forEach items="${page.lists }" var="ps">
    		  <tr>
    		  	<td><a href="javascript:void(0)" id="${ps.id }" data-toggle="modal" data-target="#myModal" class="btn btn-xm btn-default storePet"  title="显示商店内宠物">${ps.id }</a></td>
    		  	<td>${ps.name }</td>
    		  	<td>${ps.password }</td>
    		  	<td>${ps.balance }</td>
    		  	<td>
    		  		<a href="${pageContext.request.contextPath}/petstore/edit?id=${ps.id }" class="btn btn-success btn-sm"><span class="glyphicon glyphicon-pencil">修改</span></a>
    		  		<a href="javascript:void(0)" id="${ps.id }" class="btn btn-danger btn-sm beSure"><span class="glyphicon glyphicon-trash">删除</span></a>
    		  	</td>
    		  </tr>
    		 </c:forEach>
    		</c:if>
    		<c:if test="${empty page.lists }">
    		   <h2>宠物商店列表暂时为空</h2>
    		</c:if>
    	</table>
    	    	<table  border="0" cellspacing="0" cellpadding="0"  width="900px">
 <tr>
<td class="td2">
   <span>总记录数：${page.totalCount }&nbsp;&nbsp;每页显示:${page.pageSize}</span>&nbsp;&nbsp;
   <span>第${page.currPage }/ ${page.totalPage}页</span>&nbsp;&nbsp;
   <span>
       <c:if test="${page.currPage != 1}">
           <a href="${pageContext.request.contextPath }/petstore/list?currentPage=1">[首页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petstore/list?currentPage=${page.currPage-1}">[上一页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petstore/list?currentPage=${page.currPage-1}">[${page.currPage-1}]</a>&nbsp;&nbsp;
       </c:if>
            <a href="${pageContext.request.contextPath }/petstore/list?currentPage=${page.currPage}" style="color:black;">[${page.currPage}]</a>&nbsp;&nbsp;
       <c:if test="${page.currPage != page.totalPage}">
            <a href="${pageContext.request.contextPath }/petstore/list?currentPage=${page.currPage+1}">[${page.currPage+1}]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petstore/list?currentPage=${page.currPage+1}">[下一页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/petstore/list?currentPage=${page.totalPage}">[尾页]</a>&nbsp;&nbsp;
       </c:if>
   </span>
</td>
</tr>
</table>
    	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">本商店宠物列表</h4>
            </div>
            <div class="modal-body"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
    </div>
    <script type="text/javascript">
	$(function(){
		$(".beSure").click(function(){
			if(confirm("您确定要删除这条内容吗？")){
				location.href="${pageContext.request.contextPath}/petstore/del?id="+$(this).attr("id");
			}
		});
		$(".storePet").click(function(){
	    	$.ajax({
				   type:"POST",
				   url:"${pageContext.request.contextPath}/petstore/storePet",
				   data:{storeId: $(this).attr("id")},
				   contentType: 'application/json; charset=UTF-8',
				   dataType:"json",
				   success:function(data){
					   
					   var html="<table class='table table-bordered table-hover table-responsive table-striped'>";
					   html+="<th>id</th><th>name</th><th>typeName</th><th>birthday</th><th>store_Id</th><th>price</th><th>photo</th>";
					  
					   //将Json字符串解析为Json数组
					   data=eval(data);
					 
					   $.each(data,function(i,o){
						  var pet =o;
						  html+="<tr>";
						  html+="<td>"+pet.id+"</td>";
						  html+="<td>"+pet.name+"</td>";
						  html+="<td>"+pet.typeName+"</td>";
						  html+="<td>"+pet.birthday+"</td>";
						  html+="<td>"+pet.store_Id+"</td>";
						  html+="<td>"+pet.price+"</td>";
						  html+="<td><img src="+'${pageContext.request.contextPath}'+pet.photo+" style='width:50px;height:50px;'"+"/></td>";
						  html+="</tr>";
					   })
					   html+="</table>";
					   $(".modal-body").html(html);
				   }
			   })  
		})
	})
</script>
</body>
</html>