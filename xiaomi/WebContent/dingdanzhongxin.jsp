<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="com.xiaomi.dao.vo.Order"%>
<%@page import="java.util.List"%>
<%@ page pageEncoding="utf-8" %>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>小米商城-个人中心</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
	</head>
	<body>
	<!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="GoodServlet?operate=showgood" target="_self">小米商城</a></li>
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
					<li><a href="OrderServlet?operate=showorder_byuserid" style="color:#ff6700;font-weight:bold;">我的订单</a></li>
					<li><a href="">意外保</a></li>
					<li><a href="">团购订单</a></li>
					<li><a href="">评价晒单</a></li>
				</ul>
			</div>
			<div class="ddzx">个人中心</div>
			<div class="subddzx">
				<ul>
					<li><a href="self_info.jsp">我的个人中心</a></li>
					<li><a href="">消息通知</a></li>
					<li><a href="">优惠券</a></li>
					<li><a href="AddressServlet?operate=findAddressByUserId">收货地址</a></li>
				</ul>
			</div>
		</div>
		<div class="rtcont fr" style="overflow: auto;">
			<div class="ddzxbt">交易订单</div>
			<div class="ddxq">
			<%
				List<Order> orderList = (List<Order>)request.getAttribute("orderList");
				System.out.println("获取到" + username + "的订单列表：" + orderList);
				if (orderList != null)
				{
					List<String> orderIds = new ArrayList<String>();
					for (Order order : orderList)
					{
						int state = order.getState();
						String status = null;
						if (state == 0) status = "未支付";
						else if (state == 1) status = "已支付";
						else if (state == 2) status = "已取消";
						else status = "已完成";
						
						Date date = order.getOrder_time();
						int y = date.getYear() + 1900;
						int m = date.getMonth();
						m++;
						int d = date.getDate();
						
						int h = date.getHours();
						String strH = Integer.toString(h);
						if (h < 10) strH = "0" + Integer.toString(h);
						
						int mi = date.getMinutes();
						String strMi = Integer.toString(mi);
						if (mi < 10) strMi = "0" + Integer.toString(mi);
						
						//int s = date.getSeconds();
						//String strS = Integer.toString(s);
						//if (s < 10) strS = "0" + Integer.toString(s);
						
						String time = Integer.toString(y) + "-" + Integer.toString(m) + "-" + Integer.toString(d) + " " + strH + ":" + strMi;
			%>
				<div style="margin: 19px 3px 0 0;" class="ddspt fl"><a href="OrderServlet?operate=showorder_byorderid&orderId=<%= order.getOid() %>"><img width="80px" height="80px" src=<%= order.getImage() %> alt="无预览"></a></div>
				<div class="ddbh fl">订单号:<%= order.getOid() %></div>
				<div class="ztxx fr">
					<ul>
						<li><%= status %></li>
						<li>￥<%= order.getPrice() %>×<%=order.getNum() %></li>
						<% orderIds.add(order.getOid()); %>
						<li><%= time %></li>
						<% if (state == 0) { %>
						<li><a  style="color:rgb(255,0,0);" href="AlipayServlet?total_amount=<%=order.getPrice()%>">去支付></a></li>
						<% } else { %>
						<li></li>
						<% } %>
						<div class="clear"></div>
					</ul>
				</div>
				<div class="clear"></div>
			<% }
					session.setAttribute("orderIds",orderIds);
					} 
			%>
			</div>
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