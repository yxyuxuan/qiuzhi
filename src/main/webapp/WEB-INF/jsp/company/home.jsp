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
    <link rel="stylesheet" href="${absolutePath }/css/company/home.css">
    <script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>  
</head>
<body>
<!-- 导航 -->
<header id="header">
    <div class="lHeader">
        <p>求职招聘系统</p>
    </div>
    <div class="rHeader">
        <span class="appName">当前用户:${companyDetail.getName()}</span>
        <span>|</span>
        <a href="${absolutePath}/companydetail/center">信息中心</a>
        <span>|</span>
        <a href="#" onclick="exit()">退出</a>
    </div>
</header>

<!-- 主页 -->
<section id="section">
    <div class="lSection">
        <ul class="ulcolor">
				<li><a id="a1" href="#" onclick="showTotal()">全部简历列表</a></li>
				<li><a href="#" onclick="showApplyList('计算机/互联网')">计算机/互联网</a></li>
				<li><a href="#" onclick="showApplyList('市场与销售')">市场与销售</a></li>
				<li><a href="#" onclick="showApplyList('电子/通讯')">电子/通讯</a></li>
				<li><a href="#" onclick="showApplyList('金融/经济')">金融/经济</a></li>
				<li><a href="#" onclick="showApplyList('医疗卫生')">医疗卫生</a></li>
				<li><a href="#" onclick="showApplyList('法律')">法律</a></li>
				<li><a href="#" onclick="showApplyList('财务')">财务</a></li>
				<li><a href="#" onclick="showApplyList('设计')">设计</a></li>
				<li><a href="#" onclick="showApplyList('机械')">机械</a></li>
				<li><a href="#" onclick="showApplyList('技工')">技工</a></li>						
				<li><a href="#" onclick="showApplyList('经营管理')">经营管理</a></li>
				<li><a href="#" onclick="showApplyList('公众服务')">公众服务</a></li>
				<li><a href="#" onclick="showApplyList('客户服务')">客户服务</a></li>
				<li><a href="#" onclick="showApplyList('酒店/餐饮')">酒店/餐饮</a></li>
				<li><a href="#" onclick="showApplyList('化工/生物')">化工/生物</a></li>								
				<li><a href="#" onclick="showApplyList('物流/交通运输')">物流/交通运输</a></li>
			</ul>
    </div>
    <div class="mSection">
        <form class="souSuo">
            <span class="sou"><input id="searchContent" type="text" placeholder="请输入"/></span>
            <span class="submit"><input type="button" value="搜索" onclick="search()"/></span>
        </form>

        <div id="theLastResumeList" class="newApply">
           <p class="title">简历列表</p>
           <table>	
           		<c:forEach items="${resumeList }"  var="resume">
	            	<tr>
	            		<td>求职者:<a target="_blank" href="${absolutePath}/applicantdetail/detail?id=${resume.getApplicantid()}&from=companyHome">${resume.getName()}</a></td>
	            		<td>期望工作:${resume.getExpectjob() }</td>
	            		<td>简历:<a target="_blank" href="${absolutePath}/resume/detail?id=${resume.getId()}&from=companyHome">查看简历</a></td>
	            		<td>时间:<fmt:formatDate value="${resume.getLastupdatetime()}" pattern="yyyy-MM-dd" /></td>
	            	</tr>
	            </c:forEach>
            </table>
        </div>
        <div id="theCategoryResume" class="newApply">
        	<p class="title">简历列表</p>
        	<div id="theCategoryResumeList"></div>
        </div>
    </div>
    <div class="rSection">
	    <div id="newsDiv">
	        <p class="title">新闻</p>
	        <div class="news">
	            <table>
	            		<c:forEach items="${newsList}" var="news">
							<tr>
								<td>
									<img src="${absolutePath}/images/item.gif"><a target="_blank" href="${absolutePath}/new/detail?id=${news.getId()}&from=companyHome">${news.getTitle()}</a>
								</td>
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

