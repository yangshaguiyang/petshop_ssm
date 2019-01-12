<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
      
      <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/jquery.treetable.css"> 
      <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/jquery.treetable.theme.default.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/bootstrap.css"> 
    
    <style>
        #table th, #table td {
            font-size: 14px;
            padding : 8px;
        }

    </style>

</head>
<body>
			<table id="table" style="width:85%" class="col-md-9   table-condensed table-striped" border="1">
				    <caption class="text-center"><em>部门列表</em></caption>
				    
					<tr>
						
						<td class="text-right" colspan="7" style="padding-right:20px;">
						   <a  href="${pageContext.servletContext.contextPath }/Resource/menuAddEdit?pid=0" title="增加根部门"> 
							 <span class="glyphicon glyphicon-plus"></span>
						   </a>
						</td>
					</tr>
					
				    <thead>
				        <tr>
				            <th>名称</th>
				            <th>sort</th>
				            <th>pid</th>
				            <th>href</th>
				            <th>permission</th>
				            <th>clazz</th>
				            <th>操作</th>
				        </tr>
				    </thead>
				    <tbody>
				        <c:forEach items="${menus}" var="menu">
				            <tr data-tt-id='${menu.id}' <c:if test="${not menu.rootNode}">data-tt-parent-id='${menu.pid}'</c:if>>
				                <td>${menu.text}</td>
				                <td>${menu.sort}</td>
				                <td>${menu.pid }</td>
				                <td>${menu.href }</td>
				                <td>${menu.permission}</td>
				                <td>${menu.clazz }</td>
				                <td>
                                         <a	href="${pageContext.servletContext.contextPath }/Resource/menuAddEdit?pid=${menu.id}" title="增加下级部门"><span class="glyphicon glyphicon-plus"></span></a>&nbsp;
				                    
					                        <a href="${pageContext.servletContext.contextPath }/Resource/menuAddEdit?id=${menu.id}"  target="_self" title="修改">
											   <span class="glyphicon glyphicon-pencil"></span></a>&nbsp;
				                    
				    
					                    
					                        <a href="javascript:void(0);" id="${menu.id }"
													class="deleteBtn" title="删除"><span
														class="glyphicon glyphicon-minus"></span>
											</a>
				                </td>
				            </tr>
				        </c:forEach>
				    </tbody>
				</table>
			

<script src="${pageContext.request.contextPath}/Public/js/jquery-2.1.4.min.js"></script>
<script src="${pageContext.request.contextPath}/Public/js/jquery.treetable.js"></script>
<script>
	$(function() {
	    $("#table").treetable({ expandable: true }).treetable("expandNode", 1);
	    $(".deleteBtn").click(function() {
	        if(confirm("确认删除吗?")) {
	            location.href = "${pageContext.request.contextPath}/Resource/menuDelete?id="+$(this).attr("id");
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