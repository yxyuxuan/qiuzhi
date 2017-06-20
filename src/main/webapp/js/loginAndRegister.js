function hide()  //去除隐藏层和弹出层
{
    document.getElementById("hidebg").style.display="none";
    document.getElementById("dl").style.display="none";
    document.getElementById("zc").style.display="none";
    document.getElementById("userDl").style.display="none";
    document.getElementById("userZc").style.display="none";
}

function showQiYeDengLu ()  //显示隐藏层和弹出层
{
    var hideobj=document.getElementById("hidebg");
    hidebg.style.display="block";  //显示隐藏层
    hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
    document.getElementById("dl").style.display="block";  //显示弹出层
    document.getElementById("zc").style.display="none";
}
function showQiYeZhuCe(){
    var hideobj=document.getElementById("hidebg");
    hidebg.style.display="block";  //显示隐藏层
    hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
    document.getElementById("dl").style.display="none";
    document.getElementById("zc").style.display="block";
}

function showQiuZhiDengLu ()  //显示隐藏层和弹出层
{
    var hideobj=document.getElementById("hidebg");
    hidebg.style.display="block";  //显示隐藏层
    hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
    document.getElementById("userDl").style.display="block";  //显示弹出层
    document.getElementById("userZc").style.display="none";
}
function showQiuZhiZhuCe(){
    var hideobj=document.getElementById("hidebg");
    hidebg.style.display="block";  //显示隐藏层
    hidebg.style.height=document.body.clientHeight+"px";  //设置隐藏层的高度为当前页面高度
    document.getElementById("userDl").style.display="none";
    document.getElementById("userZc").style.display="block";  //显示弹出层
}     
