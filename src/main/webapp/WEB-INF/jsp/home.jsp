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
<link rel="icon" href="${absolutePath}/images/icon.png" />
<link rel="stylesheet" href="${absolutePath}/css/applicant/home.css">
<script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${absolutePath}/js/loginAndRegister.js"></script>
</head>
<body>
	<!-- 导航 -->
	<header id="header">
		<div class="lHeader">
			<a class="al" href="#">求职招聘系统</a> <span>|</span> 
			<a class="ar" href="javascript:showQiYeDengLu();">进入企业版</a>
		</div>
		<div class="rHeader">
			<a class="al" href="javascript:showQiuZhiDengLu();">登录</a> <span>|</span>
			<a class="as" href="javascript:showQiuZhiZhuCe();">注册</a>
		</div>
	</header>
	<!--隐藏框-->
	<div id="hidebg"></div>

	<!--企业登录-->
	<div id="dl">
		<img src="${absolutePath}/images/xx.png" onclick="hide()">
		<p>
			<a href="#" class="dengLu">企业登录</a> <span>|</span> 
			<a href="javascript:showQiYeZhuCe();" class="zhuCe">企业注册</a>
		</p>
		<form id="companyLogin">
			<table>
				<tr>
					<td>账号：</td>
					<td><input id="account_cd" type="text" name="account"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="password_cd" type="password" name="password"></td>
				</tr>
			</table>
			<label class="btn"> 
				<input type="button" onclick="companyLogin()" value="登录" /> 
				<input type="reset" value="重置" />
			</label>
		</form>
	</div>

	<!--企业注册-->
	<div id="zc">
		<img src="${absolutePath}/images/xx.png" onclick="hide()">
		<p>
			<a href="javascript:showQiYeDengLu()" class="dengLu">企业登录</a> <span>|</span>
			<a class="zhuCe">企业注册</a>
		</p>
		<form id="companyRegister">
			<table>
				<tr>
					<td>账号：</td>
					<td><input id="account_cz" type="text" name="account"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="password1_cz" type="password" name="password"></td>
				</tr>
				<tr>
					<td>请确认密码：</td>
					<td><input id="password2_cz" type="password"></td>
				</tr>
			</table>
			<label class="btn"> 
				<input type="button"onclick="companyRegister()" value="注册" /> 
				<input type="reset" value="重置" />
			</label>
		</form>
	</div>

	<!--求职登录-->
	<div id="userDl">
		<img src="${absolutePath}/images/xx.png" onclick="hide()">
		<p>
			<a class="dengLu">求职登录</a>
		</p>
		<form id="applicantLogin">
			<table>
				<tr>
					<td>账号：</td>
					<td><input id="account_ad" type="text" name="account"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="password_ad" type="password" name="password"></td>
				</tr>
			</table>
			<label class="btn"> 
				<input type="button" onclick="applicantLogin()" value="登录" /> 
				<input type="reset" value="重置" />
			</label>
		</form>
	</div>

	<!--求职注册-->
	<div id="userZc">
		<img src="${absolutePath}/images/xx.png" onclick="hide()">
		<p><a class="zhuCe">求职注册</a></p>
		<form id="applicantRegister">
			<table>
				<tr>
					<td>账号：</td>
					<td><input id="account_az" type="text" name="account" id="account"></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input id="password1_az" type="password" name="password" id="password"></td>
				</tr>
				<tr>
					<td>请确认密码：</td>
					<td><input id="password2_az"  type="password"></td>
				</tr>
			</table>
			<label class="btn"> 
				<input type="button" onclick="applicantRegister()" value="注册" /> 
				<input type="reset" value="重置" />
			</label>
		</form>
	</div>
	
	<!-- 主页 -->
	<section id="section">
		<div class="lSection">
			<ul class="ulcolor">
				<li><a id="a1" href="#" onclick="showTotal()">全部职位列表</a></li>
				<li><a href="#" onclick="showApplyList('计算机/互联网')">计算机/互联网</a></li>
				<li><a href="#" onclick="showApplyList('市场与销售')">市场与销售</a></li>
				<li><a href="#" onclick="showApplyList('电子/通讯')">电子/通讯</a></li>
				<li><a href="#" onclick="showApplyList('金融/经济')">金融/经济</a></li>
				<li><a href="#" onclick="showApplyList('医疗卫生')">医疗卫生</a></li>
				<li><a href="#" onclick="showApplyList('公众服务')">公众服务</a></li>
				<li><a href="#" onclick="showApplyList('法律')">法律</a></li>
				<li><a href="#" onclick="showApplyList('财务')">财务</a></li>
				<li><a href="#" onclick="showApplyList('设计')">设计</a></li>
				<li><a href="#" onclick="showApplyList('机械')">机械</a></li>
				<li><a href="#" onclick="showApplyList('技工')">技工</a></li>				
				<li><a href="#" onclick="showApplyList('经营管理')">经营管理</a></li>
				<li><a href="#" onclick="showApplyList('客户服务')">客户服务</a></li>
				<li><a href="#" onclick="showApplyList('酒店/餐饮')">酒店/餐饮</a></li>
				<li><a href="#" onclick="showApplyList('化工/生物')">化工/生物</a></li>								
				<li><a href="#" onclick="showApplyList('物流/交通运输')">物流/交通运输</a></li>
			</ul>
		</div>
		<div class="mSection">
			<form class="souSuo">
				<span class="sou"><input id="searchContent" type="text"
					placeholder="请输入" /></span> <span class="submit"><input
					type="button" value="搜索" onclick="search()" /></span>
			</form>
			
			<div id="newJobs1">
				<p class="title">职位列表</p>
				<div class="newApply">
					<table>
						<c:forEach items="${jobList}" var="job">
							<tr>
								<td>企业:<a target="_blank" href="${absolutePath}/companydetail/detail?id=${job.getCompanyid()}&from=nologin">${job.getCompanyname()}</a></td>
								<td>职位:<a target="_blank"href="${absolutePath}/job/detail?id=${job.getId()}&from=nologin">${job.getName()}</a></td>
								<td>时间:<fmt:formatDate value="${job.getLastupdatetime()}" pattern="yyyy-MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="jobsList1">
				<p class="title">职位列表</p>
				<div id="newApply" class="newApply">
			
				</div>
			</div>
		</div>
		<div class="rSection">
			<div id="newsDiv">
				<p class="title">新闻</p>
				<div class="news">
					<table>
						<c:forEach items="${newsList}" var="news">
							<tr>
								<td><img src="${absolutePath}/images/item.gif"><a target="_Blank" href="${absolutePath}/new/detail?id=${news.getId()}&from=nologin">${news.getTitle()}</a></td>
								<td><fmt:formatDate value="${news.getCreatetime()}" pattern="MM-dd" /></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<!-- <div class="hr"></div> -->
			<img src="${absolutePath}/images/hr.png" alt="" class="hr"/>
			<div id="calendarDiv">			
				<div id = "box" class = "calendar"></div>
			</div>
		</div>
		<!--返回顶部-->
		<div id="return">
			<a href="#header" target="_self"><img src="${absolutePath}/images/returntop.jpg"></a> 
		</div>
	</section>

	<%@ include file="footer.jsp" %>
	
	<script type="text/javascript">
		$(function(){
			var ulcolor =$(".ulcolor a");
			ulcolor.click(function(){
				ulcolor.removeClass("licolor"); 
				$(this).addClass("licolor");
		                return false;
			});
		});
		window.onscroll = function() {
			var scrollHeight = document.body.scrollTop || document.documentElement.scrollTop;
			if (scrollHeight > 10) {
				document.getElementById("return").style.display = 'block';
			} else {
				document.getElementById("return").style.display = 'none';
			}
		}
		function applicantLogin() {
			var account_ad = $("#account_ad").val();
			var password_ad = $("#password_ad").val();
			var reg_ad = /^[a-zA-Z0-9]{6,16}$/ ;
			if (!reg_ad.test(account_ad)) {
				alert("请输入6-16位数字或字母组成的用户名！");
				return;
			} else if (!reg_ad.test(password_ad)) {
				alert("请输入6-16位数字或字母组成的密码!");
				return;
			}

			var url = "${absolutePath}/applicantaccount/login";
			var parameters = $('#applicantLogin').serialize();
			$.ajax({
						url : url,
						data : parameters,
						type : "POST",
						dataType : 'json',
						success : function(json) {
							alert(json.message);
							if (json.status != 1) {
								alert(json.message);
								return;
							} else {
								window.location.href = "${absolutePath}/applicantdetail/home";
							}
						}
					})
		}

		function applicantRegister() {
			var account_az = $('#account_az').val();
			var password1_az = $('#password1_az').val();
			var password2_az = $('#password2_az').val();
			var reg_az = /^[a-zA-Z0-9]{6,16}$/ ;
			if (account_az == "") {
				alert("用户名不能为空！");
				return;
			} else if (!reg_az.test(account_az)) {
				alert("请输入6-16位数字或字母组成的用户名！");
				return;
			} else if (!reg_az.test(password1_az)) {
				alert("请输入6-16位数字或字母组成的密码！");
				return;
			} else if (!reg_az.test(password2_az)) {
				alert("请输入6-16位数字或字母组成的密码！");
				return;
			} else if (password1_az != password2_az) {
				alert("请两次输入相同的密码！");
				return;
			}
			var url = "${absolutePath}/applicantaccount/register";
			var parameters = $('#applicantRegister').serialize();
			$.ajax({
				url : url,
				data : parameters,
				type : "POST",
				dataType : 'json',
				success : function(json) {
					alert(json.message);
					window.location.href="${absolutePath}/index.jsp";
				}
			})
		}

		function companyRegister() {
			var account_cz = $('#account_cz').val();
			var password1_cz = $('#password1_cz').val();
			var password2_cz = $('#password2_cz').val();
			var reg_cz = /^[a-zA-Z0-9]{6,16}$/;
			if (account_cz == "") {
				alert("用户名不能为空！");
				return;
			} else if (!reg_cz.test(account_cz)) {
				alert("请输入6-16位数字或字母组成的用户名！");
				return;
			} else if (!reg_cz.test(password1_cz)) {
				alert("请输入6-16位数字或字母组成的密码！");
				return;
			} else if (!reg_cz.test(password2_cz)) {
				alert("请输入6-16位数字或字母组成的密码！");
				return;
			} else if (password1_cz != password2_cz) {
				alert("请两次输入相同的密码！");
				return;
			}

			var url = "${absolutePath}/companyaccount/register";
			var parameters = $('#companyRegister').serialize();
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

		function companyLogin() {
			var account_cd = $("#account_cd").val();
			var password_cd = $("#password_cd").val();
			var reg_cd = /^[a-zA-Z0-9]{6,16}$/;
			if (!reg_cd.test(account_cd)) {
				alert("请输入6-16位数字或字母组成的用户名！");
				return;
			} else if (!reg_cd.test(password_cd)) {
				alert("请输入6-16位数字或字母组成的密码！");
				return;
			}

			var url = "${absolutePath}/companyaccount/login";
			var parameters = $('#companyLogin').serialize();
			$.ajax({
						url : url,
						data : parameters,
						type : "POST",
						dataType : 'json',
						success : function(json) {
							alert(json.message);
							if (json.status != 1) {
								alert(json.message);
								return;
							} else {
								window.location.href = "${absolutePath}/companydetail/home";
							}
						}
					})
		}

		function search() {
			var name = document.getElementById("searchContent").value;
			window.location.href = "${absolutePath}/job/search?name=" + name + "&from=nologin";
		}
		
		
		
		function formatDateTime(inputTime) {
		    var date = new Date(inputTime);
		    var y = date.getFullYear();
		    var m = date.getMonth() + 1;
		    m = m < 10 ? ('0' + m) : m;
		    var d = date.getDate();
		    d = d < 10 ? ('0' + d) : d;
		    var h = date.getHours();
		    h = h < 10 ? ('0' + h) : h;
		    var minute = date.getMinutes();
		    var second = date.getSeconds();
		    minute = minute < 10 ? ('0' + minute) : minute;
		    second = second < 10 ? ('0' + second) : second;
		    return y + '-' + m + '-' + d;
		}
		
		function showTotal(){
			document.getElementById("newJobs1").style.display = "block";
			document.getElementById("jobsList1").style.display = "none";
			document.getElementById("a1").style.color="#00c000";
		}
		
		function showApplyList(category) {
			document.getElementById("newJobs1").style.display = "none";
			document.getElementById("jobsList1").style.display = "block";
			document.getElementById("a1").style.color="black";
			
			var url = "${absolutePath}/job/searchJobsByCategory?category="+category;
			$.ajax({
				url:url,
				type:"GET",
				dataType:'json',
				success:function(json){
					if(json.status==1){
						var jobList = json.data;
						var string = "";
						string += "<table>";
						for(var i in jobList){
							string += "<tr>";
							string += "<td>";
							string += "企业:<a target=\"_blank\" href=\"${absolutePath}/companydetail/detail?id="+jobList[i].companyid+"&from=nologin\">"+jobList[i].companyname+"</a>";
							string += "</td>";
							string += "<td>";
							string += "职位:<a target=\"_blank\" href=\"${absolutePath}/job/detail?id="+jobList[i].id+"&from=nologin\">"+jobList[i].name+"</a>";
							string += "</td>";
							string += "<td>";
							string += "时间:" + formatDateTime(jobList[i].lastupdatetime);
							string += "</td>";
							string += "</tr>";
						}
					string = string + "</table>";
					document.getElementById("newApply").innerHTML=string;
					}else {
						document.getElementById("newApply").innerHTML="<p>没有结果！</p>";
					}
				}
			});
		}
		
		
		/*日历 */
		var cal = (function(){
	        var week = ["日","一","二","三","四","五","六"];

	        function isLeapYear(year){
	            if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0) return true;
	            else return false;
	        }

	        function haveDays(year,month){
	            switch(month){
	                case 1:return 31;
	                case 2:return isLeapYear(year)?29:28;
	                case 3:return 31;
	                case 4:return 30;
	                case 5:return 31;
	                case 6:return 30;
	                case 7:return 31;
	                case 8:return 31;
	                case 9:return 30;
	                case 10:return 31;
	                case 11:return 30;
	                case 12:return 31;
	            }
	        }

	        //构造函数
	        var calendar = function(id){
	            this.box = document.getElementById(id);
	            this.year = new Date().getFullYear();         //记录实际的年份，用于重置日历
	            this.month = new Date().getMonth() + 1;       //记录实际的月份
	            this.date = new Date().getDate();             //记录实际的星期
	            this.fd = 0;                                  //当月第一天的星期
	            this.dnum = 0;                                //当月的天数
	            this.ldnum = 0;                               //上月的天数
	            this.cYear = 0;                               //当前的年份
	            this.cMonth = 0;                              //当前的月份
	            this.allTd = null;                            //缓存日期的表格里所有的td标签，便于更新日历
	            this.viewYear = null;                         //显示年份的标签，可以设置年份
	            this.viewMonth = null;                        //显示月份的标签，可以设置月份
	        }

	        //方法
	        calendar.prototype = {
	            constructor:calendar,
	            init:function(){
	                this.fd = new Date(this.month + "/" + "1" +"/" + this.year).getDay();
	                this.dnum = haveDays(this.year,this.month);
	                this.ldnum = haveDays(this.year,this.month > 1?this.month - 1:12);
	                this.cYear = this.year;
	                this.cMonth = this.month;

	                var yBack = document.createElement("input");
	                var mBack = document.createElement("input");
	                var mAhead = document.createElement("input");
	                var yAhead = document.createElement("input");
	                this.viewYear = document.createElement("input");
	                this.viewMonth = document.createElement("input");

	                mBack.type = "button";
	                mAhead.type = "button";
	                yBack.type = "button";
	                yAhead.type = "button";

	                yBack.style.width = "46px";
	                mBack.style.width = "35px";
	                mAhead.style.width = "35px";
	                yAhead.style.width = "46px";
	                this.viewYear.style.width = "50px";
	                this.viewYear.style.fontSize = "18px";
	                this.viewMonth.style.width = "35px";
	                this.viewMonth.style.fontSize = "18px";

	                var t = this;
	                yBack.addEventListener("click",function(){
	                    t.update(-1,0);
	                },false);
	                mBack.addEventListener("click",function(){
	                    t.update(0);
	                },false);
	                this.viewYear.addEventListener("keyup",function(e){
	                    if(e.keyCode == 13|| window.event.keyCode == 13){
	                        t.update();
	                    }
	                },false);
	                this.viewMonth.addEventListener("keyup",function(e){
	                    if(e.keyCode == 13|| window.event.keyCode == 13){
	                        t.update();
	                    }
	                },false);
	                mAhead.addEventListener("click",function(){
	                    t.update(1);
	                },false);
	                yAhead.addEventListener("click",function(){
	                    t.update(-1,1);
	                },false);

	                yBack.value = "<<";
	                mBack.value = "<";
	                mAhead.value = ">";
	                yAhead.value = ">>";
	                this.viewYear.value = this.cYear;
	                this.viewMonth.value = this.cMonth;

	                var table = document.createElement("table");
	                table.width = "255px";
	                for(var i = 0;i < 7;i++){
	                    var tr = document.createElement("tr");
	                    if(i == 0){
	                        for(var j = 0;j < 7;j++){
	                            var th = document.createElement("th");
	                            th.innerHTML = week[j];
	                            tr.appendChild(th);
	                        }
	                    }
	                    else{
	                        for(var j = 0;j < 7;j++){
	                            var td = document.createElement("td");
	                            tr.appendChild(td);
	                        }
	                    }
	                    table.appendChild(tr);
	                }

	                var frag = document.createDocumentFragment();
	                frag.appendChild(yBack);
	                frag.appendChild(mBack);
	                frag.appendChild(this.viewYear);
	                frag.appendChild(this.viewMonth);
	                frag.appendChild(mAhead);
	                frag.appendChild(yAhead);
	                frag.appendChild(table);
	                this.box.appendChild(frag);

	                this.allTd = table.getElementsByTagName("td");
	                this.setContent();
	            },
	            setContent:function(){                            //设置日期表格
	                for(var i = 0;i < this.allTd.length;i++){
	                    if(i < this.fd){
	                        this.allTd[i].innerHTML = this.ldnum - this.fd + i + 1;
	                        this.allTd[i].style.color = "#d6d6d6";
	                        this.allTd[i].style.borderRadius = "25px";

	                    }
	                    else if(i > this.dnum + this.fd - 1){
	                        this.allTd[i].innerHTML = i - this.dnum - this.fd + 1;
	                        this.allTd[i].style.color = "#d6d6d6";
	                        this.allTd[i].style.borderRadius = "25px";
	                    }
	                    else{
	                        this.allTd[i].innerHTML = i - this.fd + 1;
	                        this.allTd[i].style.color = "#000000";
	                        if(this.cYear == this.year && this.cMonth == this.month && i - this.fd + 1 == this.date)
	                            this.allTd[i].style.backgroundColor = "lightblue";
	                            this.allTd[i].style.borderRadius = "25px";
	                            this.allTd[i].style.width = "28px";
	                            this.allTd[i].style.height = "25px";
	                    }
	                }
	            },
	            update:function(){ 
	            	//更新日期
	                if(arguments[0] == 0){
	                    if(this.cMonth <= 1){
	                        this.cYear -= 1;
	                        this.cMonth = 12;
	                    }
	                    else this.cMonth -= 1;
	                }
	                else if(arguments[0] == 1){
	                    if(this.cMonth >= 12){
	                        this.cYear += 1;
	                        this.cMonth = 1;
	                    }
	                    else this.cMonth += 1;
	                }
	                else if(arguments[1] == 0){
	                    this.cYear -= 1;
	                }
	                else if(arguments[1] == 1){
	                    this.cYear += 1;
	                }
	                else{
	                    this.cYear = parseInt(this.viewYear.value);
	                    this.cMonth = parseInt(this.viewMonth.value);
	                }

	                this.viewYear.value = this.cYear;
	                this.viewMonth.value = this.cMonth;
	                this.fd = new Date(this.cMonth + "/" + 1 + "/" + this.cYear).getDay();
	                this.dnum = haveDays(this.cYear,this.cMonth);
	                this.ldnum = haveDays(this.cYear,this.cMonth > 1?this.cMonth - 1:12);
	                this.setContent();
	            },
	            reset:function(){ 
	            	//重置日历
	                this.viewYear.value = this.year;
	                this.viewMonth.value = this.month;
	                this.update();
	            }
	        }
	        return calendar;
	    })();

	    var ca = new cal("box");
	    ca.init();
	</script>
</body>
</html>
