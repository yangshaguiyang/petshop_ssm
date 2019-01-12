
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=utf-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>添加宠物</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/Public/css/bootstrap.css" />
<script src="${pageContext.request.contextPath }/Public/js/jquery-2.1.4.min.js" type="text/javascript"
	charset="utf-8"></script>
<style type="text/css">
tr, td {
	text-align: center;
}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/pet/edit" method="post" enctype="multipart/form-data">

		<table style="width: 80%; margin: 10px auto;"
			class="table table-bordered table-condensed table-hover table-responsive table-striped">
			<caption>
				<h1>宠物修改</h1>
			</caption>
			
			<tr>
				<td><a href="javascript:void(0)"
					onclick="history.go(-1)" class="btn btn-sm btn-disabled"><i
						class="glyphicon glyphicon-share-alt">返回首页</i></a></td>
			</tr>
			
			<tr>
				<td>
				<label>name</label>
				    <input type="hidden" name="id" value="${pet.id }" />
                    <input type="text" name="name"
					value="${pet.name }" placeholder="请输入宠物姓名" /></td>
			</tr>
			
			<tr>
				<td>
				<label>typename</label>
				<input type="text"
					name="typename" value="${pet.typename }"
					 placeholder="请输入宠物类型" /></td>
			</tr>
			
			<tr>
				<td>
				<label>health</label>
				<input type="text"
					 name="health" value="${pet.health }" placeholder="宠物是否健康" /></td>
			</tr>
			
			<tr>
				<td>
				<label>love</label>
				<input type="text" name="love"
					 value="${pet.love }" placeholder="请输入宠物亲密度" /></td>
			</tr>
			
			<tr>
				<td>
				<label>date</label>
				<input type="date"
					name="birthday" value="${pet.birthday }" /></td>
			</tr>
			
			 <tr>
				<td>
				    <select name="ownerId">
						<c:forEach items="${list }" var="po">
						  <option value="${po.id }"
						    <c:if test="${po.id==pet.ownerId }">
						     selected
						    </c:if>
						    >${po.name }
						  </option>
						 </c:forEach>
				       </select>
				      </td>
				</tr>
				
				<tr>
				<td>
				   <select name="storeId">
					<c:forEach items="${list2 }" var="ps">
						<option value="${ps.id }"
						   <c:if test="${ps.id==pet.storeId }">
							 selected
						   </c:if>
						   >${ps.name }
						</option>
					</c:forEach>
				   </select></td>
				 </tr>
				 
				 <tr>
				<td>
				<label>price</label>
				<input type="text"  name="price" value="${pet.price }" /></td>
				</tr>
				
			<%-- 	<tr>
				<td>
				    <label>photo</label>
				    <img src="${pageContext.request.contextPath }${pet.photo}" style="width:50px">
				    <input type="hidden" name="changePhoto" value="${pet.photo }" />
				    <input type="file" name="photo" class="center-block" />	  
				</td>
				</tr> --%>
				
				<tr>
				<td><a href="javascript:void(0)"
					onclick="$('form')[0].submit();" class="btn btn-xs btn-danger"><i
						class="glyphicon glyphicon-ok-sign">保存</i></a></td>
			    </tr>
		</table>
	</form>
</body>
</html>