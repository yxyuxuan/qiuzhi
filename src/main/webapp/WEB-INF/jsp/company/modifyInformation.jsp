<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>
<c:set var="absolutePath" value="${pageContext.request.contextPath}/"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>求职招聘系统</title>
	<link rel="icon" href="${absolutePath}/images/icon.png" />
	<link href="${absolutePath }/css/company/center.css" rel="stylesheet">
	<script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<!--header-->
	<header id="header">
		<div class="lHeader">
			<p>求职招聘系统</p>
		</div>
		<div class="rHeader">
			<span class="appName">当前用户：${companyDetail.getName() }</span> 
			<span>|</span>
			<a href="${absolutePath}/companydetail/home">返回</a>
		</div>
	</header>

	<!--主页-->
	<section id="topSection">
		<table>
			<tr>
				<td>当前位置:
					<a href="${absolutePath}/companydetail/home">首页  > </a>
					<a href="${absolutePath}/companydetail/center">信息中心 > </a>
					<a href="${absolutePath}/companydetail/goModifyInformation">修改资料</a>									
				</td>
				<td>今天是:<span id="today"></span> <span id="Day"></span></td>		
			</tr>
		</table>
	</section>
	<section id="section">
		<div class="lSection">
            <div class="head"></div>
            <div class="topDiv">
                <div class="topDivTil">基础信息维护</div>
                <div class="ul">
                    <ul>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goModifyPassword">修改密码</a></li>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goModifyInformation" style="color:blue;">修改资料</a></li>
                    </ul>
                </div>
            </div>
            <div class="bottomDiv">
                <div class="bottomDivTil">招聘信息</div>
                <div  class="ul">
                    <ul>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goZhaoPinList">招聘信息列表</a></li>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goPublishWork">发布招聘信息</a></li>
                    </ul>
                </div>
            </div>
            <div class="bottomDiv">
                <div class="bottomDivTil">应聘信息</div>
                <div  class="ul">
                    <ul>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goYinPinList">应聘信息列表</a></li>
                    </ul>
                </div>
            </div>
        </div>
		<div class="rSection">
			<div id="gaiZiLiao">
				<form id="editDetail">
					<table border="1" cellspacing="0" cellpadding="1">
						<tr>
							<td>企业名称：</td>
							<td><input type="text" name="name"  value="${companyDetail.getName()}"></td>
						</tr>
						<tr>
							<td>企业地址：</td>
							<td><input type="text" name="address" value="${companyDetail.getAddress()}"></td>
						</tr>
						<tr>
							<td>联系电话：</td>
							<td><input id="tel" type="text" name="phone" value="${companyDetail.getPhone()}"></td>
						</tr>
						<tr>
							<td>联系email：</td>
							<td><input id="email" type="text" name="email" value="${companyDetail.getEmail()}"></td>
						</tr>
						<tr>
							<td>企业简介：</td>
							<td><textarea name="desc" >${companyDetail.getDesc()}</textarea></td>
						</tr>
					</table>
					<label class="btn"> 
						<input type="button" value="修改" onclick="editDetail()"> 
						<input class="res" type="reset" value="取消">
					</label>
				</form>
			</div>
			<!--返回顶部-->
			<div id="return">
				<a href="#header" target="_self"><img src="${absolutePath}/images/returntop.jpg"></a> 
			</div>
		</div>
	</section>
	
	<!--footer-->
	<footer>
		<p>© 2017 by yuxuan. All Rights Reserved.</p>
	</footer>	
	
	<script type="text/javascript">
		window.onload=function(){
			var date = new Date();
			var str = date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日";
			document.getElementById("today").innerText= str;
			var a = new Array("日", "一", "二", "三", "四", "五", "六");  
			var week = new Date().getDay();  
			var str2="星期"+ a[week]; 
			document.getElementById("Day").innerText=str2;
		}
		window.onscroll = function() {
				var scrollHeight = document.body.scrollTop || document.documentElement.scrollTop;
				if (scrollHeight > 10) {
					document.getElementById("return").style.display = 'block';
				} else {
					document.getElementById("return").style.display = 'none';
				}
			}
		
		function editDetail() {
			var regTel=/^0\d{2,3}-?\d{7,8}$/;
			var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var tel=$("#tel").val();
			var email=$("#email").val();
			if(!regTel.test(tel)){
				alert("请输入正确格式的联系电话！(区号+号码。区号由0开头由3位或4位组成，号码由7位或8位数字组成)");
				return;
			}else if(!regEmail.test(email)){
				alert("请输入正确格式的email(第一部分：由字母、数字、下划线、短线“-”、点号“.”组成，第二部分：为一个域名，域名由字母、数字、短线“-”、域名后缀组成)");
				return;
			}
		
			var url = "${absolutePath}/companydetail/edit";
			var parameters = $('#editDetail').serialize();
			$.ajax({
				url : url,
				data : parameters,
				type : "POST",
				dataType : 'json',
				success : function(json) {
					alert(json.message);
				}
			})
		}
	</script>
</body>
</html>