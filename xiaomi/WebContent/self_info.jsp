<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<script>
			function openwin() {
				window.open("modify.jsp", "修改信息", "height=370, width=600, top=200,left=600,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
			}
			function editPwd()
			{
				window.open("modifyPwd.jsp", "修改信息", "height=370, width=600, top=200,left=600,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no");
			}
		</script>
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="GoodServlet?operate=showgood" target="_blank">小米商城</a></li>
						<li>|</li>
						<li><a href="">MIUI</a></li>
						<li>|</li>
						<li><a href="">米聊</a></li>
						<li>|</li>
						<li><a href="">游戏</a></li>
						<li>|</li>
						<li><a href="">多看阅读</a></li>
						<li>|</li>
						<li><a href="">云服务</a></li>
						<li>|</li>
						<li><a href="">金融</a></li>
						<li>|</li>
						<li><a href="">小米商城移动版</a></li>
						<li>|</li>
						<li><a href="">问题反馈</a></li>
						<li>|</li>
						<li><a href="">Select Region</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="right fr">
					<div class="gouwuche fr"><a href="OrderServlet?operate=showorder_byuserid">我的订单</a></div>
					<div class="fr">
						<ul>
							<%
								String username = (String)session.getAttribute("username");
								if (username == null)
								{
									out.println("<li><a href='./login.jsp' target='_blank'>登录</a></li>");
									out.println("<li>|</li>");
									out.println("<li><a href='./register.jsp' target='_blank' >注册</a></li>");
								}
								else
								{
									out.println("<li>欢迎您</li>");
									out.println("<li>，</li>");
									out.println("<li>" + username + "</li>");
								}
							%>
							<li></li>
							<li><a href="self_info.jsp">个人中心</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->
	<!-- start banner_x -->
		<div class="banner_x center">
			<a href="./index.html" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul>
					<li><a href="">小米手机</a></li>
					<li><a href="">红米</a></li>
					<li><a href="">平板·笔记本</a></li>
					<li><a href="">电视</a></li>
					<li><a href="">盒子·影音</a></li>
					<li><a href="">路由器</a></li>
					<li><a href="">智能硬件</a></li>
					<li><a href="">服务</a></li>
					<li><a href="">社区</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="小米6&nbsp;小米MIX现货">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->
<!-- self_info -->
	<div class="grzxbj">
		<div class="selfinfo center">
		<div class="lfnav fl">
			<div class="ddzx">订单中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="OrderServlet?operate=showorder_byuserid" >我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="./self_info.jsp" style="color:#ff6700;font-weight:bold;">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="AddressServlet?operate=findAddressByUserId">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr">
			<div class="grzlbt ml40">我的资料</div>
			<div class="subgrzl ml40"><span>用户名</span><span><%=(String)request.getSession().getAttribute("username") %></span></div>
			<div class="subgrzl ml40"><span>手机号</span><span><%=(String)request.getSession().getAttribute("phone") %></span></div>
			<div class="subgrzl ml40"><span>密码</span><span>************</span><a style="color:teal;" href="modifyPwd.jsp" target="_self">修改密码</a></div>
			<div class="subgrzl ml40"><span>性别</span><span><%if((Integer)request.getSession().getAttribute("gender") == 0){
				out.print("女");
			}else{
				out.print("男");
			} %></span></div>
			<div style='width:110px;' class='subgrzl ml40'><span><a href="modify.jsp" target="_self"> 编辑资料</a></span></div>
		</div>
		<div class="clear"></div>
		</div>
	</div>
<!-- self_info -->
		
		<footer class="mt20 center">			
			<div class="mt20">小米商城|MIUI|米聊|多看书城|小米路由器|视频电话|小米天猫店|小米淘宝直营店|小米网盟|小米移动|隐私政策|Select Region</div>
			<div>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号</div> 
			<div>违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</div>
		</footer>
	</body>
</html>