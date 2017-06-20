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
					<a href="${absolutePath}/companydetail/goPublishWork">发布招聘信息</a>									
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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath}/companydetail/goPublishWork" style="color:blue;">发布招聘信息</a></li>
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
			<div id="faBuZhaoPinMessage">
				<form id="addJob">
					<table border="1" cellspacing="0" cellpadding="1" >
						<tr>
							<td>工作名称：</td>
							<td><input id="workName" type="text" name="name"></td>
						</tr>
						<tr>
							<td>工作地址：</td>
							<td><input type="text" name="address"></td>
						</tr>
						<tr>
							<td>月薪：</td>
							<td><input class="li" type="text" name="minsalary" /> - <input type="text" name="maxsalary"></td>
						</tr>
						<tr>
							<td>学历要求：</td>
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
							<td>工作类型：</td>
							<td>
								<select name="category">
									<option selected="selected" value="计算机/互联网">计算机/互联网</option>
									<option value="电子/通讯">电子/通讯</option>
									<option value="金融/经济">金融/经济</option>
									<option value="法律">法律</option>
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
						</tr>
						<tr>
							<td>工作经验：</td>
							<td><input type="text" name="experience"></td>
						</tr>
						<tr>
							<td>岗位职责：</td>
							<td><textarea rows="8" cols="30" name="description"></textarea></td>
						</tr>
						<tr>
							<td>任职要求：</td>
							<td><textarea rows="8" cols="30" name="requirement"></textarea></td>
						</tr>						
					</table>
					<label class="btn">
						<input type="button" value="提交" onclick="addJob()">
						<input class="res" type="reset" value="取消">
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
		
		function addJob() {
			   var salary=$("#salary");
			   var reg=/^[1-9]\d{0-8}$/;
			   var workName=$("#workName").val();
			   if(workName == ""){
				   alert("工作名称不能为空！");
			   }else
			   if(reg.test(salary)){
				   alert("请输入正确格式的1-9位数字月薪！");
				   return ;
			   }
		       var url = "${absolutePath}/job/add";
		       var parameters = $('#addJob').serialize();
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