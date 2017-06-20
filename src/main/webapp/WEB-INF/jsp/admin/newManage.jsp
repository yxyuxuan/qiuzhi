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
                        <li><img src="${absolutePath}/images/left.gif"> <a href="${absolutePath }/admin/goNewsManage" style="color: blue;">新闻管理</a></li>
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
        <div id="newsManage">
            <table border="1" cellpadding="1" cellspacing="0">
                <tr class="row1">
                    <td>标题</td>
                    <td>内容</td>
                    <td>发布时间</td>
                    <td>操作</td>
                </tr>
        
                <c:forEach items="${newsList }" var="news">
	                <tr class="row2">
	                	<td>${news.getTitle() }</td>
	                	<td><a target="_blank" href="${absolutePath}/new/detail?id=${news.getId()}&from=admin">查看内容</a></td>
	                	<td><fmt:formatDate value="${news.getCreatetime()}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	                	<td><a href="#" onclick="deleteNew('${news.getId()}')">删除</a></td>	
	                </tr>
                </c:forEach>
                
                <c:if test="${newsList==null}">
                	<tr>
                		<td>您还没发布新闻！</td>
                	</tr>
                </c:if>
              
            </table>
            <button onclick="addNews()">添加</button>
        </div>

        <div id="addNews">
            <form id="addNewForm">
                <table border="1" cellpadding="1" cellspacing="0">
                    <tr>
                        <td>标题: </td>
                        <td>
                            <label>
                                <input id="newstitle" type="text" name="title">
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td>内容: </td>
                        <td>
                            <label>
                                <textarea id="newscontent" name="content"></textarea>
                            </label>
                        </td>
                    </tr>
                </table>
                <label class="addBtn">
                    <input type="button" onclick="addNewFunction()" value="发布">
                    <input type="reset" value="重置">
                    <input type="button" onclick="closeAddNews()" value="取消">
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
    window.onscroll = function() {
        var scrollHeight = document.body.scrollTop || document.documentElement.scrollTop;
        if (scrollHeight > 10) {
            document.getElementById("return").style.display = 'block';
        } else {
            document.getElementById("return").style.display = 'none';
        }
    };

    function addNews(){
        document.getElementById("addNews").style.display="block";
        document.getElementById("newsManage").style.display="none";

    }
    function closeAddNews(){
        document.getElementById("addNews").style.display="none";
        document.getElementById("newsManage").style.display="block";
    }

    function addNewFunction(){
    	var newscontent=document.getElementById("newscontent").value;
    	var newstitle=document.getElementById("newstitle").value;
    	if(!newstitle){
    	    alert("新闻标题不能为空！");
    	    return ;
    	}else if(!newscontent){
    		alert("新闻内容不能为空！");
    		return ;
    	}
    	
    	var url = "${absolutePath}/new/add";
    	var parameters = $('#addNewForm').serialize();
    	$.ajax({
    		url:url,
    		data:parameters,
    		type:"POST",
    		dataType:'json',
    		success: function(json){
    			alert(json.message);
    			if(json.status==1){
    				window.location.href="${absolutePath}/admin/goNewsManage";
    				return ;
    			}
    		}
    	});
    }
    
    function deleteNew(id){
    	var url = "${absolutePath}/new/deleteNew?id="+id;
    	$.ajax({
    		url: url,
    		data: "",
    		type: "GET",
    		dataType: 'json',
    		success: function(json){
    			alert(json.message);
    			if(json.status==1){
    				window.location.href="${absolutePath}/admin/goNewsManage";
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