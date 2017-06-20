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
    <link rel="stylesheet" href="${absolutePath }/css/company/companyMess.css">
    <script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
<!--header-->
<header id="header">
    <div class="lHeader">
        <p>求职招聘系统</p>
    </div>
    <c:choose>
		<c:when test="${from.equals('applicationHome') || from.equals('applicationCenter') || from.equals('myCollection')}">
			<div class="rHeader">
				<span class="appName">当前用户：${name}</span> <span>|</span>
				<a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
			</div>
		</c:when>
		
		<c:otherwise>
			<div class="rHeader">
				 <a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
			</div>
		</c:otherwise>
	</c:choose>
</header>

<!--section-->
	<section id="section">
		<div id="companyDetail">
			<div class="firstRow">
	    		<table>
					<tr>
						<td>当前位置:
							<c:choose>
								<c:when test="${from.equals('nologin')}">
									<a href="${absolutePath}/qiuzhi/index">首页 > </a>
									<a href="${absolutePath}/qiuzhi/index">职位列表 > </a>
									<a href="${absolutePath}/qiuzhi/index">企业 > </a>
								</c:when>
								<c:when test="${from.equals('applicationHome')}">
									<a href="${absolutePath}/applicantdetail/home">首页 > </a>
									<a href="${absolutePath}/applicantdetail/home">职位列表 > </a>
									<a href="${absolutePath}/applicantdetail/home">企业 > </a>
								</c:when>
								<c:when test="${from.equals('applicationCenter')}">
									<a href="${absolutePath}/applicantdetail/home">首页 > </a>
									<a href="${absolutePath}/applicantdetail/center">信息中心 > </a>
									<a href="${absolutePath}/applicantdetail/center">投递记录 > </a>
									<a href="#">企业 ></a>
								</c:when>
								<c:when test="${from.equals('admin')}">
									<a href="${absolutePath}/admin/home">首页 > </a>
									<a href="${absolutePath}/admin/goCompanyUsersManage">企业用户管理 > </a>
									<a href="${absolutePath}/admin/goCompanyUsersManage">企业 > </a>
								</c:when>
								<c:when test="${from.equals('myCollection')}">
									<a href="${absolutePath}/applicantdetail/home">首页 > </a>
									<a href="${absolutePath}/applicantdetail/center">信息中心 > </a>
									<a href="${absolutePath}/applicantdetail/goMyCollection">收藏夹 > </a>
									<a href="#">企业 ></a>
								</c:when>
								<c:otherwise>
									<a href="#" onclick="back('${from}')">首页 > </a>
									<a href="#" onclick="back('${from}')">搜索 > </a>
									<a href="#">企业 > </a>
								</c:otherwise>
							</c:choose>
							<a>正文</a>
						</td>	
						<td>今天是:<span id="today"></span> <span id="Day"></span></td>
					</tr>
				</table>
	    	</div>
			<div class="title">企业资料</div>
			<div class="content">
				<table border="1" cellspacing="0" cellpadding="1" >
					<tr>
						<td>企业名称:</td>
						<td class="secondCol">${detail.getName()}</td>
					</tr>
					<tr>
						<td>企业地址:</td>
						<td class="secondCol">${detail.getAddress()}</td>
					</tr>
					<tr>
						<td>联系电话:</td>
						<td class="secondCol">${detail.getPhone()}</td>
					</tr>
					<tr>
						<td>email:</td>
						<td class="secondCol">${detail.getEmail()}</td>
					</tr>
					<tr>
						<td>企业简介:</td>
						<td><textarea disabled="disabled">${detail.getDesc()}</textarea></td>
					</tr>
				</table>
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

<!--autosize-->
<script src='${absolutePath }/js/autosize.min.js'></script>
<script>
    autosize(document.querySelectorAll('textarea'));
    window.onscroll = function() {
		var scrollHeight = document.body.scrollTop || document.documentElement.scrollTop;
		if (scrollHeight > 10) {
			document.getElementById("return").style.display = 'block';
		} else {
			document.getElementById("return").style.display = 'none';
		}
	}
    window.onload=function(){
    	var date = new Date();
		var str = date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日";
		document.getElementById("today").innerText= str;
		var a = new Array("日", "一", "二", "三", "四", "五", "六");
		var week = new Date().getDay();
		var str2="星期"+ a[week];
		document.getElementById("Day").innerText=str2;
    }
    
    function back(from){
		if(from=="company"){
			window.location.href="${absolutePath}/companydetail/home";
			return ;
		}
		
		var url = "${absolutePath}/qiuzhi/hasLogin";
	
		$.ajax({
			url : url,
			data : "",
			type : "POST",
			dataType : 'json',
			success : function(json) {
				if(json.status==1){
					window.location.href="${absolutePath}/applicantdetail/home";
				}else{
					window.location.href="${absolutePath}/qiuzhi/index";
				}
			}
		})
	}
</script>
</body>
</html>