<!--友情链接-->
<div id="linkbox">
    <p class="link">友情链接</p>
    <div class="linkcon">
	    <p><a href="http://www.lagou.com/" target="_blank">拉勾网</a><span>丨</span></p>
	    <p><a href="http://jobs.zhaopin.com/" target="_blank">智联招聘</a><span>丨</span></p>
	    <p><a href="http://click.aliyun.com/m/6645/" target="_blank">阿里云</a><span>丨</span></p>
	    <p><a href="http://www.wangxiao.cn" target="_blank">中大网校</a><span>丨</span></p>
	    <p><a href="http://www.xbaixing.com/" target="_blank">百姓网</a><span>丨</span></p>
	    <p><a href="http://www.lagou.com/" target="_blank">找工作</a><span>丨</span></p>
	    <p><a href="http://tech.163.com/" target="_blank">网易科技</a><span>丨</span></p>
	    <p><a href="http://www.lagou.com/shanghai/" target="_blank">上海招聘</a><span>丨</span></p>
	    <p><a href="http://www.imooc.com/" target="_blank">慕课网</a><span>丨</span></p>
	    <p><a href="http://www.kuaiji.com/" target="_blank">会计网</a><span>丨</span></p>
	    <p><a href="http://www.jianzhi8.com/" target="_blank">兼职吧</a><span>丨</span></p>
	    <p><a href="http://www.itjuzi.com/" target="_blank">IT桔子</a><span>丨</span></p>
	    <p><a href="http://www.job592.com/" target="_blank">职业圈</a><span>丨</span></p>
	    <p><a href="http://www.lagou.com/" target="_blank">互联网招聘</a><span>丨</span></p>
	    <p><a href="http://www.qdjhu.com/" target="_blank">前端江湖</a><span>丨</span></p>
	    <p><a href="http://www.webyuansu.cn/" target="_blank">WEB元素</a><span>丨</span></p>
	    <p><a href="http://www.apkbus.com/forum.php" target="_blank">Android开发</a><span>丨</span></p>
	    <p><a href="http://www.ycpai.com/" target="_blank">互联网创业</a><span>丨</span></p>
	    <p><a href="http://www.xjhr.com/" target="_blank">新疆人才网</a><span>丨</span></p>
	    <p><a href="http://www.xilu.com" target="_blank">西陆军事</a><span>丨</span></p>
	    <p><a href="http://www.qlrc.com/" target="_blank">齐鲁人才网</a><span>丨</span></p>
	    <p><a href="http://www.huibo.com" target="_blank">重庆人才网</a><span>丨</span></p>
	    <p><a href="http://www.goodjobs.cn" target="_blank">安徽招聘网</a><span>丨</span></p>
	    <p><a href="http://www.yinhangzhaopin.com/" target="_blank">银行招聘网</a></p>
  	</div>
</div>	

<!--footer-->
<footer>
    <p>© 2017 by yuxuan. All Rights Reserved.</p>
</footer>

<script type="text/javascript">
	$(function(){		
		var ulcolor =$(".ulcolor li a");
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
	
	function exit(){
	   var url = "${absolutePath}/qiuzhi/exit";
	   $.ajax({
	            url : url,
	            type : "POST",
	            dataType: 'json',
	            success : function(json) {
	                alert("退出成功");
	                window.location.href="${absolutePath}/qiuzhi/index";
	         }
	     })

	}
	
	function search(){
		var name = document.getElementById("searchContent").value;
		window.location.href="${absolutePath}/resume/search?name="+name+"&from=companyHome";
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
		document.getElementById("theLastResumeList").style.display = "block";
		document.getElementById("theCategoryResume").style.display = "none";
		document.getElementById("a1").style.color="#00c000";
	}
	function showApplyList(category) {
		document.getElementById("theLastResumeList").style.display = "none";
		document.getElementById("a1").style.color="black";
		document.getElementById("theCategoryResume").style.display = "block";
		var url = "${absolutePath}/resume/searchResumesByCategory?category="+category;
		$.ajax({
			url:url,
			type:"GET",
			dataType:'json',
			success:function(json){
				if(json.status==1){
					var resumeList = json.data;
					var string = "";
					string += "<table>";
					for(var i in resumeList){
						string += "<tr>";
						string += "<td>";
						string += "求职者:<a target=\"_blank\" href=\"${absolutePath}/applicantdetail/detail?id="+resumeList[i].applicantid+"&from=nologin\">"+resumeList[i].name+"</a>";
						string += "</td>";
						string += "<td>";
						string += "期望工作:"+ resumeList[i].expectjob;
						string += "</td>";
						string += "<td>";
						string += "简历:<a target=\"_blank\" href=\"${absolutePath}/resume/detail?id="+resumeList[i].id+"&from=companyHome\">查看简历</a>";
						string += "</td>";
						string += "<td>";
						string += "时间:"+ formatDateTime(resumeList[i].lastupdatetime);
						string += "</td>";
						string += "</tr>";
					}
				string = string + "</table>";
				document.getElementById("theCategoryResumeList").innerHTML=string;
				}else {
					document.getElementById("theCategoryResumeList").innerHTML="<p>没有结果！</p>";
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
