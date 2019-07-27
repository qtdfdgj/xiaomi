<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" import="java.util.*,com.xiaomi.dao.vo.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
        <meta name="author" content="order by dede58.com"/>
		<title>立即购买-小米商城</title>
		<link rel="stylesheet" type="text/css" href="./css/style.css">
		<
		<script type="text/javascript">
		function change(){
			document.form1.action="CartServlet";
			document.form1.submit();
		}
		function check(){
			var state=document.getElementById("ErroeMess").value;
			if(state=="n")
			{
			alert("加购成功，快去购物车结算吧。");
			}
	    }

		</script>
	</head>
	<body onload="check()">
	<%
	List listVersion=new ArrayList();
	List listid=new ArrayList();
	List<Good_version> version_list=(List<Good_version>)request.getAttribute("versionslist");
	Goods Good=(Goods)request.getAttribute("good");
	for(int i=0;i<version_list.size();i++){
		listVersion.add(version_list.get(i).getVersion()+"  "+version_list.get(i).getPrice());
		listid.add(version_list.get(i).getId());
		System.out.println("gggggggggggg"+version_list.get(i).getId());
	}
	
	Iterator itV=listVersion.iterator();
	Iterator itI=listid.iterator();
	 %>
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
					<div class="gouwuche fr"><a href="CartServlet?operate=showCarts">购物车</a></div>
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
							<li><a href="">消息通知</a></li>
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

	
	<!-- xiangqing -->
	<form action="goumai.jsp" method="get" name="form1">
	<input type="hidden" id="operate" name="operate" value="addCart"/>
	<div class="xiangqing">
		<div class="neirong w">
			<div class="xiaomi6 fl"><%=Good.getName() %></div>
			<nav class="fr">
				<li><a href="">概述</a></li>
				<li>|</li>
				<li><a href="">变焦双摄</a></li>
				<li>|</li>
				<li><a href="">设计</a></li>
				<li>|</li>
				<li><a href="">参数</a></li>
				<li>|</li>
				<li><a href="">F码通道</a></li>
				<li>|</li>
				<li><a href="">用户评价</a></li>
				<div class="clear"></div>
			</nav>
			<div class="clear"></div>
		</div>	
	</div>
	
	<div class="jieshao mt20 w">
		<div class="left fl"><img width="600" height="600" src="<%=Good.getImage() %>"></div>
		<div class="right fr">
			<div class="h3 ml20 mt20"><%=Good.getName() %></div>
			<div class="ft20 ml20 mt20">选择版本</div>
			
			<input type="text" id="ErroeMess" hidden value=<%=request.getParameter("freason")%>>
			<table>
			<%while(itV.hasNext()){ String a=(String)itV.next(); String id=(String)itI.next();String a1=a+"  "+id+"  "+Good.getId()+"  "+Good.getImage();%>
			<tr>
			<div class="xzbb ml20 mt10">
			<input type="radio" name="aa" value="<%=a1%>" checked/>
			
				<div class="banben fl">
					<a>
						<span><%=a%> </span>
						
					</a>
				</div>
			</div>
			</tr>
			<%} %>
			</table>
	
			
			<div class="xiadan ml20 mt20">
					<input class="jrgwc"  type="submit" name="jrgwc" value="立即购买"/>
					<input class="jrgwc" type="button" name="jrgwc" value="加入购物车" onclick="change()"/>
				
			</div>
		</div>
		<div class="clear"></div>
	</div>
	</form>
	<!-- footer -->
	

	</body>
</html>