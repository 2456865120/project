<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fkjava" uri="/pager-tags" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>用户信息</title>
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8" />
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/public/logo.ico"
	type="image/x-icon" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/font.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/xadmin.css">
<script type="text/javascript"
	src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/public/lib/layui/layui.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
<script type="text/javascript">
     $(function(){
    	if(${count}!=0){
    		$("#count1").hide();
    		$("#count2").show();
    	}
      });
    </script>
</head>

<body>
	<div class="x-nav">
		<span class="layui-breadcrumb"> <a href="">首页</a> <a> <cite>访问用户信息</cite></a>
		</span> <a class="layui-btn layui-btn-small"
			style="line-height: 1.6em; margin-top: 3px; float: right"
			href="${pageContext.request.contextPath}/uservisit/list" title="刷新">
			<i class="layui-icon" style="line-height: 30px">ဂ</i>
		</a>
	</div>
	<div class="x-body">
		<div class="layui-row" style="" align="center">
			<form class="layui-form layui-col-md12 x-so" method="get"
				action="${pageContext.request.contextPath}/uservisit/querylist">
				<input type="text" name="content" style="width: 50%;"
					placeholder="请输入查找内容" autocomplete="off" class="layui-input">
				<button class="layui-btn">
					<i class="layui-icon">&#xe615;</i>
				</button>
			</form>
		</div>
		<table class="layui-table">
			<thead>
				<tr>
					<th>
						<div class="layui-unselect header layui-form-checkbox"
							lay-skin="primary">
							<i class="layui-icon">&#xe605;</i>
						</div>
					</th>
					<th>ID</th>
					<th>登录用户</th>
					<th>登录时间</th>
					<th>退出时间</th>
					<th>访客IP</th>
					<!-- <th>老铁地址</th> -->
					<th>用户设备</th>
					<th>浏览器</th>
					<th>操作系统</th>
					<th>版本</th>
					<th>操作</th>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="user" varStatus="stat">
					<tr>
						<td>
							<div class="layui-unselect layui-form-checkbox"
								lay-skin="primary" data-id='2'>
								<i class="layui-icon">&#xe605;</i>
							</div>
						</td>
						<td>${user.id}</td>
						<td>${user.loginname }</td>
						<td>${user.loginTime }</td>
						<td>${user.exitTime }</td>
						<td>${user.visitIp }</td>
						<%-- <td>${user.user_address }</td> --%>
						<td>${user.iphone }</td>
						<td>${user.browser }</td>
						<td>${user.system }</td>
						<td>${user.version }</td>
						<td class="td-manage"><a title="删除"
							onclick="member_del(this,'${user.id }')" href="javascript:;">
								<i class="layui-icon">&#xe640;</i>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 分页标签 -->
	<div style="margin-left: 400px;" id="count1">
		<fkjava:pager pageIndex="${requestScope.pageModel.pageIndex}"
			pageSize="${requestScope.pageModel.pageSize}"
			recordCount="${requestScope.pageModel.recordCount}" style="digg"
			submitUrl="${pageContext.request.contextPath}/${hre }?pageIndex={0}&content=${content}" />
		<div style="margin-left: 500px; display: none;" id="count2">
			<p style="color: rgb(0, 97, 222)">
				共查询到<font color="red">${count}</font>条数据
			</p>
		</div>

	</div>
	<script type="text/javascript">

      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              //等以后再使用异步，这里先使用
              $.get("${pageContext.request.contextPath}/uservisit/delete?id="+id);
              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
              location.reload();
          });
      }
      function delAll (argument) {

        var data = tableCheck.getData();
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            layer.msg('删除成功', {icon: 1});
            $(".layui-form-checked").not('.header').parents('tr').remove();
            
        });
      }
    </script>

</body>

</html>