<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="absolutePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>登录</title>
	<script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<h1>登录</h1>
	<form id="login">
		账号<input type="text" name="account"/>
		<br/>
		密码<input type="password" name="password">
		<br/>
		<label>公司
			<input type="radio" name="identity" value="Company"/>
		</label>
		
		<label>求职者
			<input type="radio" name="identity" value="Applicant"/>
		</label>
		
		<br/>
		<button type="button"  onclick="login()">登录</button>
		<button type="reset"  >取消</button>
	</form>
		<a href="${absolutePath}/user/preregister">没有账号,前往注册界面</a>
	
	
	<script type="text/javascript">
		
		function login() {
			
			// TODO: 校验 账号框为6位
			// 密码框为6 位 
			var url ="${absolutePath}/user/login";
			var parameters =$('#login').serialize();
			alert(url+"  "+parameters)
			$.ajax({
				url: url,
				type: 'POST',
				dataType: 'json',
				data: parameters,
				success:function(json){
					if(json.status==1){
						// 登录成功 进入主页
						window.location.href="${absolutePath}/user/home"
					}else{
						alert(json.message);
					}
				}				
			});
		}
	</script>
</body>
</html>