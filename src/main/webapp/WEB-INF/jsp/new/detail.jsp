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
    <link rel="stylesheet" href="${absolutePath}/css/new/news.css">
    <script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="${absolutePath}/js/vue.js"></script>
    
</head>
<body>
<!--header-->
<header id="header">
    <div class="lHeader">
        <p>求职招聘系统</p>
    </div>
    <div class="rHeader">
        <a href="javascript:window.opener=null;window.open('','_self');window.close();">关闭</a>
    </div>
	</header>
<!--主页-->
<section id="section">
    <!--新闻详情页-->
	<div id="news">
	    <div class="firstRow">
	    	<table>
				<tr>
					<td>当前位置:
						<c:choose>
								<c:when test="${from.equals('nologin')}">
									<a href="${absolutePath}/qiuzhi/index">首页 > </a>
									<a href="${absolutePath}/qiuzhi/index">新闻 > </a>
								</c:when>

								<c:when test="${from.equals('applicationHome')}">
									<a href="${absolutePath}/applicantdetail/home">首页 > </a>
									<a href="${absolutePath}/applicantdetail/home">新闻 > </a>
								</c:when>

								<c:when test="${from.equals('companyHome')}">
									<a href="${absolutePath}/companydetail/home">首页 > </a>
									<a href="${absolutePath}/companydetail/home">新闻 > </a>
								</c:when><c:when test="${from.equals('admin')}">
									<a href="${absolutePath}/admin/home">首页 > </a>
									<a href="${absolutePath}/admin/goNewsManage">新闻管理  > </a>
									<a href="${absolutePath}/admin/goNewsManage">内容 > </a>
								</c:when>
								<c:otherwise></c:otherwise>
						</c:choose>
						<a>正文 </a>
					</td>
					<td>今天是:<span id="today"></span> <span id="Day"></span></td>
				</tr>
				</table>
	    </div>
	    <div class="fLine">
	        <p class="newsTitle">${detail.getTitle() }</p>
	        <div class="hr"></div>
	        <div id="newsDetail">
	            <p class="visit">浏览量：<span id="visited">{{number}}</span></p>
	            <p class="newsTime">发布时间：<fmt:formatDate value="${detail.getCreatetime()}" pattern="yyyy-MM-dd HH:mm:ss" /></p>
	        </div>
	    </div>
	    <div class="newsContent">
	        <textarea>${detail.getContent() }</textarea>
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

		var vm = new Vue({
			el:'#visited',
			data: {
				number:0
			}
		});
		var url = "${absolutePath}/count/getNumber?id=${detail.getId()}";
		console.log("url:"+url);
		$.ajax({
			url:url,
			type:"GET",
			dataType:'json',
			success:function(json){
					console.log("json:"+JSON.stringify(json));
					vm.number=json.data;
				}
			});

	</script>
</body>
</html>
