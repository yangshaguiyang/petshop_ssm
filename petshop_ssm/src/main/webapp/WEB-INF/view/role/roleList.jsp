<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib prefix="fn" uri="/WEB-INF/functions.tld" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
      
      <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/jquery.treetable.css"> 
      <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/jquery.treetable.theme.default.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/bootstrap.css"> 
      <script src="${pageContext.request.contextPath}/Public/js/jquery-2.1.4.min.js"></script>
      <script src="${pageContext.request.contextPath}/Public/js/jquery.treetable.js"></script>
    <style>
        #table th, #table td {
            font-size: 14px;
            padding : 8px;
        }
    </style>
</head>
<body>
			<table id="table" class="table text-center table-condensed table-striped" border="1">
				    <caption class="text-center"><em>角色列表</em></caption>
				    
					<tr>
						
						<td class="text-right" colspan="7" style="padding-right:20px;">
						   <a  href="${pageContext.request.contextPath }/role/add" title="增加角色"> 
							 <span class="glyphicon glyphicon-plus"></span>
						   </a>
						</td>
					</tr>
					
				    <thead>
				        <tr>
				            <th>名称</th>
				            <th>权限</th>
				            <th>操作</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${page.lists}" var="role">
				            <tr data-tt-id='${role.id}'>
				                <td>${role.name}</td>
				                <td>${role.resouceid}</td>
				                <td>
				                    
					                        <a href="${pageContext.request.contextPath }/role/edit?id=${role.id}"  target="_self" title="修改">
											   <span class="glyphicon glyphicon-pencil"></span></a>&nbsp;
				                    
					                    
					                        <a href="javascript:void(0);" id="${role.id }"
													 title="删除" class="deleteBtn"><span
														class="glyphicon glyphicon-minus"></span>
											</a>
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
					</table>
    	    	<table  border="0" cellspacing="0" cellpadding="0"  width="900px">
 <tr>
<td class="td2">
   <span>总记录数：${page.totalCount }&nbsp;&nbsp;每页显示:${page.pageSize}</span>&nbsp;&nbsp;
   <span>第${page.currPage }/ ${page.totalPage}页</span>&nbsp;&nbsp;
   <span>
       <c:if test="${page.currPage != 1}">
           <a href="${pageContext.request.contextPath }/role/list?currentPage=1">[首页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/role/list?currentPage=${page.currPage-1}">[上一页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/role/list?currentPage=${page.currPage-1}">[${page.currPage-1}]</a>&nbsp;&nbsp;
       </c:if>
            <a href="${pageContext.request.contextPath }/role/list?currentPage=${page.currPage}" style="color:black;">[${page.currPage}]</a>&nbsp;&nbsp;
       <c:if test="${page.currPage != page.totalPage}">
            <a href="${pageContext.request.contextPath }/role/list?currentPage=${page.currPage+1}">[${page.currPage+1}]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/role/list?currentPage=${page.currPage+1}">[下一页]</a>&nbsp;&nbsp;
           <a href="${pageContext.request.contextPath }/role/list?currentPage=${page.totalPage}">[尾页]</a>&nbsp;&nbsp;
       </c:if>
   </span>
</td>
</tr>
</table>
<script>
	$(function() {
	   /*  $("#table").treetable({ expandable: true }).treetable("expandNode", 1); */
	      $(".deleteBtn").click(function() {
	        if(confirm("确认删除吗?")) {
	        	
	            location.href = "${pageContext.request.contextPath}/role/del?id="+($(this).attr("id"));
	        }
	    }); 
	});
	   function doAjax(url){
		   $.ajax({
   	        url:url,
   	        type:'GET', //GET
   	        async:true,    //或false,是否异步
   	        timeout:5000,    //超时时间
   	        dataType:'text',    //返回的数据格式：json/xml/html/script/jsonp/text
   	        success:function(datas){
   	        	        alert(datas);
   			            location.reload();
   			},
    		 error:function(data){  
	             alert("出错了！！");  
	             console.log(data);
	   		 }
         })
	   }
	   
	  
</script>		
</body>
</html>