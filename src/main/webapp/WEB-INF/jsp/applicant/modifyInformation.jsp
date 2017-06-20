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
</head>
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
					<a href="${absolutePath}/applicantdetail/goModifyInformation">修改信息</a>									
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
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goModifyInformation" style="color:blue;">修改资料</a></li>
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
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goMyCollection">我的收藏</a></li>
					</ul>
				</div>
			</div>
		</div>
		
		<div class="rSection">
			<div id="gaiZiLiao">
				<form id="editDetail">
					<table border="1" cellspacing="0" cellpadding="1">
						<tr>
							<td>姓名：</td>
							<td><input type="text" name="name"
								value="${applicantDetail.getName()}"></td>
						</tr>
						<tr>
							<td>年龄：</td>
							<td><input id="age" type="text" name="age"
								value="${applicantDetail.getAge()}"></td>
						</tr>
						<tr>
							<td>性别：</td>
							<td><input id="sex" type="text" name="sex" value="${applicantDetail.getSex()}"></td>
						</tr>
						<tr>
							<td>住址：</td>
							<td><input name="address" type="text" value="${applicantDetail.getAddress()}"></td>
						</tr>
						<tr>
							<td>手机：</td>
							<td><input id="tel" name="phone" type="text" value="${applicantDetail.getPhone()}"></td>
						</tr>
						<tr>
							<td>email：</td>
							<td><input id="email" name="email" type="text" value="${applicantDetail.getEmail()}"></td>
						</tr>
						<tr>
							<td>学历：</td>
							<td>
								<select name="educationalBackground">
									<option value="小学">小学</option>
									<option value="初中">初中</option>
									<option value="高中">高中</option>
									<option value="大专">大专</option>
									<option selected="selected" value="本科">本科</option>
									<option value="硕士">硕士</option>
									<option value="博士">博士</option>
									<option value="不限">不限</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>自我描述：</td>
							<td><textarea name="desc">${applicantDetail.getDesc()}</textarea></td>
						</tr>
					</table>
					<label class="btn"> 
						<input type="button" value="修改" onclick="editDetail()"> 
						<input class="res" type="reset" value="取消">
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
		
		function editDetail() {
			var regAge=/^(?:[1-9][0-9]?|1[01][0-9]|100)$/;
			var regSex=/^(["男"]|["女"]){1}$/;
			var regTel=/^1\d{10}$/;
			var regTel2=/^0\d{2,3}-?\d{7,8}$/;
			var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var age=$("#age").val();
			var sex=$("#sex").val();
			var tel=$("#tel").val();
			var email=$("#email").val();		
			if (!regAge.test(age)){
				alert("请输入合法的年龄数字(1-100)！");
				return;
			}else if(!regSex.test(sex)){
				alert("请输入正确的性别“男”或“女”！");
				return;
			}else if(!regTel.test(tel)){
				alert("请输入正确格式的11位数字手机号！");
				return;
			}else if(!regEmail.test(email)){
				alert("请输入正确格式的email(第一部分：由字母、数字、下划线、短线“-”、点号“.”组成，第二部分：为一个域名，域名由字母、数字、短线“-”、域名后缀组成)");
				return;
			}
		
			var url = "${absolutePath}/applicantdetail/edit";
			var parameters = $('#editDetail').serialize();
			$.ajax({
				url : url,
				data : parameters,
				type : "POST",
				dataType : 'json',
				success : function(json) {
					if(json.status==-1){
						alert(json.message);				
					}else {
						alert(json.message);
					}
				}
			})
		}
	</script>
</body>
</html>