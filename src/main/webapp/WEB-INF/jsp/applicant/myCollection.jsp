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
    <link rel="stylesheet" href="${absolutePath }/css/applicant/center.css">
   	<script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
<body>
	<!--header-->
	<header id="header">
	    <div class="lHeader">
	        <p>求职招聘系统</p>
	    </div>
	    <div class="rHeader">
	        <span class="appName">当前用户：${applicantDetail.getName()}</span>
	        <span>|</span>
	        <a href="${absolutePath}/applicantdetail/home">返回</a>
	    </div>
	</header>

	<!--主页-->
	<section id="topSection">
		<table>
			<tr>
				<td>当前位置:
					<a href="${absolutePath}/applicantdetail/home">首页 > </a>
					<a href="${absolutePath}/applicantdetail/center">信息中心 > </a>
					<a href="${absolutePath}/applicantdetail/goMyCollection">收藏夹</a>									
				</td>
				<td>今天是:<span id="today"></span> <span id="Day"></span></td>		
			</tr>
		</table>
	</section>
	<section id="section">
		<div class="lSection">
			<div class="head"></div>
			<div class="topDiv">
				<div class="topDivTil"><span>基础信息维护</span></div>
				<div class="ul">
					<ul>
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goModifyPassword">修改密码</a></li>
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goModifyInformation">修改资料</a></li>
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goMyResume">我的简历</a></li>
					</ul>
				</div>
			</div>
			<div class="bottomDiv">
				<div class="bottomDivTil">投递记录</div>
				<div class="ul">
					<ul>
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goTouDiList">投递记录</a></li>
					</ul>
				</div>
			</div>
			<div class="bottomDiv">
				<div class="bottomDivTil">收藏夹</div>
				<div class="ul">
					<ul>
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goMyCollection" style="color:blue;">我的收藏</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="rSection">
			<div id="myCollection">
				<c:choose>
					<c:when test="${collectionList!=null && collectionList.size()!=0}">
						<table border="1" cellspacing="0" cellpadding="1">
							<tr class="firstRow">
								<td>企业名称</td>
								<td>工作名称</td>
								<td>工作发布时间</td>
								<td>操作</td>
							</tr>
							<c:forEach items="${collectionList }" var="collection">
								<tr class="otherRow">
									<td><a target="_blank" href="${absolutePath}/companydetail/detail?id=${collection.getCompanyId()}&from=myCollection">${collection.getCompanyName()}</a></td>
									<td><a target="_blank" href="${absolutePath}/job/detail?id=${collection.getJobId()}&from=myCollection">${collection.getJobName()} </a></td>
									<td><fmt:formatDate value="${collection.getCollectionTime()}" pattern="yyyy-MM-dd" /></td>
									<td><a href="#" onclick="removeCollection('${collection.getId()}')">取消收藏</a></td>
								</tr>
							</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<div class="noText">您还没有收藏！</div>					
				</c:otherwise>
			</c:choose>
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

		function removeCollection(id){
			var url = "${absolutePath}/collection/remove";
			var parameters = "id="+id;
			$.ajax({
				url : url,
				data : parameters,
				type : "POST",
				dataType : 'json',
				success : function(json) {
					
					alert(json.message);
					if(json.status==1){
						window.location.href="${absolutePath}/applicantdetail/goMyCollection";
					}
				}
			})
		}
	</script>
</body>
</html>