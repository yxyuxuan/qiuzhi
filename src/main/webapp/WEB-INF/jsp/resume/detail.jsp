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
    <link rel="stylesheet" href="${absolutePath }/css/resume/myResume.css">
</head>
<body>
<!--header-->
	<header id="header">
		<div class="lHeader">
			<p>求职招聘系统</p>
		</div>
		<div class="rHeader">
			<c:choose>
				<c:when test="${from.equals('companyHome') || from.equals('companyCenter')}">
					<div class="rHeader">
						<span class="appName">当前用户：${name}</span><span>|</span>
						<a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="rHeader">
						 <a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
					</div>
				</c:otherwise>
		</c:choose>	
		</div>
	</header>

	<!--主页-->
<section id="section">
	<div id="resumeDetail">
		<div class="firstRow">
	    		<table>
					<tr>
						<td>当前位置:							
							<c:choose>								
								<c:when test="${from.equals('companyHome')}">
									<a href="${absolutePath}/companydetail/home" >首页 > </a>
									<a href="${absolutePath}/companydetail/home" >简历列表 > </a>
								</c:when>
								<c:when test="${from.equals('companyCenter')}">
									<a href="${absolutePath}/companydetail/home" >首页 > </a>
									<a href="${absolutePath}/companydetail/center" >信息中心 > </a>
									<a href="${absolutePath}/companydetail/goYinPinList" >应聘信息列表 > </a>
								</c:when>
								<c:when test="${from.equals('searchResult')}">
									<a href="${absolutePath}/companydetail/home" >首页 > </a>
									<a href="${absolutePath}/companydetail/home" >搜索 > </a>
								</c:when>
								<c:when test="${from.equals('admin')}">
									<a href="${absolutePath}/admin/home" >首页 > </a>
									<a href="${absolutePath}/admin/goApplicantUsersManage" >求职用户管理 > </a>
								</c:when>
								<c:otherwise>
								</c:otherwise>
							</c:choose>
							<a href="#" >简历 > </a>
							<a>正文  </a>
						</td>	
						<td>今天是:<span id="today"></span> <span id="Day"></span></td>
					</tr>
				</table>
	    </div>
    	<div class="title"> 求职者简历</div>
    	<div class="content">
	    	<table border="1" cellspacing="0" cellpadding="1" >
	    		<tr>
	    			<td>姓名:</td>
	    			<td class="secondCol">${resume.getName() }</td>
	    		</tr>
	    		<tr>
	    			<td>性别:</td>
	    			<td class="secondCol">${resume.getSex() }</td>
	    		</tr>
	    		<tr>
	    			<td>年龄:</td>
	    			<td class="secondCol">${resume.getAge() }</td>
	    		</tr>
	    		<tr>
	    			<td>住址:</td>
	    			<td class="secondCol">${resume.getAddress() }</td>
	    		</tr>
	    		<tr>
	    			<td>email:</td>
	    			<td class="secondCol">${resume.getEmail() }</td>
	    		</tr>
	    		<tr>
	    			<td>手机号码:</td>
	    			<td class="secondCol">${resume.getPhone() }</td>
	    		</tr>
	    		<tr>
	    			<td>期望工作:</td>
	    			<td class="secondCol">${resume.getExpectjob() }</td>
	    		</tr>
	    		<tr>
	    			<td>期望薪水:</td>
	    			<td class="secondCol">${resume.getExpectsalary() }</td>
	    		</tr>
	    		<tr>
	    			<td>教育经历:</td>
	    			<td><textarea disabled="disabled">${resume.getEducation()}</textarea></td>
	    		</tr>
	    		<tr>
	    			<td>工作经历:</td>
	    			<td><textarea disabled="disabled">${resume.getJobexperience()}</textarea></td>
	    		</tr>
	    		<tr>
	    			<td>项目经验:</td>
	    			<td><textarea disabled="disabled">${resume.getProjectexperience()}</textarea></td>
	    		</tr>
	    		<tr>
	    			<td>自我描述:</td>
	    			<td><textarea disabled="disabled">${resume.getDesc()}</textarea></td>
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
</script>
</body>
</html>
