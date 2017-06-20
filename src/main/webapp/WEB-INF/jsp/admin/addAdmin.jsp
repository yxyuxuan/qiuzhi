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
    <link rel="icon" href="${absolutePath }/images/icon.png">
    <link href="${absolutePath }/css/admin/admin.css" rel="stylesheet">
    <script type="text/javascript" src="${absolutePath}/js/admin.js"></script>
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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goModifyPassword">修改密码</a></li>
                        <c:if test="${adminAccount.getType().equals('super')}">
                            <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goAddAdmin" style="color: blue;">添加管理员</a></li>
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
        <div id="adminManage">
            <table border="1" cellpadding="1" cellspacing="0">
                <tr>
                    <td>登录名</td>
                    <td>登录密码</td>
                    <td>操作</td>
                </tr>               
                <c:forEach items="${accountList }" var="account">
                	<tr>
                		<td>${account.getAccount() }</td>
                		<td>${account.getPassword() }</td>
                    	<td><a href="#" onclick="deleteAccount('${account.getId()}')">删除</a></td>
                	</tr>
                </c:forEach>
                 <c:if test="${accountList==null }">
                 		<tr>
                 			<td>
                				您还没有添加普通管理员!
                 			</td>
                 		</tr>
                	</c:if>
            </table>
            <button onclick="addAdmin()">添加</button>
        </div>
        <div id="addAdmin">
            <form id = "addAdminAccountForm">
                <table border="1" cellpadding="1" cellspacing="0">
                    <tr>
                        <td>帐号: </td>
                        <td>
                            <label>
                                <input id="account" type="text" name="account">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>密码: </td>
                        <td>
                            <label>
                                <input id="password1" type="text" name="password" >
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>请确认密码: </td>
                        <td>
                            <label>
                                <input id="password2" type="password">
                            </label>
                        </td>
                    </tr>
                </table>
                <label class="addBtn">
                    <input type="button" onclick="addAdminAccount()" value="添加">
                    <input type="reset" value="重置">
                    <input type="button" onclick="closeAddAdmin()" value="取消">
                </label>
            </form>
        </div>
    </div>
</section>

<!--footer-->
<footer>
    <p>© 2017 by yuxuan. All Rights Reserved.</p>
</footer>
<script>
	window.onload=function(){
		var date = new Date();
		var str = date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日";
		document.getElementById("today").innerText= str;
		var a = new Array("日", "一", "二", "三", "四", "五", "六");  
		var week = new Date().getDay();  
		var str2="星期"+ a[week]; 
		document.getElementById("Day").innerText=str2;
	}
    function addAdmin(){
        document.getElementById("addAdmin").style.display="block";
        document.getElementById("adminManage").style.display="none";
    }
    function closeAddAdmin(){
        document.getElementById("addAdmin").style.display="none";
        document.getElementById("adminManage").style.display="block";
    }
    
    function addAdminAccount(){
    	var account = $('#account').val();
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		var reg = /^[a-zA-Z0-9]{5,16}$/;
		if (account == "") {
			alert("用户名不能为空！");
			return;
		} else if (!reg.test(account)) {
			alert("请输入5-16位数字或字母组成的用户名！");
			return;
		} else if (!reg.test(password1)) {
			alert("请输入5-16位数字或字母组成的密码！");
			return;
		} else if (!reg.test(password2)) {
			alert("请输入5-16位数字或字母组成的密码！");
			return;
		} else if (password1 != password2) {
			alert("请两次输入相同的密码！");
			return;
		}
    	
    	var url = "${absolutePath}/admin/addAdminAccount";
    	var parameters = $('#addAdminAccountForm').serialize();
    	$.ajax({
    		url:url,
    		data:parameters,
    		type:"POST",
    		dataType:'json',
    		success: function(json){
    			alert(json.message);
    			if(json.status==1){
    				window.location.href="${absolutePath}/admin/goAddAdmin";
    				return ;
    			}
    		}
    	});
    }
    
    function deleteAccount(id){
    	var url = "${absolutePath}/admin/deleteAdminAccount?id="+id;
    	$.ajax({
    		url: url,
    		data: "",
    		type: "GET",
    		dataType: 'json',
    		success: function(json){
    			alert(json.message);
    			if(json.status==1){
    				window.location.href="${absolutePath}/admin/goAddAdmin";
    				return ;
    			}
    		}
    	});
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