<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改个人信息</title>
    <link rel="stylesheet" type="text/css" href="./css/green.css">
    <script type="text/javascript">
    function tijiao() {
		document.form1.submit();
		//window.location.href="UserServlet?operate=changeMessage";
	}
    </script>
</head>
<body>
<form name = "form1" action="UserServlet" method="post" class="smart-green">
<input type="hidden"  name = "operate" value= "changeMessage"/>
        <h1 class="bk">修改个人信息</h1>
        <div class="modify">

    <br>
        <input id="address" type="text" name="contact" placeholder="请输入电话"/>
        <label><span>性别</span>
            <div class="contain">
            <input type="radio" name="sex" value="0">女
        <input type="radio" name="sex" value="1">男 
            </div> 
        </label>
            <br><br>
         <label> <span></span> <input type="button" class="button" value="提交" onclick ="tijiao()"/></label>
        </div>
</form>
</body>
</html>