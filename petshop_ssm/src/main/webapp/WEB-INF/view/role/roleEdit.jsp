<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="myfn" uri="/WEB-INF/functions.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file="/Public/share/head.jsp" %>
<html>
<head>
    <title></title>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/Public/css/zTreeStyle/zTreeStyle.css">
    <style>
        ul.ztree {margin-top: 10px;border: 1px solid #617775;background: #f0f6e4;width:220px;height:200px;overflow-y:scroll;overflow-x:auto;}
        .l360{
           width:360px;
        }
    </style>

</head>
<body>
<div id="container">
    <form method="post" action="${pageContext.request.contextPath }/role/edit">
        <table class="table table-condensed table-striped" style="margin-top:25px;font-size:small;">
           <caption class="text-center">角色资源编辑</caption>
           
           <tr>
             <td class="text-right" colspan="2">
                <a href="javascript:history.go(-1);">返回</a>
             </td>
          </tr>
           
           <tr>
              <td class="text-right">角色名*：</td>
              <td>
                 <input type="hidden" name="id" value="${role.id }"/>
                 <input type="text" name="name" value="${role.name }"  class="l360"/>
              </td>
           </tr>
           
           <tr>
              <td class="text-right">拥有的资源列表*：</td>
              <td>
                 <input type="hidden" id="resourceIds" name="resouceid" value="${role.resouceid }"/>
                 <input class="l360" type="text" id="resourceName" name="resourceName" readonly <c:if test="${not empty role.resouceid}"> value="${role.resouceid }"</c:if>/>
                 <a id="menuBtn" href="#">选择</a>
              </td>
           </tr>
           <tr>
             <td colspan="2">
              <button>保存</button>
             </td>
           </tr>
        </table>
    </form>


    <div id="menuContent" class="menuContent" style="display:none; position: absolute;">
        <ul id="tree" class="ztree" style="margin-top:0;" ></ul>
    </div>
</div>
    
    <script src="${pageContext.request.contextPath}/Public/js/jquery.ztree.all-3.5.min.js"></script>
    <script>
        $(function () {
            var setting = {
                check: {
                    enable: true ,
                    chkboxType: { "Y": "", "N": "" }
                },
                view: {
                    dblClickExpand: false
                },
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onCheck: onCheck
                }
            };

            var zNodes =[
                <c:forEach items="${menus}" var="m">
                {id:${m.id},pId:${m.pid},name:"${m.text}",checked:${fn:contains(role.resouceid,m.id)}},
                </c:forEach>
            ];
            function onCheck(e, treeId, treeNode) {
                var zTree = $.fn.zTree.getZTreeObj("tree"),
                        nodes = zTree.getCheckedNodes(true),
                        id = "",
                        name = "";
                nodes.sort(function compare(a,b){return a.id-b.id;});
                for (var i=0, l=nodes.length; i<l; i++) {
                    id += nodes[i].id + ",";
                    name += nodes[i].name + ",";
                }
                if (id.length > 0 ) id = id.substring(0, id.length-1);
                if (name.length > 0 ) name = name.substring(0, name.length-1);
                $("#resourceIds").val(id);
                $("#resourceName").val(name);
                hideMenu();
            }

            function showMenu() {
                var cityObj = $("#resourceName");
                var cityOffset = $("#resourceName").offset();
                $("#menuContent").css({left:cityOffset.left + "px", top:cityOffset.top + cityObj.outerHeight() + "px"}).slideDown("fast");

                $("body").bind("mousedown", onBodyDown);
            }
            
            function hideMenu() {
                $("#menuContent").fadeOut("fast");
                $("body").unbind("mousedown", onBodyDown);
            }
            
            function onBodyDown(event) {
                if (!(event.target.id == "menuBtn" || event.target.id == "menuContent" || $(event.target).parents("#menuContent").length>0)) {
                    hideMenu();
                }
            }

            $.fn.zTree.init($("#tree"), setting, zNodes);
            $("#menuBtn").click(showMenu);
        });
    </script>


</body>
</html>