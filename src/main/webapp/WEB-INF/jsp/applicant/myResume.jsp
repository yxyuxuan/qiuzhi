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
					<a href="${absolutePath}/applicantdetail/goMyResume">我的简历</a>									
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
						<li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/applicantdetail/goMyResume" style="color:blue;">我的简历</a></li>
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
			<div id="myResume">
				<form id="editMyResume">
					<table border="1" cellspacing="0" cellpadding="1">
						<tr>
							<td>姓名：</td>
							<td><input type="text" name="name" value="${resume.getName() }"></td>
						</tr>
						<tr>
							<td>性别：</td>
							<td><input id="sex2" type="text" name="sex" value="${resume.getSex() }"></td>
						</tr>
						<tr>
							<td>年龄：</td>
							<td><input id="age2" type="text" name="age" value="${resume.getAge() }"></td>
						</tr>
						<tr>
							<td>住址：</td>
							<td><input type="text" name="address" value="${resume.getAddress() }"></td>
						</tr>
						<tr>
							<td>手机：</td>
							<td><input id="tel2" type="text" name="phone" value="${resume.getPhone() }"></td>
						</tr>
						<tr>
							<td>email：</td>
							<td><input id="email2" type="text" name="email" value="${resume.getEmail() }"></td>
						</tr>
						<tr>
							<td>工作类型：</td>
							<td>
								<select name="category">
									<%-- <option selected="selected" value="${resume.getCategory()}">${resume.getCategory()}</option> --%>
									<option selected="selected" value="计算机/互联网">计算机/互联网</option>
									<option value="电子/通讯">电子/通讯</option>
									<option value="金融/经济">金融/经济</option>
									<option value="设计">设计</option>
									<option value="财务">财务</option>
									<option value="机械">机械</option>
									<option value="技工">技工</option>
									<option value="医疗卫生">医疗卫生</option>
									<option value="公众服务">公众服务</option>
									<option value="经营管理">经营管理</option>
									<option value="客户服务">客户服务</option>
									<option value="酒店/餐饮">酒店/餐饮</option>
									<option value="化工/生物">化工/生物</option>
									<option value="市场与销售">市场与销售</option>
									<option value="物流/交通运输">物流/交通运输</option>
									<option value="其他">其他</option>
								</select>
							</td>
						<tr>
							<td>期望工作：</td>
							<td><input type="text" name="expectjob" value="${resume.getExpectjob() }"></td>
						</tr>
						<tr>
							<td>期望月薪：</td>
							<td><input id="salary" type="text" name="expectsalary" value="${resume.getExpectsalary()}"></td>
						</tr>
						<tr>
							<td>教育经历：</td>
							<td id="eduText"><textarea id="eduText" placeholder="请输入毕业学校，专业，毕业时间" name="education">${resume.getEducation()}</textarea></td>
						</tr>
						<tr>
							<td>工作经历：</td>
							<td><textarea name="jobexperience">${resume.getJobexperience()}</textarea></td>
						</tr>
						<tr>
							<td>项目经验：</td>
							<td><textarea name="projectexperience">${resume.getProjectexperience()}</textarea></td>
						</tr>
						<tr>
							<td>自我描述：</td>
							<td><textarea name="desc">${resume.getDesc()}</textarea></td>
						</tr>
					</table>
					<label class="btn"> 
						<input type="button" value="修改" onclick="editResume()"> 
						<input class="res" type="button" value="取消">
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
		
		/**
	     * 编辑简历的信息
	     * @return {[type]} [description]
	     */
		function editResume(){      
	        var regAge=/^(?:[1-9][0-9]?|1[01][0-9]|100)$/;
			var regSex=/^(["男"]|["女"]){1}$/;
			var regTel=/^1\d{10}$/;
			var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			var regSalary=/^[1-9]\d{0,8}$/;
			var age=$("#age2").val();
			var sex=$("#sex2").val();
			var tel=$("#tel2").val();
			var email=$("#email2").val();
			var salary=$("#salary").val();
			if(!regSex.test(sex)){
				alert("请输入正确的性别“男”或“女”！");
				return;
			}else if (!regAge.test(age)){
				alert("请输入合法的年龄数字(1-100)！");
				return;
			}else if(!regTel.test(tel)){
				alert("请输入正确格式的11位数字手机号！)");
				return;
			}else if(!regEmail.test(email)){
				alert("请输入正确格式的email(第一部分：由字母、数字、下划线、短线“-”、点号“.”组成，第二部分：为一个域名，域名由字母、数字、短线“-”、域名后缀组成)");
				return;
			}else if(!regSalary.test(salary)){
				alert("请输入正确格式的1-9位数字月薪！");
				return;
			}
			
			var url = "${absolutePath}/resume/edit";
			var parameters = $('#editMyResume').serialize();
		
			$.ajax({
				url : url,
				data : parameters,
				type : "POST",
				dataType : 'json',
				success : function(json) {
					alert(json.message);				
				}
			})
		}
	</script>
</body>
</html>