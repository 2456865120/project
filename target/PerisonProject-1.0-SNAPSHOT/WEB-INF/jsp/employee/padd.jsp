<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fkjava" uri="/pager-tags" %> 
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>编辑员工</title>
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
    	$("#deptForm").submit(function(){
    		var name = $("#name");//姓名
    		var card_id= $("#card_id");//身份证号码
    		var phone= $("#phone");	//手机
    		var address= $("#address");//联系地址
    		var msg = "";
    		if (!/^[\u4E00-\u9FA5]{2,4}$/.test($.trim(name.val()))){
    			msg = "姓名格式不正确！！！";
    			name.focus(); 
    	    }
    		else if (!/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/.test($.trim(card_id.val()))){
				msg = "身份证号码格式不正确！！！X需要大写";
				card_id.focus(); 
		    } 
    		
    		else if (!/^1([38][0-9]|4[579]|5[0-3,5-9]|6[6]|7[0135678]|9[89])\d{8}$/.test($.trim(phone.val()))){
				msg = "手机格式不正确！！！";
				phone.focus(); 
		    } 
    		else if (!/^[\u4E00-\u9FA5]{6,15}$/.test($.trim(address.val()))){
				msg = "联系地址格式不正确！！！格式--XX省XX市";
				address.focus(); 
		    } 
    		if (msg != ""){
    			 alert(msg);
    			return false;
    		}else{
    			return true;
    			$("#deptForm").submit();
    		}
    	});
    });
    
    </script>
  </head>
  
  <body>
    <div class="x-body">
        <form class="layui-form" method="POST" id="deptForm"  action="${pageContext.request.contextPath}/employee/padd">
        <input type="hidden" name="userId" id="staticid" value="${sessionScope.user_session.id}" >
          <div class="layui-form-item" >
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>姓名
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="name" name="name" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${employee.name }">
                  <p style="color: red">${param.message}</p>
              </div>
             
          </div>
          <div class="layui-form-item" >
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>身份证号码
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="card_id" name="cardId" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${employee.cardId }">
              </div>
          </div>
          
          
            <div class="layui-form-item" >
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>性别
              </label>
              <div class="layui-input-inline">
               <select id="sex_id" name="sexId" class="valid">
                  			<c:forEach items="${requestScope.sex_list}" var="job">
						   		<c:choose>
			    					<c:when test="${employee.sexId== job.id }">
			    						<option value="${job.id }" selected="selected">${job.name }</option>
			    					</c:when>
			    					<c:otherwise>
			    						<option value="${job.id }">${job.name}</option>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
				</select>
              </div>
          </div>
          
             <div class="layui-form-item" >
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>学历
              </label>
              <div class="layui-input-inline">
               <select id="education_id" name="educationId" class="valid">
                  			<c:forEach items="${requestScope.education_list}" var="job">
						   		<c:choose>
			    					<c:when test="${employee.educationId== job.id }">
			    						<option value="${job.id }" selected="selected">${job.name }</option>
			    					</c:when>
			    					<c:otherwise>
			    						<option value="${job.id }">${job.name}</option>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
				</select>
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>邮箱
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="email" name="email" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${employee.email }">
              </div>
          </div>
           <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>手机
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="phone" name="phone" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${employee.phone }">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>联系地址
              </label>
              <div class="layui-input-inline">
                  <input type="text" id="address" name="address" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" value="${employee.address }">
              </div>
          </div>
  		<div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>职位
              </label>
              <div class="layui-input-inline">
                  <select id="job_id" name="jobId" class="valid" >
                  <option value="0">--部门选择--</option>
						   <c:forEach items="${requestScope.job_list}" var="job">
						   		<c:choose>
			    					<c:when test="${employee.joId == job.id }">
			    						<option value="${job.id }" selected="selected">${job.name }</option>
			    					</c:when>
			    					<c:otherwise>
			    						<option value="${job.id }">${job.name}</option>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
                  </select>
              </div>
          </div>
            <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>部门
              </label>
              <div class="layui-input-inline">
                  <select  name="deptId" class="valid">
                  <option value="0">--部门选择--</option>
						   <c:forEach items="${requestScope.dept_list}" var="dept">
						   		<c:choose>
			    					<c:when test="${employee.deptId == dept.id }">
			    						<option value="${dept.id }" selected="selected">${dept.name}</option>
			    					</c:when>
			    					<c:otherwise>
			    						<option value="${dept.id }">${dept.name}</option>
			    					</c:otherwise>
			    				</c:choose>
			    			</c:forEach>
                  </select>
              </div>
          </div>  
          <div class="layui-form-item">
              <label for="L_repass" class="layui-form-label">
              </label>
              <input type="submit" value=" 提交" class="layui-btn" lay-filter="add" lay-submit=""/>
                 
          </div>
      </form>
    </div>
  </body>

</html>