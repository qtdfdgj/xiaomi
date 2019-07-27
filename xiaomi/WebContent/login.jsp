<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="孔伟鑫"/>
		<title>会员登录</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<script src="./js/gVerify.js"></script>
		<script>
			function check(){
				var state=document.getElementById("ErroeMess").getAttribute("value");
				if(state=="n")
				{
				document.getElementById("ErroeMess").innerHTML="用户名或密码错误";
				}
		    }
		</script>
	</head>
	<body onload="check()">
		<!-- login -->
		<div class="top center">
			<div class="logo center">
				<a href="./index.html" target="_self"><img src="./image/mistore_logo.png" alt=""></a>
			</div>
		</div>
		<form  method="post" action="UserServlet" class="form center">
		<input type="hidden" name="operate" value="login"/>
		<div class="login">
			<div class="login_center">
				<div class="login_top">
					<div class="left fl">会员登录</div>
					<div class="right fr">您还不是我们的会员？<a href="./register.jsp" target="_self">立即注册</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="login_main center">
					<div class="username">用户名:&nbsp;<input class="shurukuang" type="text" name="username" placeholder="请输入你的用户名" required/></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;<input class="shurukuang" type="password" name="password" placeholder="请输入你的密码" required/></div>
					<div class="username">
						<div class="left fl">
                            验证码:&nbsp;<input id="code_input" class="yanzhengma" type="text" name="username" placeholder="请输入验证码" required/>
                　　　　　　<div id="v_container" style="width: 100px;height: 40px;position: relative;top: -120px;left: 200px;">
                　　　　　　　　<canvas id="verifyCanvas" width="100" height="30" style="cursor: pointer;"></canvas>
                　　　　　　</div>
                        </div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="ErroeMes" id="ErroeMess" value=<%=request.getAttribute("freason")%>>&nbsp;</div>
				<div class="login_submit">
					<input class="submit" id="my_button" type="submit" name="submit" value="立即登录">
				</div>
				
			</div>
		</div>
		</form>
		<footer>
			<div class="copyright">简体 | 繁体 | English | 常见问题</div>
			<div class="copyright">小米公司版权所有-京ICP备10046444-<img src="./image/ghs.png" alt="">京公网安备11010802020134号-京ICP证110507号</div>

		</footer>
	</body>
</html>
<script>
	var verifyCode = new GVerify("v_container");
	document.getElementById("code_input").onblur= function(){
		var res = verifyCode.validate(document.getElementById("code_input").value);
			if(res){
				document.getElementById("my_button").removeAttribute("disabled");
			}else{
				document.getElementById("code_input").value = "";
			}
	}
</script>