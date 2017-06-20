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
	<link rel="stylesheet" href="${absolutePath}/css/job/detail.css">
	<script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
	<!--header-->
	<header id="header">
		<div class="lHeader">
			<p>求职招聘系统</p>
		</div>
		<div class="rHeader">
			<c:choose>
				<c:when test="${from.equals('applicationHome') || from.equals('applicationCenter') || from.equals('companyCenter') || from.equals('myCollection')}">
					<span class="appName">当前用户：${name}</span>
					<span>|</span>
				</c:when>
			</c:choose>
			<a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
		</div>
	</header>

	<!--主页-->
	<section id="section">
		<div id="jobDetail">
			<div class="firstRow">
	    		<table>
					<tr>
						<td>当前位置:
						<c:choose>
								<c:when test="${from.equals('nologin')}">
									<a href="${absolutePath}/qiuzhi/index">首页 > </a>
									<a href="${absolutePath}/qiuzhi/index">职位列表 > </a>
									<a href="${absolutePath}/qiuzhi/index">工作 > </a>
								</c:when>
								<c:when test="${from.equals('null')}">
									<a href="${absolutePath}/qiuzhi/index">首页 > </a>
									<a href="${absolutePath}/qiuzhi/index">职位列表 > </a>
									<a href="${absolutePath}/qiuzhi/index">工作 > </a>
								</c:when>
								<c:when test="${from.equals('applicationHome')}">
									<a href="${absolutePath}/applicantdetail/home">首页 > </a>
									<a href="${absolutePath}/applicantdetail/home">职位列表 > </a>
									<a href="${absolutePath}/applicantdetail/home">工作 > </a>
								</c:when>
								<c:when test="${from.equals('applicationCenter')}">
									<a href="${absolutePath}/applicantdetail/home">首页 > </a>
									<a href="${absolutePath}/applicantdetail/center">信息中心 > </a>
									<a href="${absolutePath}/applicantdetail/center">投递记录 > </a>
									<a href="#">工作 > </a>
								</c:when>
								<c:when test="${from.equals('zhaoPinList')}">
									<a href="${absolutePath}/companydetail/home">首页 > </a>
									<a href="${absolutePath}/companydetail/center">信息中心 > </a>
									<a href="${absolutePath}/companydetail/goZhaoPinList">招聘信息列表 > </a>
									<a href="#">工作 > </a>
								</c:when>
								<c:when test="${from.equals('yinPinList')}">
									<a href="${absolutePath}/companydetail/home">首页 > </a>
									<a href="${absolutePath}/companydetail/center">信息中心 > </a>
									<a href="${absolutePath}/companydetail/goYinPinList">应聘信息列表 > </a>
									<a href="#">工作 > </a>
								</c:when>
								<c:when test="${from.equals('searchResult')}">
									<a href="#" onclick="back()">首页 > </a>
									<a href="#" onclick="back()">搜索 > </a>
									<a href="#" onclick="back()">工作> </a>
								</c:when>
								<c:when test="${from.equals('admin')}">
									<a href="${absolutePath}/admin/home">首页 > </a>
									<a href="${absolutePath}/admin/goJobManage">职位信息管理 > </a>
									<a href="${absolutePath}/admin/goJobManage">招聘职位 > </a>
								</c:when>
								<c:when test="${from.equals('myCollection')}">
									<a href="${absolutePath}/applicantdetail/home">首页 > </a>
									<a href="${absolutePath}/applicantdetail/center">信息中心 > </a>
									<a href="${absolutePath}/applicantdetail/goMyCollection">收藏夹 > </a>
									<a href="#">工作 > </a>
								</c:when>
								<c:otherwise>
								
								</c:otherwise>
						</c:choose>
							<a>正文</a>
						</td>
						<td>今天是:<span id="today"></span> <span id="Day"></span></td>
					</tr>
				</table>
	    	</div>
			<div class="title">职位详细信息</div>
			<div class="content">
				<table id="tab" border="1" cellspacing="0" cellpadding="1" >
					<tr>
						<td>工作名称：</td>
						<td class="secondCol">${job.getName()}</td>
					</tr>
					<tr>
						<td>工作地点：</td>
						<td class="secondCol">${job.getAddress()}</td>
					</tr>
					<tr>
						<td>工作待遇：</td>
						<td class="secondCol">${job.getMinsalary()}-${job.getMaxsalary()}</td>
					</tr>
					<tr>
						<td>工作类型：</td>
						<td class="secondCol">${job.getCategory()}</td>
					</tr>
					<tr>
						<td>学历要求：</td>
						<td class="secondCol">${job.getEducationalBackground()}</td>
					</tr>
					<tr>
						<td>工作经验：</td>
						<td class="secondCol">${job.getExperience()}</td>
					</tr>
					<tr>
						<td>岗位职责：</td>
						<td><textarea disabled="disabled">${job.getDescription()}</textarea></td>
					</tr>
					<tr>
						<td>任职要求：</td>
						<td><textarea disabled="disabled">${job.getRequirement()}</textarea></td>
					</tr>
				</table>
						
				<!--企业查看自己发布的职位信息时，不显示投递简历和收藏工作-->
				<c:if test="${from.equals('applicationHome') || from.equals('applicationCenter') || from.equals('myCollection') || from.equals('goTouDiList') || from.equals('nologin') || from.equals('null')|| from.equals('searchResult')}">
					<div id="caoZuo">
						<div class="czbtn">
								<a href="#" onclick="send()"> 投递简历</a>
						</div>
						
						<!--如果求职者已经收藏则"收藏工作"改为"已收藏"-->
						<c:if test="${flag==false }">
							<div class="czbtn">
								<a href="#" onclick="collect()">收藏工作</a>
							</div>
						</c:if>
						<c:if test="${flag==true }">
							<div class="czbtn">
								<a href="#">已收藏</a>
							</div>
						</c:if>
					</div>
				</c:if>

				
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
	
	<script type="text/javascript">
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
		
		function send() {
			var url = "${absolutePath}/qiuzhi/hasLogin";
			$.ajax({
				url : url,
				type : "POST",
				dataType : 'json',
				success : function(json) {
					if(json.status==-1){
						alert(json.message); 
						return;
					}else{
						var url2 = "${absolutePath}/send/sendResume?jobId=${job.getId()}&jobName=${job.getName()}&companyId=${job.getCompanyid()}&companyName=${job.getCompanyname()}";
						$.ajax({
							url : url2,
							type : "POST",
							dataType : 'json',
							success : function(json) {
								alert(json.message);
							}
						})
					}
				}
			})
		}

	   function back(){
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
	
	<script type="text/javascript">
		function collect(){
			var url = "${absolutePath}/qiuzhi/hasLogin";
			$.ajax({
				url : url,
				type : "POST",
				dataType : 'json',
				success : function(json) {
					if(json.status==-1){
						alert(json.message);
						return;
					}else{
						var url2 = "${absolutePath}/collection/add";
						var parameters = "companyId=${job.getCompanyid()}&jobId=${job.getId()}&companyName=${job.getCompanyname()}&jobName=${job.getName()}"
						$.ajax({
								url : url2,
								data : parameters,
								type : "POST",
								dataType : 'json',
								success : function(json) {
									alert(json.message);
								}
							})
					}
				}
			})
		}

	</script>

</body>
</html>
