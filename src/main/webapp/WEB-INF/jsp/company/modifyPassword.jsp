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
					<a href="${absolutePath}/companydetail/goModifyPassword">修改密码</a>									
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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goModifyPassword" style="color:blue;">修改密码</a></li>
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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goYinPinList">应聘信息列表</a></li>
                    </ul>
                </div>
            </div>
        </div>
		<div class="rSection">
			<div id="gaiMiMa">
				<form id="changePassword">
					<label>原密码：<input id="oldPassword" type="password" name="oldPassword"></label> 
					<label>新密码：<input id="newPassword1" type="password" name="newPassword"></label> 
					<label id="queRenMiMa">确认新密码：<input id="newPassword2" type="password"></label>
					<label class="btn">
						<input type="button" value="修改" onclick="changePwd()">
						<input type="reset" value="取消">
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
		
		function changePwd() {
            var oldPassword = document.getElementById("oldPassword");
            var newPassword1 = document.getElementById("newPassword1");
            var newPassword2 = document.getElementById("newPassword2");
            var reg = /^[a-zA-Z0-9]{6,16}$/;
            if (!reg.test(oldPassword.value)) {
                alert("请输入正确的6-16位数字或字母组成的原密码！");
                return ;
            }else if (!reg.test(newPassword1.value)) {
                alert("请输入6-16位数字或字母组成的新密码！");
                return ;
            } else if (oldPassword.value == newPassword1.value) {
                alert("原密码和新密码相同！");
                return ;
            } else if (newPassword1.value != newPassword2.value) {
                alert("请两次输入相同的新密码！");
                return ;
            }

            var url = "${absolutePath}/companyaccount/changepwd";
            var parameters = $('#changePassword').serialize();
            $.ajax({
               url : url,
               data : parameters,
               type : "POST",
               dataType : 'json',
               success : function(json) {
                 if(json.status==-1){
                  alert(json.message);
              	}else {
                  alert("密码修改成功，请重新登录！");
                  window.location.href="${absolutePath}/index.jsp";
              	}
          		}
      		})
		}

	</script>
</body>
</html>