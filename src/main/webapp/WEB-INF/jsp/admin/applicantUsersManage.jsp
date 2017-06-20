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
    <link rel="icon" href="${absolutePath}/images/icon.png">
    <link href="${absolutePath}/css/admin/admin.css" rel="stylesheet">
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
                            <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goAddAdmin">添加管理员</a></li>
                        </c:if>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goNewsManage">新闻管理</a></li>
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goApplicantUsersManage" style="color: blue;">求职用户管理</a></li>
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
        <div id="applyUserManage">
            <table  border="1" cellspacing="0" cellpadding="1">
                <tr>
                    <td>帐号</td>
                    <td>密码</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>年龄</td>
                    <td>学历</td>
                    <td>手机</td>
                    <td>简历</td>
                    <td>操作</td>
                </tr>
                <c:forEach items="${ applicantAccountAndDetailList}" var="applicantAccountAndDetail">               
	                <tr>
	                    <td>${applicantAccountAndDetail.getAccount() }</td>
	                    <td>${applicantAccountAndDetail.getPassword() }</td>
	                    <td>
		                    <c:if test="${applicantAccountAndDetail.getName()!=null && !applicantAccountAndDetail.getName().isEmpty() }">
			                  	<a target="_blank" href="${absolutePath}/applicantdetail/detail?id=${applicantAccountAndDetail.getId()}&from=admin">${applicantAccountAndDetail.getName() }</a>
		                    </c:if>
		                </td>
	                    <td>${applicantAccountAndDetail.getSex() }</td>
	                    <td>${applicantAccountAndDetail.getAge() }</td>
	                    <td>${applicantAccountAndDetail.getEducationalBackground()}</td>
	                    <td>${applicantAccountAndDetail.getPhone() }</td>
	                    <td> 
	                    	<c:if test="${applicantAccountAndDetail.getResumeId()!=0 }">
		                    	<a target="_blank" href="${absolutePath}/resume/detail?id=${applicantAccountAndDetail.getResumeId()}&from=admin">查看简历</a>
		               		</c:if>		               		
		                </td>               
	                    <td><a href="#" onclick="deleteApplicantAccount('${applicantAccountAndDetail.getId()}')">删除</a></td>
	                </tr>
                </c:forEach>
            </table>
            <c:if test="${applicantAccountAndDetailList==null }">
            	<span>没有结果</span>
            </c:if>
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
    };
    
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
	
	function deleteApplicantAccount(id){
		var url = "${absolutePath}/admin/deleteApplicantAccount?id="+id;
		$.ajax({
			url : url,
			type : "GET",
			dataType: 'json',
			success : function(json) {
						  alert(json.message);
						  window.location.href="${absolutePath}/admin/goApplicantUsersManage";
					}
			})
		}
    </script>
</body>
</html>