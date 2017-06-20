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
    <link rel="stylesheet" href="${absolutePath }/css/admin/login.css">
    <script type="text/javascript" src="${absolutePath}/js/jquery-3.1.1.min.js"></script>
</head>
<body>
    <div id="login">
        <form id="loginFrom">
            <p id="title">求职招聘系统</p>
            <table>
                <tr>
                    <td>帐号: </td>
                    <td><input id="account" name="account" type="text"></td>
                </tr>
                <tr>
                    <td>密码: </td>
                    <td><input id="password" name="password" type="password"></td>
                </tr>
            </table>
            <label id="btn">
                <input type="button" onclick="login()" value="登录"/>
                <input type="reset" value="重置"/>
            </label>
        </form>
    </div>
	
    <!--footer-->
    <footer>
        <p>© 2017 by yuxuan. All Rights Reserved.</p>
    </footer>
	<canvas id="myCanvas"></canvas>
	<script type="text/javascript">
		 function login(){
			 var account = $("#account").val();
				var password = $("#password").val();
				var reg = /^[a-zA-Z0-9]{5,16}$/;
				if (!reg.test(account)) {
					alert("请输入5-16位数字或字母组成的用户名！");
					return;
				} else if (!reg.test(password)) {
					alert("请输入5-16位数字或字母组成的密码！");
					return;
				} 
		
			var url = "${absolutePath}/admin/confirmLogin";
			var parameters=$('#loginFrom').serialize();
			$.ajax({
				url: url,
				type: "GET",
				data: parameters,
				dataType: 'json',
				success: function(json){
					if(json.status==1){
						 alert(json.message);
						 window.location.href="${absolutePath}/admin/home";
					}else{
						alert(json.message);
					}
				}
			});
		 }

		 /* 背景动画 */
		 	//获取窗口宽高
		    var w = window.innerWidth;
		    var h = window.innerHeight;

		    var canvas = document.getElementById("myCanvas");
		    var ctx = canvas.getContext("2d");
		    //设置画布宽高与窗口宽高一样
		    canvas.width = w;
		    canvas.height = h;
		    //随机数函数
		    function fnRandom(min,max){
		        return parseInt((max-min)*Math.random()+min+1)
		    }
		    function Round(){
		        this.r = fnRandom(10,30);
		        this.diam = this.r*2;
		        //随机位置
		        var x = fnRandom(0,canvas.width - this.r);
		        this.x = x<this.r?this.r:x;
		        var y = fnRandom(0,canvas.height-this.r);
		        this.y = y<this.r?this.r:y
		        //随机速度
		        var speed = fnRandom(2,4)/10
		        this.speedX = fnRandom(0,4)>2?speed:-speed;
		        this.speedY = fnRandom(0,4)>2?speed:-speed;
		        //颜色

		        this.color = "#CDE0FF";
		    }
		    Round.prototype.draw = function(){
		        //绘制函数
		        ctx.fillStyle = this.color;
		        ctx.beginPath()
		        ctx.arc(this.x,this.y,this.r,0,Math.PI*2,true);
		        ctx.closePath();
		        ctx.fill();
		    };
		    Round.prototype.move = function(){
		        this.x+=this.speedX;
		        if(this.x>canvas.width-this.r){
				//this.speedX*=-1;
		            this.x=this.r

		        }else if(this.x<this.r){
		            this.x=canvas.width-this.r
		        }
		        this.y+=this.speedY;
		        if(this.y>canvas.height-this.r){
				//this.speedY*=-1;
		            this.y=this.r
		        }else if(this.y<this.r){
		            this.y=canvas.height-this.r
		        }
		    };
		    //使用Round
		    var allRound = [];
		    function initRound(){
		        //初始化30个圆形对象,放到数组中
		        for(var i = 0 ; i<30;i++){
		            var obj = new Round();
		            obj.draw();
		            obj.move();
		            allRound.push(obj);


		        }
		    }
		    initRound();
		    var dxdy = []
		    function roundMove(){
		        ctx.clearRect(0,0,canvas.width,canvas.height);
		        //遍历所有的圆形对象,让对象自己重绘,移动
		        for (var i = 0 ;i <allRound.length;i++) {
		            var round = allRound[i];
		            round.draw();
		            round.move();

		            dxdy[i]={
		                dx:round.x,
		                dy:round.y
		            };
		            var dx = dxdy[i].dx;
		            var dy =dxdy[i].dy;
		            for (var j=0;j<i;j++) {
		                var sx = dxdy[j].dx;
		                var sy = dxdy[j].dy;
		                l = Math.sqrt((dx-sx)*(dx-sx)+(dy-sy)*(dy-sy));
		                var C = 1/l*7-0.009;
		                var o = C > 0.03 ? 0.03 : C;
		                ctx.strokeStyle = 'rgba(0,0,0,'+ o +')'
		                console.log(l);
		                ctx.beginPath()
		                ctx.lineWidth=2;
		                ctx.moveTo(dxdy[i].dx,dxdy[i].dy)
		                ctx.lineTo(dxdy[j].dx,dxdy[j].dy);
		                ctx.closePath()
		                ctx.stroke()
		            }
		        }
		        window.requestAnimationFrame(roundMove)
		    }
		    roundMove();
	</script>
</body>
</html>
