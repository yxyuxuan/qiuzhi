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
					<a href="${absolutePath}/companydetail/goYinPinList">应聘信息列表</a>									
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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goModifyInformation">修改资料</a></li>
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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goYinPinList" style="color:blue;">应聘信息列表</a></li>
                    </ul>
                </div>
            </div>
        </div>
		<div class="rSection">
			<div id="yingPinMessage">
				<table border="2" cellspacing="0" cellpadding="2">
					<tr id="oneRow">
						<td>应聘者</td>
						<td>应聘职位</td>
						<td>投递时间</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${receiveRecords }" var="receiveRecord">
						<tr class="otherRow">
							<td><a target="_blank" href="${absolutePath}/applicantdetail/detail?id=${receiveRecord.getApplicantid()}&from=companyCenter">${receiveRecord.getApplicantname()}</a></td>
							<td>
								<a target="_blank" href="${absolutePath}/job/detail?id=${receiveRecord.getJobid()}&from=yinPinList">${receiveRecord.getJobname()}</a>
							</td>
							<td><fmt:formatDate value="${receiveRecord.getSendtime()}" pattern="yyyy-MM-dd" /></td>
							<td>${receiveRecord.getStatus()}</td>
							<td>
								<c:if test="${receiveRecord.getStatus().equals('已经被接受,等待电话通知')}">
									<a href="#" onclick="updateReceiveRecord('已经被拒绝,继续努力','${receiveRecord.getId()}')">拒绝</a>
								</c:if>
								<c:if test="${receiveRecord.getStatus().equals('已经被拒绝,继续努力')}">
									<a href="#" onclick="updateReceiveRecord('已经被接受,等待电话通知','${receiveRecord.getId()}')">接受</a>
								</c:if>
								<c:if test="${receiveRecord.getStatus().equals('待查看')}">
									<a href="#" onclick="updateReceiveRecord('已经被接受,等待电话通知','${receiveRecord.getId()}')">接受</a>
									<a href="#" onclick="updateReceiveRecord('已经被拒绝,继续努力','${receiveRecord.getId()}')">拒绝</a>
								</c:if>
								<a target="_blank" href="${absolutePath}/resume/detail?id=${receiveRecord.getResumeid()}&from=companyCenter">查看简历</a>
							</td>
						</tr>
					</c:forEach>
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
		
		function updateReceiveRecord(status,id) {
		    var url = "${absolutePath}/send/updateStatus?status="+status+"&id="+id;
		    $.ajax({
		        url : url,
		        type : "GET",
		        dataType : 'json',
		        success : function(json) {
		            alert(json.message)
		            if(json.status==1){
		                window.location.href="${absolutePath}/companydetail/goYinPinList"
		            }
		        }
		    })
		}
	</script>
</body>
</html>