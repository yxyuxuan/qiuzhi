<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isELIgnored="false"%>
<c:set var="absolutePath" value="${pageContext.request.contextPath}/"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>求职招聘系统</title>
    <link rel="icon" href="${absolutePath }/images/icon.png">
    <link href="${absolutePath }/css/admin/admin.css" rel="stylesheet">
    <script type="text/javascript" src="${absolutePath }/js/admin.js"></script>
    <script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
    
</head>
<body>
<!--header-->
<header id="header">
    <div class="lHeader">
        <p>求职招聘系统</p>
    </div>
    <div class="rHeader">
        <span>当前管理员：${adminAccount.getAccount() }</span>
        <span>|</span>
        <a href="#" onclick="exit()">退出</a>
     </div>
</header>

<!--主页-->
    <section id="topSection">
		<table>
			<tr>
				<td>今天是:<span id="today"></span> <span id="Day"></span></td>
				<td></td>		
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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goModifyPassword" style="color: blue;">修改密码</a></li>
                        <c:if test="${adminAccount.getType().equals('super')}">
                            <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goAddAdmin">添加管理员</a></li>
                        </c:if>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goNewsManage">新闻管理</a></li>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goApplicantUsersManage">求职用户管理</a></li>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goCompanyUsersManage">企业用户管理</a></li>
                    </ul>
                </div>
        </div>
        <div class="bottomDiv">
            <div class="bottomDivTil">招聘信息维护</div>
            <div  class="ul">
                <ul>
                	<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goJobManage">职位信息管理</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="rSection">
        <div id="gaiMiMa">
            <form id="changePassword">
                <label>原密码：<input id="oldPass" type="password" name="oldPassword"></label>
                <label>新密码：<input id="newPass1" type="password" name="newPassword"></label>
                <label id="queRenMiMa">确认新密码：<input id="newPass2" type="password"></label>
                <label class="btn">
                    <input type="button" value="修改" onclick="changePwd()">
                    <input type="reset" value="取消">
                </label>
            </form>
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
	function changePwd() {
	    var oldPass = document.getElementById("oldPass");
	    var newPass1 = document.getElementById("newPass1");
	    var newPass2 = document.getElementById("newPass2");
	    var reg_x = /^[a-zA-Z0-9]{5,16}$/;
	    if (!reg_x.test(oldPass.value)) {
	        alert("请输入正确的5-16位数字或字母组成的原密码！");
	        return;
	    }else if (!reg_x.test(newPass1.value)) {
	        alert("请输入5-16位数字或字母组成的新密码！");
	        return;
	    } else if (oldPass.value == this.value) {
	        alert("原密码和新密码相同！");
	        return;
	    } else if (newPass1.value != newPass2.value) {
	        alert("请两次输入相同的新密码！");
	        return;
	    }
	
		var url = "${absolutePath}/admin/changepwd";
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
					window.location.href="${absolutePath}/admin/login";
				}
			}
		})
	}

	function exit(){
		var url = "${absolutePath}/admin/exit";
		$.ajax({
			url : url,
			type : "POST",
			dataType: 'json',
			success : function(json) {
						  alert(json.message);
						  window.location.href="${absolutePath}/admin/login";
					}
			})
		}
    </script>
</body>
</html>