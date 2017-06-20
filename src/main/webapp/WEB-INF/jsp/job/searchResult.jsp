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
    <link rel="stylesheet" href="${absolutePath }/css/job/searchResult.css">
</head>
<body>
<!--header-->
<header id="header">
    <div class="lHeader">
        <p>求职招聘系统</p>
    </div>
	<div class="rHeader">
		<c:choose>
			<c:when test="${from.equals('nologin')}">
					<a href="${absolutePath}/qiuzhi/index" >返回</a>
			</c:when>

		    <c:when test="${from.equals('applicationHome')}" >
				<span class="appName">当前用户：${name}</span> <span>|</span>
				<a href="${absolutePath}/applicantdetail/home" >返回</a>
			</c:when>

			<c:when test="${from.equals('companyHome')}" >
				<span class="appName">当前用户：${name}</span> <span>|</span>
				<a href="${absolutePath}/companydetail/home" >返回</a>
			</c:when>
		</c:choose>
	</div>
</header>

<section id="section">
	<div id="searchjob">
		<div class="firstRow">
		    <table>
				<tr>
					<td>当前位置:
					<c:choose>
						<c:when test="${from.equals('nologin')}">
							<a href="${absolutePath}/qiuzhi/index" >首页 > </a>
						</c:when>

						<c:when test="${from.equals('applicationHome')}" >
							<a href="${absolutePath}/applicantdetail/home" >首页 > </a>
						</c:when>

					</c:choose>
					<a href="#">搜索 </a>
					</td>
					<td>今天是:<span id="today"></span> <span id="Day"></span></td>
				</tr>
			</table>
		 </div>
		<div class="topSection">
	        <div>
	            <p>职位搜索</p>
	        </div>
	        <form class="souSuo">
	            <span class="sou"><input id="searchContent" type="text" placeholder="请输入"/></span>
	            <span class="submit"><input type="button" value="搜索" onclick="search()"/></span>
	        </form>
    	</div>
    	<div class="bottomSection">
	        <div class="resumeList"><p>职位列表</p></div>
	        <c:if test="${jobList==null || jobList.size()==0}">
	        	<div class="noresult"><p>没有结果！</p></div>
	        </c:if>
	        <c:if test="${jobList!=null &&  jobList.size()!=0}">
					<table border="1" cellspacing="0" cellpadding="1">
						<tr>
							<td>招聘职位</td>
							<td>工作待遇</td>
							<td>工作类型</td>
							<td>工作地点</td>
							<td>发布时间</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${jobList }" var="job">
							<tr>
								<td>${job.getName() }</td>
								<td>${job.getMinsalary() }-${job.getMaxsalary() }</td>
								<td>${job.getCategory() }</td>
								<td>${job.getAddress() }</td>
								<td><fmt:formatDate value="${job.getLastupdatetime()}"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><a target="_Blank"
									href="${absolutePath}/job/detail?id=${job.getId()}&from=searchResult">查看职位信息</a>
									| <a target="_Blank"
									href="${absolutePath}/companydetail/detail?id=${job.getCompanyid()}&from=searchResult">查看企业信息</a>
								</td>
							</tr>
						</c:forEach>
					</table>
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
<script type="text/javascript">
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
	function search(){
		var name = document.getElementById("searchContent").value;
		window.location.href="${absolutePath}/job/search?name="+name+"&from=nologin";
	}
</script>
</body>
</html>
