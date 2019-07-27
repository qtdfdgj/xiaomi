<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <link rel="stylesheet" type="text/css" href="./css/green.css">
    <script src="./js/registerCheck.js"></script>
    <script type="text/javascript">
    	function check()
    	{
    		var res=document.getElementById("res").value;
    		if(res=="oldpasswordiswrong"){
    			alert("旧密码错误！");
    		}
    		if(res=="changefailed")
    		{
    			alert("修改失败错误！");
    		}
    	}
        function tijiao() {
    		document.form1.submit();
    		//alert("正在修改。。。");
    		//history.back(-1);
    	}
    </script>
</head>
<body onload="check()">
<form name = "form1" action="UserServlet" method="post" class="smart-green">
<input type="hidden"  name = "operate" value= "changepassword"/>
    <h1 class="bk">修改密码</h1>
    <div class="modifypwd">
        <input id="oldpass" type="password" name="oldpass" placeholder="请输入原密码" required/><span id="outpass">&nbsp;</span>
        <br>
        <input id="pwd" type="password" name="contact" placeholder="请输入新密码" required  onblur="checklen(this.value)"/><span id="pass">请输入6位以上包含字母和数字的字符</span>  <br>
        <input id="rpwd" type="password" name="contact" placeholder="请再次输入新密码" required onblur="check()"/><span id="repass">两次密码要输入一致哦</span></div>
        <input id="res" type="text" value=<%=request.getParameter("freason")%> hidden/>
        <br>
         <label> <span></span> <input type="button" class="button" value="提交" onclick="tijiao()"/></label>
    </div>
</form>
</body>
</html>