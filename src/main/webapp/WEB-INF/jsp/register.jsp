<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="absolutePath" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>注册</title>
	<script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<h1>注册</h1>
	<form id="register">
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
		<button type="button"  onclick="register()">注册</button>
		<button type="reset"  >取消</button>
	</form>
	
	<script type="text/javascript">
		
		function register() {
			var url ="${absolutePath}/user/register";
			var parameters =$('#register').serialize();
			$.ajax({
				url: url,
				type: 'POST',
				dataType: 'json',
				data: parameters,
				success:function(json){
					alert(json.status+"  "+json.message);
					if(json.status==1){
						// TODO: 注册成功 前往登录页面
						alert(json.message);
						window.location.href="${absolutePath}/user/prelogin";
					}else{
						alert(json.message);
					}
				}				
			});
		}
	</script>
</body>
</html>