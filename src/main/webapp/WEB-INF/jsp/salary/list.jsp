<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<%@ taglib uri="/pager-tags" prefix="fkjava" %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>员工薪酬信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/public/logo.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/xadmin.js"></script>
    <script type="text/javascript">
    $(function(){
    	if(${count}!=0){
    		$("#count1").hide();
    		$("#count2").show();
    	}
    	var username = "${sessionScope.user_session.loginname}";
    	if(username=="admin"||username=="manager"){
    		$("#aaa").show(); 
    		$("#bbb").show();
    		$("#do").css("display", "block"); 
    		$("#ID").show(); 
    		$('tr').find('td:eq(0)').show();
    		$('tr').find('td:eq(6)').show();
    	}else{
    		$("#aaa").hide();
    		$("#bbb").hide();
    		$("#do").css("display", "none"); 
    		$("#ID").hide();
    		$('tr').find('td:eq(10)').hide();
    	};
    }) 
  </script>
  </head>
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>薪酬管理</cite></a>
      </span>
      <button id="bbb" type="button" onclick="location.href='${pageContext.request.contextPath}/salary/toadd'" class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:innert;margin-left:75%;;"  ><i class="layui-icon"></i>增加</button>
      <a id="aaa" class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="${ctx }/salary/list" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row" style="" align="center">
        <form class="layui-form layui-col-md12 x-so" method="get" action="${pageContext.request.contextPath}/salary/search">
          
          <input type="text" name="content" style="width:50%;"  placeholder="请输入查找内容" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
              <td>姓名</td>
			  <th>职位</th>
			  <th>部门</th>
			  <th>岗位工资</th>
			  <th>工资级别</th>
			  <th>工龄工资</th>
			  <th>绩效奖</th>
			  <th>个人所得税</th>
			  <th>日期</th>
			  <th id="do">操作</th>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.list}" var="salary" varStatus="stat">
     <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='2'><i class="layui-icon">&#xe605;</i></div>
            </td>
            		  <td>${salary.employeename}</td>
            		  <td>${salary.jobname }</td>
					  <td>${salary.deptname }</td>
					  <td>${salary.salaryStation}</td>
					  <td>${salary.salaryLevel }</td>
					  <td>${salary.seniorityPay }</td>
					  <td>${salary.performance }</td>
					  <td>${salary.individualIncome}</td>
					  <td>${salary.createDate}</td>
            <td class="td-manage">
             
             <a title="编辑"  href='${pageContext.request.contextPath}/salary/toedit?id=${salary.id}'>
                <i class="layui-icon">&#xe642;</i>
              </a>
              <%-- <a title="删除" onclick="member_del(this,'${salary.id }')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a> --%>
            </td>
          </tr>
			</c:forEach>
        </tbody>
      </table>
     <!-- 分页标签 -->
     <div style="margin-left: 400px;" id="count1">
         <fkjava:pager
	  	        pageIndex="${requestScope.pageModel.pageIndex}" 
	  	        pageSize="${requestScope.pageModel.pageSize}" 
	  	        recordCount="${requestScope.pageModel.recordCount}" 
	  	        style="digg"
	  	        submitUrl="${pageContext.request.contextPath}/${hre }?pageIndex={0}"/>
     </div>
     
      <div style="margin-left: 500px; display: none;" id="count2">
                <p style="color: rgb(0,97,222)">共查询到<font color="red">${count}</font>条数据</p>
       </div>
    </div>
    <script>
      
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？',function(index){
              //发异步删除数据
              //等以后再使用异步，这里先使用
              $.get("${pageContext.request.contextPath}/salary/delete?id="+id);
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