<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>用户注册</title>
		<link rel="stylesheet" type="text/css" href="./css/login.css">
		<script src="./js/gVerify.js"></script>
		<script src="./js/registerCheck.js"></script>
		<script type="text/javascript">
		function checks(){
			var state=document.getElementById("ErroeMess").getAttribute("value");
			if(state=="n")
			{
			 document.getElementById("name").innerHTML="该账号已存在";
			 document.getElementById("name").style.color = "red";
			}
	    }
	</script>
		</script>
	</head>
	<body onload="checks()">
		<form  method="post" action="UserServlet">
		<input type="hidden" name="operate" value="register"/>
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="./index.html" target="_self">小米商城</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" id="username" name="username" placeholder="请输入你的用户名" required onblur="checkname(this.value)"/><span id="name">请不要输入汉字</span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" id="pwd" name="password" placeholder="请输入你的密码" onblur="checklen(this.value)"/><span id="pass">请输入6位以上字符</span></div>

					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="repassword" id="rpwd" placeholder="请确认你的密码" required onblur="check()"/><span id="repass">两次密码要输入一致哦</span></div>
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" id="tel" name="phone" placeholder="请填写正确的手机号" required onblur="validatemobile(this.value)"/><span id="mobile">填写下手机号吧，方便我们联系您！</span></div>
					<div class="username">
						<div class="left fl">
                            验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;<input id="code_input" class="yanzhengma" type="text" name="verify" placeholder="请输入验证码" required/>
                　　　　　　<div id="v_container" style="width: 120px;height: 40px;position: relative;top: -120px;left: 200px;">
                　　　　　　　　<canvas id="verifyCanvas" width="120" height="40" style="cursor: pointer;"></canvas>
                　　　　　　</div>
                        </div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="ErroeMes" id="ErroeMess" value=<%=request.getAttribute("freason")%> visibility="hidden"></div>
				<div class="regist_submit">
					<input class="submit" type="submit" name="submit" value="立即注册" >
				</div>
				
			</div>
		</div>
		</form>
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